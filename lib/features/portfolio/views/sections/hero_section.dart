part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _HeroSectionExtension on _PortfolioPageState {
  Widget _hero() => _sectionShell(
    child: LayoutBuilder(
      builder: (context, c) {
        final stacked = c.maxWidth < 760;
        final headingSize = stacked ? 42.0 : (c.maxWidth < 980 ? 48.0 : 60.0);
        final text = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF0C302F),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFF167A6A).withOpacity(.7),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, size: 8, color: Color(0xFF24D6A0)),
                  SizedBox(width: 8),
                  Text(
                    'Available for freelance & full-time roles',
                    style: TextStyle(
                      color: Color(0xFF55DDB8),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Hi, I’m Nada Saber —',
              style: TextStyle(
                fontSize: headingSize,
                height: 1.05,
                fontWeight: FontWeight.w800,
                letterSpacing: -2.1,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: headingSize,
                height: 1.05,
                fontWeight: FontWeight.w800,
                letterSpacing: -2.1,
                color: const Color(0xFF168CFF),
              ),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 570),
              child: Text(
                'I build clean, fast, scalable cross-platform mobile apps with Flutter, Firebase, and Clean Architecture.',
                style: TextStyle(color: muted, fontSize: 17, height: 1.8),
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                HoverLift(
                  lift: 3,
                  child: FilledButton.icon(
                    onPressed: () => _go('projects'),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 17),
                    label: const Text('View my work'),
                  ),
                ),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF10343C),
                    foregroundColor: const Color(0xFF7AE7E3),
                  ),
                  onPressed: () => _open(
                    'https://drive.google.com/uc?export=download&id=1EnuTld_Jo8v-EwyDRMp-Ir_D2C6laqV8',
                  ),
                  icon: const Icon(Icons.download_rounded, size: 18),
                  label: const Text('Download CV'),
                ),
                HoverLift(
                  lift: 3,
                  child: OutlinedButton(
                    onPressed: () => _go('contact'),
                    child: const Text('Hire me for a project.'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _social(
                  Icons.code_rounded,
                  'GitHub',
                  'https://github.com/NadaSaber2112',
                ),
                _social(
                  Icons.work_outline_rounded,
                  'LinkedIn',
                  'https://www.linkedin.com/in/nada-saber-7656062ab',
                ),
                _social(
                  Icons.mail_outline_rounded,
                  'Email',
                  'mailto:nadasaber6688@gmail.com',
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Cairo, Egypt · UTC+2',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        );
        final visual = _phoneMockup();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: stacked ? 54 : 78),
          child: stacked
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text,
                    const SizedBox(height: 44),
                    Center(child: visual),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: text),
                    const SizedBox(width: 26),
                    Expanded(flex: 5, child: Center(child: visual)),
                  ],
                ),
        );
      },
    ),
  );

  Widget _phoneMockup() => SizedBox(
    width: 470,
    height: 500,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 390,
          height: 470,
          decoration: BoxDecoration(
            color: const Color(0xFF168CFF).withOpacity(0.07),
            borderRadius: BorderRadius.circular(140),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF168CFF).withOpacity(0.15),
                blurRadius: 70,
                spreadRadius: 20,
              ),
            ],
          ),
        ),

        Transform.rotate(
          angle: 0.025,
          child: Container(
            width: 440,
            height: 470,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42),
              border: Border.all(
                color: const Color(0xFF168CFF).withOpacity(0.35),
              ),
            ),
          ),
        ),

        Transform.rotate(
          angle: -0.015,
          child: Container(
            width: 420,
            height: 450,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF101827),
              borderRadius: BorderRadius.circular(38),
              border: Border.all(
                color: const Color(0xFF168CFF).withOpacity(0.35),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 35,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/myphoto.jpeg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),

                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xDD080F1D),
                        ],
                        stops: [0.0, 0.55, 1.0],
                      ),
                    ),
                  ),

                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xCC18202D),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Nada Saber',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Flutter Developer · Cairo',
                            style: TextStyle(
                              color: Color(0xFFB8C5D8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 8,
          left: 0,
          child: _floatingTag(Icons.phone_android_rounded, 'Flutter'),
        ),
        Positioned(
          top: 105,
          right: -2,
          child: _floatingTag(Icons.code_rounded, 'Dart'),
        ),
        Positioned(
          bottom: 75,
          right: -8,
          child: _floatingTag(Icons.storage_rounded, 'Firebase'),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          child: _floatingTag(Icons.layers_rounded, 'BLoC'),
        ),
      ],
    ),
  );

  Widget _floatingTag(IconData icon, String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: accent.withOpacity(.25)),
      boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 20)],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: accent, size: 16),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
