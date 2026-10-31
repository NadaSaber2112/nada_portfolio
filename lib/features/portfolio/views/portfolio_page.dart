import 'package:flutter/material.dart';
import 'package:nada_portfolio/features/portfolio/views/sections/success_story_section.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:nada_portfolio/features/portfolio/data/project_data.dart';
import 'package:nada_portfolio/features/portfolio/view_model/portfolio_view_model.dart';
import 'package:nada_portfolio/core/widgets/scroll_reveal.dart';
import 'package:nada_portfolio/core/widgets/hover_lift.dart';

part 'sections/navigation_section.dart';
part 'sections/hero_section.dart';
part 'sections/about_section.dart';
part 'sections/projects_section.dart';
part 'sections/skills_section.dart';
part 'sections/journey_section.dart';
part 'sections/work_modes_section.dart';
part 'sections/contact_section.dart';
part 'sections/footer_section.dart';
part 'sections/shared_section_helpers.dart';

const accent = Color(0xFF23D5F5);
const muted = Color(0xFF9BA9BD);

class PortfolioPage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  const PortfolioPage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scroll = ScrollController();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _projectType = 'Freelance';
  final Map<String, GlobalKey> _anchors = {
    for (final id in [
      'about',
      'skills',
      'projects',
      'collaborate',
      'journey',
      'contact',
    ])
      id: GlobalKey(),
  };
  final PortfolioViewModel _viewModel = PortfolioViewModel();
  // Theme-aware colors for sections that previously used fixed dark colors.
  Color get _pageBackground =>
      widget.isDark ? const Color(0xFF0B1020) : const Color(0xFFF8FAFC);
  Color get _surfaceColor =>
      widget.isDark ? const Color(0xFF111B2E) : Colors.white;

  Color get _borderColor =>
      widget.isDark ? const Color(0xFF26354D) : const Color(0xFFE2E8F0);
  Color get _headingColor =>
      widget.isDark ? const Color(0xFFF1F5F9) : const Color(0xFF111C31);
  Color get _bodyColor =>
      widget.isDark ? const Color(0xFF9BA9BD) : const Color(0xFF58677D);

  @override
  void dispose() {
    _scroll.dispose();
    _name.dispose();
    _email.dispose();
    _message.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  void _go(String id) {
    final targetId = switch (id.toLowerCase()) {
      'skills' || 'toolkit' => 'skills',
      'experience' || 'experience & learning' => 'journey',
      'work' || 'my work' => 'projects',
      'hire me' || 'discuss the project' => 'contact',
      _ => id.toLowerCase(),
    };

    final key = _anchors[targetId];

    if (key == null) {
      debugPrint('Unknown section ID: $targetId');
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scroll.hasClients) return;

      final context = key.currentContext;

      if (context == null) {
        debugPrint('Section "$targetId" is not mounted.');
        return;
      }

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
        alignment: 0,
      );
    });
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _sendContactMessage() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await _viewModel.sendContactMessage(
      name: _name.text,
      email: _email.text,
      projectType: _projectType,
      message: _message.text,
    );

    if (!mounted) return;

    if (success == ContactSubmissionResult.success) {
      _name.clear();
      _email.clear();
      _message.clear();
      setState(() => _projectType = 'Freelance');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
    } else if (success == ContactSubmissionResult.failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not send your message. Please try again.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network error. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Positioned(
          top: -150,
          right: -100,
          child: _glow(360, const Color(0xFF2145A0).withOpacity(.22)),
        ),
        Positioned(
          top: 750,
          left: -170,
          child: _glow(340, const Color(0xFF0B8EAD).withOpacity(.12)),
        ),
        SingleChildScrollView(
          controller: _scroll,
          child: Column(
            children: [
              _nav(),
              ScrollReveal(child: _hero(), playOnMount: true),
              _about(),
              _skills(),
              _projectsSection(),
              _journey(),
              _workModes(),
              FirstSuccessStorySection(),
              _contact(),
              _footer(),
            ],
          ),
        ),
      ],
    ),
  );
}
