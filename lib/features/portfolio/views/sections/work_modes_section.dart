part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _WorkModesSectionExtension on _PortfolioPageState {
  Widget _workModes() => _anchored(
    'collaborate',
    child: Container(
      width: double.infinity,
      color: _pageBackground,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome, color: Color(0xFF23D5F5), size: 16),
                  SizedBox(width: 10),
                  Text(
                    'WORK WITH ME',
                    style: TextStyle(
                      color: Color(0xFF23D5F5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'One developer. Two ways to\ncollaborate.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _headingColor,
                  fontSize: 54,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.8,
                ),
              ),
              const SizedBox(height: 22),
              const SizedBox(
                width: 650,
                child: Text(
                  'Whether you need a reliable project partner or a junior '
                  'developer ready to grow with your team.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF9BA9BD),
                    fontSize: 17,
                    height: 1.7,
                  ),
                ),
              ),
              const SizedBox(height: 60),

              LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxWidth < 750;

                  final freelance = HoverLift(
                    child: _workModeCard(
                      icon: Icons.rocket_launch_outlined,
                      badge: 'For clients',
                      title: 'Freelance',
                      description: 'Focused Flutter support from interface to integration.',
                      features: const [
                        'Custom Flutter app development',
                        'UI implementation from Figma',
                        'Firebase integration',
                        'REST API integration',
                        'App maintenance',
                      ],
                      isFreelance: true,
                      buttonText: 'Start a project',
                      onPressed: () => _go('contact'),
                    ),
                  );

                  final fullTime = HoverLift(
                    child: _workModeCard(
                      icon: Icons.work_outline,
                      badge: 'For teams',
                      title: 'Full-time / Onsite',
                      description: 'Open to junior Flutter roles — onsite, hybrid, or remote.',
                      features: const [
                        'Computer Science foundation',
                        'Flutter & Dart focus',
                        'Team project experience',
                        'Arabic and English',
                        'Based in Cairo, Egypt',
                      ],
                      isFreelance: false,
                      buttonText: 'Download CV',
                      onPressed: () {
                        _open(
                          'https://drive.google.com/uc?export=download&id=1EnuTld_Jo8v-EwyDRMp-Ir_D2C6laqV8',
                        );
                      },
                    ),
                  );

                  if (compact) {
                    return Column(
                      children: [
                        freelance,
                        const SizedBox(height: 24),
                        fullTime,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: freelance),
                      const SizedBox(width: 22),
                      Expanded(child: fullTime),
                    ],
                  );
                },
              ),

              const SizedBox(height: 26),
              _workProcess(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _workModeCard({
    required IconData icon,
    required String badge,
    required String title,
    required String description,
    required List<String> features,
    required bool isFreelance,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    final accentColor = isFreelance
        ? const Color(0xFF159DFF)
        : const Color(0xFF00D6A0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: isFreelance ? const Color(0xFF075B98) : _borderColor,
          width: isFreelance ? 1.3 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: accentColor, size: 23),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: _headingColor,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF9BA9BD),
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, color: Color(0xFF00D6A0), size: 19),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        color: Color(0xFF9BA9BD),
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: isFreelance
                    ? const Color(0xFF159DFF)
                    : const Color(0xFF103B40),
                foregroundColor: isFreelance
                    ? Colors.white
                    : const Color(0xFF60F5E0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(buttonText),
                  if (isFreelance) ...[
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, size: 18),
                  ] else ...[
                    const SizedBox(width: 10),
                    const Icon(Icons.download_outlined, size: 18),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _workProcess() {
    const steps = [
      ('01', 'Understand', 'Clarify goals, users, and scope.'),
      ('02', 'Design', 'Translate needs into a clear flow.'),
      ('03', 'Build', 'Develop clean, scalable Flutter code.'),
      ('04', 'Deliver', 'Test, refine, and hand over.'),
    ];

    Widget buildStep(
      (String, String, String) step, {
      required bool compact,
      required bool isLast,
    }) {
      return Container(
        width: compact ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
          border: compact
              ? (isLast
                    ? null
                    : Border(bottom: BorderSide(color: _borderColor)))
              : (isLast
                    ? null
                    : Border(right: BorderSide(color: _borderColor))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              step.$1,
              style: const TextStyle(
                color: Color(0xFF159DFF),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.$2,
                    style: TextStyle(
                      color: _headingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    step.$3,
                    style: const TextStyle(
                      color: Color(0xFF9BA9BD),
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _surfaceColor,
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(23),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 700;

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < steps.length; i++)
                  buildStep(
                    steps[i],
                    compact: true,
                    isLast: i == steps.length - 1,
                  ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < steps.length; i++)
                Expanded(
                  child: buildStep(
                    steps[i],
                    compact: false,
                    isLast: i == steps.length - 1,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
