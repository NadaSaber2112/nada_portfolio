part of 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

extension _ContactSectionExtension on _PortfolioPageState {
  Widget _contact() => _anchored(
    'contact',
    child: Container(
      width: double.infinity,
      color: _pageBackground,
      child: _sectionShell(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 760;

            final left = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: Color(0xFF23D5F5),
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    _eyebrow('CONTACT'),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'Let’s build something great together.',
                  style: TextStyle(
                    color: _headingColor,
                    fontSize: isMobile ? 38 : 58,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    letterSpacing: -1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tell me about the app, role, or team you have in mind. '
                  'I’ll get back to you with clear next steps.',
                  style: TextStyle(
                    color: Color(0xFFA8BDD8),
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 34),
                _contactLink(
                  Icons.mail_outline,
                  'Email',
                  'nadasaber6688@gmail.com',
                  'mailto:nadasaber6688@gmail.com',
                ),
                _contactLink(
                  Icons.phone_outlined,
                  'Phone / WhatsApp',
                  '01141229586',
                  'https://wa.me/201141229586',
                ),
                _contactLink(
                  Icons.link,
                  'LinkedIn',
                  'nada-saber-7656062ab',
                  'https://www.linkedin.com/',
                ),
                _contactLink(
                  Icons.code,
                  'GitHub',
                  'NadaSaber2112',
                  'https://github.com/NadaSaber2112',
                ),
              ],
            );

            final form = Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start a conversation',
                    style: TextStyle(
                      color: _headingColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Share a few details and I’ll get back to you.',
                    style: TextStyle(color: Color(0xFFA8BDD8), height: 1.5),
                  ),
                  const SizedBox(height: 30),

                  if (isMobile) ...[
                    _contactField(
                      label: 'Name',
                      hint: 'Your name',
                      controller: _name,
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Enter your name'
                          : null,
                    ),
                    const SizedBox(height: 18),
                    _contactField(
                      label: 'Email',
                      hint: 'you@company.com',
                      controller: _email,
                      validator: (value) =>
                          value == null ||
                              !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(value.trim())
                          ? 'Enter a valid email'
                          : null,
                    ),
                  ] else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _contactField(
                            label: 'Name',
                            hint: 'Your name',
                            controller: _name,
                            validator: (value) =>
                                value == null || value.trim().isEmpty
                                ? 'Enter your name'
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _contactField(
                            label: 'Email',
                            hint: 'you@company.com',
                            controller: _email,
                            validator: (value) =>
                                value == null ||
                                    !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                        .hasMatch(value.trim())
                                ? 'Enter a valid email'
                                : null,
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),
                  Text(
                    'Project type',
                    style: TextStyle(
                      color: _headingColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 9),
                  DropdownButtonFormField<String>(
                    value: _projectType,
                    dropdownColor: _surfaceColor,
                    style: TextStyle(color: _headingColor, fontSize: 14),
                    decoration: _contactDecoration('Select project type'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Freelance',
                        child: Text('Freelance'),
                      ),
                      DropdownMenuItem(
                        value: 'Full-time',
                        child: Text('Full-time'),
                      ),
                      DropdownMenuItem(
                        value: 'Internship',
                        child: Text('Internship'),
                      ),
                      DropdownMenuItem(
                        value: 'Collaboration',
                        child: Text('Collaboration'),
                      ),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _projectType = value);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  _contactField(
                    label: 'Message',
                    hint: 'Tell me about your project or role...',
                    controller: _message,
                    minLines: 5,
                    maxLines: 5,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Write a short message'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: _sendContactMessage,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                      label: const Text(
                        'Send message',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF169FF2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  left,
                  const SizedBox(height: 36),
                  _contactFormCard(form),
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: left),
                const SizedBox(width: 64),
                Expanded(child: _contactFormCard(form)),
              ],
            );
          },
        ),
      ),
    ),
  );

  Widget _contactFormCard(Widget form) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: _borderColor),
      ),
      child: form,
    );
  }

  Widget _contactField({
    required String label,
    required String hint,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: _headingColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 9),
        TextFormField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: Color(0xFF9BB0CC), fontSize: 14),
          decoration: _contactDecoration(hint),
        ),
      ],
    );
  }

  InputDecoration _contactDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9BB0CC)),
      filled: true,
      fillColor: _surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: _borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: _borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF169FF2), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  Widget _contactLink(IconData icon, String title, String value, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(color: _borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF22B7FF), size: 19),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFA8BDD8),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                SelectableText(
                  value,
                  style: TextStyle(
                    color: _headingColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Open $title',
            onPressed: () => _open(url),
            icon: Icon(
              Icons.open_in_new_rounded,
              color: _headingColor,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
