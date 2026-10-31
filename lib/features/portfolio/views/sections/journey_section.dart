part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _JourneySectionExtension on _PortfolioPageState {
  Widget _journey() => _anchored(
    'journey',
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      color: widget.isDark ? _pageBackground : const Color(0xFFF5F8FD),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 800;

              return Flex(
                direction: compact ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT: Heading and description
                  Expanded(
                    flex: compact ? 0 : 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: compact ? 0 : 48,
                        bottom: compact ? 40 : 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: Color(0xFF23D5F5),
                                size: 16,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'EXPERIENCE & LEARNING',
                                style: TextStyle(
                                  color: Color(0xFF23D5F5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Growing through structured learning and real projects.',
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: compact ? 36 : 52,
                              fontWeight: FontWeight.w800,
                              height: 1.22,
                              letterSpacing: -1.5,
                            ),
                          ),
                          const SizedBox(height: 22),
                          const Text(
                            'A focused path from computer science fundamentals '
                            'to cross-platform product development.',
                            style: TextStyle(
                              color: Color(0xFF9BA9BD),
                              fontSize: 17,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // RIGHT: Timeline cards
                  Expanded(
                    flex: compact ? 0 : 6,
                    child: Column(
                      children: [
                        HoverLift(
                          child: _journeyCard(
                            icon: Icons.rocket_launch_outlined,
                            date: '07/2025 – 12/2025',
                            title: 'Digital Egypt Pioneers Initiative (DEPI)',
                            subtitle: 'Flutter Track',
                            description:
                                'A focused program designed to build technical '
                                'and practical mobile app development skills.',
                          ),
                        ),
                        HoverLift(
                          child: _journeyCard(
                            icon: Icons.code,
                            date: '2024 – 2025',
                            title: 'Flutter courses & project practice',
                            subtitle: 'Udemy · Self-directed learning',
                            description:
                                'Applied learning through Notes, Weather, News, '
                                'and Toku mobile app projects.',
                          ),
                        ),
                        HoverLift(
                          child: _journeyCard(
                            icon: Icons.school_outlined,
                            date: '2022 – 2026',
                            title: 'B.Sc. Computer Science',
                            subtitle:
                                'Faculty of Science · Ain Shams University',
                            description:
                                'Building strong foundations in software '
                                'engineering, algorithms, data structures, and OOP.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
  Widget _journeyCard({
    required IconData icon,
    required String date,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline icon and line
          SizedBox(
            width: 52,
            child: Column(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: widget.isDark ? _surfaceColor : Colors.white,
                    border: Border.all(color: Color(0xFF23D5F5)),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(icon, color: Color(0xFF23D5F5), size: 21),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Card content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _surfaceColor,
                border: Border.all(color: _borderColor),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: _borderColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF23D5F5),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      color: _headingColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xFF23D5F5),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    description,
                    style: TextStyle(
                      color: widget.isDark
                          ? const Color(0xFF9BA9BD)
                          : const Color(0xFF58677D),
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
