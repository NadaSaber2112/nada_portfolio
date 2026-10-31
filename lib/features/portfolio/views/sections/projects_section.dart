part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _ProjectsSectionExtension on _PortfolioPageState {
  Widget _projectsSection() => _anchored(
    'projects',
    child: _sectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF23D5F5), size: 16),
              SizedBox(width: 10),
              _eyebrow('SELECTED WORK'),
            ],
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              'Apps built by learning, shipping, and iterating.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width < 600 ? 32 : 48,
                height: 1.12,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.3,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 620),
            child: Text(
              'Six mobile projects from team collaborations, DEPI training, and focused course practice.',
              textAlign: TextAlign.center,
              style: TextStyle(color: muted, height: 1.7, fontSize: 16),
            ),
          ),
          const SizedBox(height: 38),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: _bodyColor.withOpacity(.010),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _borderColor),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              runSpacing: 4,
              children: ['All', 'Team Projects', 'Firebase', 'API-based'].map((
                filter,
              ) {
                final selected = _viewModel.selectedFilter == filter;
                return TextButton(
                  onPressed: () {
                    setState(() {
                      _viewModel.selectFilter(filter);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: selected
                        ? Colors.white.withOpacity(.08)
                        : Colors.transparent,
                    foregroundColor: selected ? _headingColor : _bodyColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text(
                    filter,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final filtered = PortfolioViewModel.projects
                  .where(
                    (project) =>
                        _viewModel.selectedFilter == 'All' ||
                        project.groups.contains(_viewModel.selectedFilter),
                  )
                  .toList();
              final columns = constraints.maxWidth >= 1050 ? 2 : 1;
              final cardWidth = columns == 2
                  ? (constraints.maxWidth - 18) / 2
                  : constraints.maxWidth;
              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: filtered
                    .map(
                      (project) => SizedBox(
                        width: cardWidth,
                        child: HoverLift(child: _projectCard(project)),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget _projectTag(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      color: _bodyColor.withOpacity(.010),
      borderRadius: BorderRadius.circular(9),
      border: Border.all(color: _borderColor),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: widget.isDark ? Colors.white : Color.fromARGB(255, 84, 92, 103),
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _projectCard(ProjectData p) => Card(
    clipBehavior: Clip.antiAlias,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final horizontal = constraints.maxWidth >= 620;
        final preview = SizedBox(
          height: horizontal ? 360 : 220,
          width: horizontal ? 220 : double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: p.color.withOpacity(.10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [p.color.withOpacity(.18), const Color(0xFF111C2F)],
              ),
            ),
            child: Image.asset(
              p.imageAsset,
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(p.icon, size: 76, color: p.color.withOpacity(.9)),
              ),
            ),
          ),
        );
        final details = Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                p.category.toUpperCase(),
                style: const TextStyle(
                  color: accent,
                  fontSize: 10,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                p.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                p.description,
                style: const TextStyle(color: muted, height: 1.65),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: p.tech.split(' · ').map(_projectTag).toList(),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    onPressed: () => _open(p.githubUrl),
                    icon: const Icon(Icons.code_rounded, size: 16),
                    label: const Text('View on GitHub'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _go('contact'),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text('Discuss the project'),
                  ),
                ],
              ),
            ],
          ),
        );
        return horizontal
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  preview,
                  Expanded(child: details),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [preview, details],
              );
      },
    ),
  );
}
