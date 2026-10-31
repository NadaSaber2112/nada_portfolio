import 'package:flutter/material.dart';

/// Small lift and shadow change for desktop/web hover interactions.
/// On touch devices it simply displays the child normally.
class HoverLift extends StatefulWidget {
  final Widget child;
  final double lift;

  const HoverLift({super.key, required this.child, this.lift = 6});

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(
          0,
          _hovering ? -widget.lift : 0,
          0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: const Color(0xFF168CFF).withOpacity(0.13),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ]
              : const [],
        ),
        child: widget.child,
      ),
    );
  }
}
