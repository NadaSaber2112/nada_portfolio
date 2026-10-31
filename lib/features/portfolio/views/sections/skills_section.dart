part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _SkillsSectionExtension on _PortfolioPageState {
  Widget _skills() => _anchored(
    'skills',
    child: _sectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF23D5F5), size: 16),
              SizedBox(width: 10),
              _eyebrow('SKILLS'),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'A practical Flutter toolkit.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width < 600 ? 30 : 42,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.2,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tools I use to turn product requirements into maintainable mobile experiences.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9BA9BD),
              fontSize: 16,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 60),

          // Responsive two-card layout
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 700;
              final cardWidth = compact
                  ? constraints.maxWidth
                  : (constraints.maxWidth - 20) / 2;

              Widget skillChip(String label) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: widget.isDark
                          ? Colors.white
                          : Color.fromARGB(255, 84, 92, 103),
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                );
              }

              Widget skillCard({
                required String title,
                required String description,
                required IconData icon,
                required Color iconColor,
                required Color iconBackground,
                required List<String> skills,
                String? footer,
              }) {
                return SizedBox(
                  width: cardWidth,
                  child: Container(
                    padding: const EdgeInsets.all(60),
                    decoration: BoxDecoration(
                      color: _surfaceColor,
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: _borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: iconBackground,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(icon, color: iconColor, size: 25),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          title,
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color(0xFF9BA9BD),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 8,
                          runSpacing: 10,
                          children: skills.map(skillChip).toList(),
                        ),
                        if (footer != null) ...[
                          const SizedBox(height: 28),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.school_outlined,
                                color: Color(0xFF168CFF),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  footer,
                                  style: const TextStyle(
                                    color: Color(0xFF9BA9BD),
                                    fontSize: 13,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  skillCard(
                    title: 'Proficient',
                    description:
                        'Technologies used across coursework and app projects.',
                    icon: Icons.bolt_rounded,
                    iconColor: const Color(0xFF168CFF),
                    iconBackground: const Color(0xFF132D4A),
                    skills: [
                      'Dart',
                      'Flutter',
                      'REST APIs',
                      'JSON Parsing',
                      'Git',
                      'GitHub',
                      'Bloc',
                      'Http',
                      'Dio',
                      'Hive',
                      'Shared Preferences',
                      'Firebase Authentication',
                      'Firebase Firestore',
                    ],
                  ),
                  skillCard(
                    title: 'Familiar',
                    description: 'Computer science foundations and additional languages.',
                    icon: Icons.code_rounded,
                    iconColor: const Color(0xFF12D6A0),
                    iconBackground: const Color(0xFF103532),
                    skills: [
                      'C++',
                      'Java',
                      'OOP',
                      'Algorithms',
                      'Data Structures',
                    ],
                    footer: 'Backed by an ongoing Computer Science degree at Ain Shams University.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}
