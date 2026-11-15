// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/cutsom_tools/custome_icons.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/providers/theme_notifire.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  final String imageUrl;
  final String title;
  final String description;

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: true);
    final appMode = Provider.of<ThemeNotifire>(context, listen: true);

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.fitHeight,
            // width: 800,
            // height: 1000,
          ),
        ),
        Positioned(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  appMode.changeAppTheme();
                },
                icon: modeIcon(context),
              ),
              TextButton(
                onPressed: () {
                  if (langProvider.locale.languageCode == 'ar') {
                    langProvider.changeLanguage('en', context);
                  } else {
                    langProvider.changeLanguage('ar', context);
                  }
                },
                child: Text(
                  S.of(context).onAra,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 140,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Text(
                widget.title,

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              Text(
                widget.description,
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
