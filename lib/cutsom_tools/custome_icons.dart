import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/providers/theme_notifire.dart';

Widget modeIcon(BuildContext context) {
  final themeNotifire = Provider.of<ThemeNotifire>(context);
  return AnimatedSwitcher(
    duration: Duration(milliseconds: 550),
    transitionBuilder: (child, animation) {
      return RotationTransition(
        turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
    child: Icon(
      key: ValueKey(themeNotifire.isDarkMode),
      themeNotifire.isDarkMode ? Icons.light_mode : Icons.dark_mode,
      color: themeNotifire.isDarkMode ? Color(0xFFFFCC33) : Color(0xFF8da1c8),
    ),
  );
}
