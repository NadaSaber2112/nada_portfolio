part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _SharedSectionHelpersExtension on _PortfolioPageState {
  Widget _glow(double size, Color color) => IgnorePointer(
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: color, blurRadius: 100, spreadRadius: 40)],
      ),
    ),
  );

  Widget _sectionShell({required Widget child}) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1160),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width < 600 ? 20 : 28,
          vertical: MediaQuery.sizeOf(context).width < 600 ? 34 : 58,
        ),
        child: child,
      ),
    ),
  );
  Widget _anchored(String id, {required Widget child}) => Container(
    key: _anchors[id],
    child: ScrollReveal(child: child),
  );

  Widget _eyebrow(String text) => Text(
    text,
    style: const TextStyle(
      color: Color(0xFF168CFF),
      fontSize: 11,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.6,
    ),
  );
  Widget _social(IconData icon, String label, String url) => InkWell(
    onTap: () => _open(url),
    borderRadius: BorderRadius.circular(8),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: muted),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: muted, fontSize: 12)),
        ],
      ),
    ),
  );
}
