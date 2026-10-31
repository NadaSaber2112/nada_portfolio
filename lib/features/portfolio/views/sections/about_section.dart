part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _AboutSectionExtension on _PortfolioPageState {
  Widget _about() => _anchored(
    'about',
    child: _sectionShell(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final cardColumns = constraints.maxWidth >= 1000
              ? 4
              : constraints.maxWidth >= 600
              ? 2
              : 1;

          const spacing = 16.0;
          final availableWidth = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : 1100.0;

          final cardWidth =
              (availableWidth - spacing * (cardColumns - 1)) / cardColumns;

          final heading = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome, color: Color(0xFF23D5F5), size: 16),
                  SizedBox(width: 10),
                  _eyebrow('ABOUT ME'),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: compact ? 34 : 43,
                    height: 1.12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.2,
                    color: _headingColor,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Engineering\nmobile products\nwith purpose.',
                    ),
                  ],
                ),
              ),
            ],
          );

          const description = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I'm a Computer Science student at Ain Shams University, "
                "graduating in 2026, and a Flutter developer who completed "
                "the Digital Egypt Pioneers Initiative Flutter track.",
                style: TextStyle(
                  color: Color(0xFF9BA9BD),
                  fontSize: 16,
                  height: 2,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "I focus on real-world mobile apps powered by REST APIs, "
                "Firebase, Bloc state management, and Clean Architecture. "
                "Based in Cairo, I'm open to freelance work and onsite, "
                "hybrid, or remote junior Flutter roles.",
                style: TextStyle(
                  color: Color(0xFF9BA9BD),
                  fontSize: 16,
                  height: 2,
                ),
              ),
            ],
          );

          final intro = compact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [heading, const SizedBox(height: 28), description],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: heading),
                    const SizedBox(width: 60),
                    const Expanded(flex: 7, child: description),
                  ],
                );

          final cards = [
            _aboutInfoCard(
              Icons.location_on_outlined,
              'Location',
              'Cairo, Egypt',
            ),
            _aboutInfoCard(
              Icons.school_outlined,
              'Education',
              'B.Sc. Computer Science · 2022–2026',
            ),
            _aboutInfoCard(
              Icons.chat_bubble_outline_rounded,
              'Languages',
              'Arabic · Native / English · Proficient',
            ),
            _aboutInfoCard(
              Icons.work_outline_rounded,
              'Status',
              'Open to work',
            ),
          ];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: compact ? 55 : 65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                intro,
                const SizedBox(height: 70),
                Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: cards
                      .map(
                        (card) => SizedBox(
                          width: cardWidth,
                          height: 138,
                          child: HoverLift(child: card),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );

  Widget _aboutInfoCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF168CFF), size: 22),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF9BA9BD),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: TextStyle(
                    color: _headingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
