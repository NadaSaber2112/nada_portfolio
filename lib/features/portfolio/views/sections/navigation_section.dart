part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _NavigationSectionExtension on _PortfolioPageState {
  Widget _nav() => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.92),
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor.withOpacity(.12),
        ),
      ),
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1160),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: LayoutBuilder(
            builder: (context, c) {
              final compact = c.maxWidth < 650;
              return Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: accent.withOpacity(.13),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: accent,
                      size: 21,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Nada.dev',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  if (!compact)
                    ...[
                      ('About', 'about'),
                      ('Skills', 'skills'),
                      ('Projects', 'projects'),
                      ('Experience & Learning', 'journey'),
                      ('Contact', 'contact'),
                    ].map(
                      (item) => TextButton(
                        onPressed: () => _go(item.$2),
                        child: Text(
                          item.$1,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  else
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu_rounded),
                      onSelected: _go,
                      itemBuilder: (_) => const [
                        PopupMenuItem(value: 'about', child: Text('About')),
                        PopupMenuItem(value: 'skills', child: Text('Skills')),
                        PopupMenuItem(
                          value: 'projects',
                          child: Text('Projects'),
                        ),
                        PopupMenuItem(
                          value: 'journey',
                          child: Text('Experience & Learning'),
                        ),
                        PopupMenuItem(value: 'contact', child: Text('Contact')),
                      ],
                    ),
                  IconButton(
                    tooltip: widget.isDark
                        ? 'Switch to light mode'
                        : 'Switch to dark mode',
                    onPressed: widget.onToggleTheme,
                    icon: Icon(
                      widget.isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      size: 20,
                    ),
                  ),
                  if (!compact) const SizedBox(width: 8),
                  if (!compact)
                    FilledButton(
                      onPressed: () => _go('contact'),
                      child: const Text('Hire me'),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
}
