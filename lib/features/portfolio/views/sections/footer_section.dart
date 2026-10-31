part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _FooterSectionExtension on _PortfolioPageState {
  Widget _footer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
      decoration: BoxDecoration(
        color: _surfaceColor,
        border: Border(top: BorderSide(color: _borderColor, width: 1)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1304),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 850;

                  final brand = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nada.dev',
                        style: TextStyle(
                          color: _headingColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Building thoughtful mobile experiences with Flutter.',
                        style: TextStyle(
                          color: Color(0xFF9BA9BD),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  );

                  final navigation = Wrap(
                    alignment: isMobile
                        ? WrapAlignment.start
                        : WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 16,
                    children: [
                      _footerLink('About', 'about'),
                      _footerLink('Skills', 'skills'),
                      _footerLink('Projects', 'projects'),
                      _footerLink('Experience & Learning', 'journey'),
                      _footerLink('Contact', 'contact'),
                    ],
                  );

                  final actions = Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Scroll to the Contact section.
                          _go('contact');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF159CF0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Hire me for a project',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          _open(
                            'https://drive.google.com/uc?export=download&id=1EnuTld_Jo8v-EwyDRMp-Ir_D2C6laqV8',
                          );
                        },
                        icon: const Icon(Icons.download, size: 18),
                        label: const Text('Download CV'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _headingColor,
                          side: BorderSide(color: _borderColor),
                          //backgroundColor: const Color(0xFF151F33),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  );

                  if (isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        brand,
                        const SizedBox(height: 28),
                        navigation,
                        const SizedBox(height: 24),
                        actions,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 4, child: brand),
                      const SizedBox(width: 24),
                      Expanded(flex: 5, child: navigation),
                      const SizedBox(width: 24),
                      actions,
                    ],
                  );
                },
              ),
              const SizedBox(height: 56),
              Divider(color: _borderColor, height: 1),
              const SizedBox(height: 22),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 650;

                  const copyright = Text(
                    '© 2026 Nada Saber. All rights reserved.',
                    style: TextStyle(
                      color: Color(0xFF9BA9BD),
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  );

                  const tagline = Text(
                    'Designed for freelance projects and great teams.',
                    style: TextStyle(
                      color: Color(0xFF9BA9BD),
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  );

                  if (isMobile) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [copyright, SizedBox(height: 12), tagline],
                    );
                  }

                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [copyright, tagline],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(String label, String section) {
    return InkWell(
      onTap: () => _go(section),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          label,
          style: const TextStyle(color: Color(0xFFB5C2D5), fontSize: 12),
        ),
      ),
    );
  }
}
