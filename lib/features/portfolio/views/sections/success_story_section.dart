import 'package:flutter/material.dart';

class FirstSuccessStorySection extends StatelessWidget {
  const FirstSuccessStorySection({super.key});

  static const Color _cyan = Color(0xFF22D3EE);
  static const Color _white = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool isMobile = width < 700;
        final double horizontalPadding = width < 500
            ? 24
            : width < 1000
            ? 40
            : maxPadding(width);

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF1165A5), Color(0xFF0D2845), Color(0xFF0C303B)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: isMobile ? 64 : 88,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1310),
                child: isMobile
                    ? _buildMobileContent(context)
                    : _buildDesktopContent(context),
              ),
            ),
          ),
        );
      },
    );
  }

  double maxPadding(double width) {
    return ((width - 1310) / 2).clamp(32.0, 180.0);
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildHeadline(context, false)),
        const SizedBox(width: 64),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 66),
            child: _buildDescription(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeadline(context, true),
        const SizedBox(height: 28),
        _buildDescription(),
      ],
    );
  }

  Widget _buildHeadline(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.auto_awesome, color: _cyan, size: 25),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'A CLEAR STARTING POINT',
                style: TextStyle(
                  color: _cyan,
                  fontSize: isMobile ? 11 : 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          "Let's build my first success story together.",
          style: TextStyle(
            color: _white,
            fontSize: isMobile ? 39 : 58,
            height: 1.1,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 42),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _TrustBadge(label: 'Transparent scope'),
            _TrustBadge(label: 'Clear communication'),
            _TrustBadge(label: 'Maintainable code'),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      "I don't rely on invented testimonials or exaggerated metrics. "
      "I bring visible project work, current technical training, "
      "honest communication, and the motivation to earn trust "
      "through the quality of the work.",
      style: TextStyle(
        color: Color(0xFFE2EAF5),
        fontSize: 18,
        height: 1.75,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TrustBadge extends StatelessWidget {
  const _TrustBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.055),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check, size: 16, color: Color(0xFF5EEAD4)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFF8FAFC),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
