#!/usr/bin/env bash
set -euo pipefail

# Download the current stable Flutter SDK archive (no git clone required)
FLUTTER_HOME="$HOME/flutter"
BASE="https://storage.googleapis.com/flutter_infra_release/releases"
RELEASE_JSON=$(curl -fsSL "$BASE/releases_linux.json" | node -e '
  let s = ""; process.stdin.on("data", d => s += d).on("end", () => {
    const j = JSON.parse(s);
    const r = j.releases.find(r => r.hash === j.current_release.stable && r.channel === "stable");
    process.stdout.write(JSON.stringify(r));
  });')
ARCHIVE=$(node -e 'process.stdout.write(JSON.parse(process.argv[1]).archive)' "$RELEASE_JSON")

if [ ! -x "$FLUTTER_HOME/bin/flutter" ]; then
  echo "Downloading Flutter: $ARCHIVE"
  mkdir -p "$HOME"
  curl -fsSL "$BASE/$ARCHIVE" | tar -xJ -C "$HOME"
fi

export PATH="$FLUTTER_HOME/bin:$PATH"

# First run builds the flutter tool and engine cache
flutter --version >/dev/null 2>&1 || true

# Pin the SDK version metadata so Flutter doesn't depend on git to detect it
# (git may be restricted in some build environments, yielding 0.0.0-unknown)
node -e '
  const fs = require("fs");
  const [file, rel] = [process.argv[1], JSON.parse(process.argv[2])];
  let cur = {};
  try { cur = JSON.parse(fs.readFileSync(file, "utf8")); } catch {}
  const date = rel.release_date.replace("T", " ").replace(/\.\d+Z$|Z$/, " +0000");
  const out = {
    engineRevision: rel.hash,
    devToolsVersion: "unknown",
    ...cur,
    frameworkVersion: rel.version,
    flutterVersion: rel.version,
    channel: "stable",
    repositoryUrl: "https://github.com/flutter/flutter.git",
    frameworkRevision: rel.hash,
    frameworkCommitDate: date,
    dartSdkVersion: rel.dart_sdk_version,
  };
  fs.mkdirSync(require("path").dirname(file), { recursive: true });
  fs.writeFileSync(file, JSON.stringify(out, null, 2));
' "$FLUTTER_HOME/bin/cache/flutter.version.json" "$RELEASE_JSON"

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release
