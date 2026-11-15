import 'package:animate_do/animate_do.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/providers/search_enging.dart';
import '../constant/my_strings.dart';
import '../generated/l10n.dart';
import '../providers/language_provider.dart';
// import 'package:sudan_tourist_guide/screens/tab_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  static const pageroute = '/language_screen';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Widget _buildLanguageCard({
    required String title,
    required String flagCode,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ZoomIn(
        duration: Duration(milliseconds: 500),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CountryFlag.fromLanguageCode(
                  flagCode,
                  theme: ImageTheme(height: 40, width: 40),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: myFonts,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFFFE0B2)
            : null,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.light
              ? LinearGradient(
                  colors: [Color(0xFFFFE0B2), Color(0xFFFFCC80)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              FadeInDown(
                child: Text(
                  S.of(context).language,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ElMessiri",
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              _buildLanguageCard(
                title: S.of(context).arLang,
                flagCode: 'ar',
                onTap: () async {
                  await Provider.of<LanguageProvider>(
                    context,
                    listen: false,
                  ).changeLanguage('ar', context);

                  await Provider.of<SearchEnging>(
                    context,
                    listen: false,
                  ).loadPlaces('ar');
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              _buildLanguageCard(
                title: S.of(context).enLang,
                flagCode: 'en',
                onTap: () async {
                  await Provider.of<LanguageProvider>(
                    context,
                    listen: false,
                  ).changeLanguage('en', context);

                  await Provider.of<SearchEnging>(
                    context,
                    listen: false,
                  ).loadPlaces('en');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
