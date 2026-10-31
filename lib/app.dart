import 'package:flutter/material.dart';

import 'package:nada_portfolio/features/portfolio/views/portfolio_page.dart';

class NadaPortfolioApp extends StatefulWidget {
  const NadaPortfolioApp({super.key});
  @override
  State<NadaPortfolioApp> createState() => _NadaPortfolioAppState();
}

class _NadaPortfolioAppState extends State<NadaPortfolioApp> {
  ThemeMode _mode = ThemeMode.dark;
  void _toggleTheme() => setState(() {
    _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Nada Saber | Flutter Developer',
    debugShowCheckedModeBanner: false,
    themeMode: _mode,
    theme: _theme(Brightness.light),
    darkTheme: _theme(Brightness.dark),
    home: PortfolioPage(
      isDark: _mode == ThemeMode.dark,
      onToggleTheme: _toggleTheme,
    ),
  );

  ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    const blue = Color(0xFF168CFF);
    const cyan = Color(0xFF23D5F5);
    final scheme = ColorScheme.fromSeed(seedColor: blue, brightness: brightness)
        .copyWith(
          primary: blue,
          secondary: cyan,
          surface: dark ? const Color(0xFF101A30) : Colors.white,
        );
    final base = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      fontFamily: 'Arial',
    );
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: dark
          ? const Color(0xFF080E1D)
          : const Color(0xFFF5F8FD),
      canvasColor: dark ? const Color(0xFF080E1D) : const Color(0xFFF5F8FD),
      dividerColor: dark ? const Color(0xFF26334C) : const Color(0xFFDCE5F0),
      textTheme: base.textTheme.apply(
        bodyColor: dark ? const Color(0xFFE8F0FF) : const Color(0xFF17243A),
        displayColor: dark ? const Color(0xFFF7FAFF) : const Color(0xFF111C31),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: dark
            ? const Color(0xF2080E1D)
            : const Color(0xF2F5F8FD),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: dark ? const Color(0xFF101A30) : Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: dark ? const Color(0xFF24334E) : const Color(0xFFDDE6F2),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark ? const Color(0xFF0B1427) : const Color(0xFFF8FAFD),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: dark ? const Color(0xFF2A3954) : const Color(0xFFD8E2EF),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: dark ? const Color(0xFF2A3954) : const Color(0xFFD8E2EF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: blue, width: 1.4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: dark ? const Color(0xFF34435D) : const Color(0xFFD2DEEC),
          ),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        side: BorderSide(
          color: dark ? const Color(0xFF2B3A55) : const Color(0xFFD8E2EF),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}
