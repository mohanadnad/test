import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
// import 'package:sudan_tourist_guide/ai%20agent/apis.dart';
// import 'package:sudan_tourist_guide/ai%20agent/apis.dart';
import 'package:sudan_tourist_guide/screens/fav_screen.dart';
import 'package:sudan_tourist_guide/screens/booking/user_bookings_screen.dart';
import '../authentication_screens/sign_in.dart';
import '../constant/my_strings.dart';
import '../generated/l10n.dart';
import '../onboarding/on_boarding_screen.dart';
import '../providers/language_provider.dart';
import '../screens/language_screen.dart';
import '../providers/theme_notifire.dart';
import 'package:animate_do/animate_do.dart';

class DrawerDesing extends StatelessWidget {
  const DrawerDesing({super.key});

  // Widget bulidListTile(String name, IconData icon, VoidCallback navigate) {
  //   return ListTile(
  //     title: Text(
  //       name,
  //       style: TextStyle(
  //         fontFamily: "ElMessiri",
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     onTap: navigate,
  //     leading: Icon(icon),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ThemeNotifire themeNotifire = Provider.of<ThemeNotifire>(context);
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 170,
              width: double.infinity,
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // ignore: deprecated_member_use
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text(
                S.of(context).titleTabScreen1,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: myFonts,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // icon for dark mode
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SwitchListTile(
                  value: themeNotifire.isDarkMode,
                  onChanged: (_) => themeNotifire.changeAppTheme(),
                  title:
                      Text(
                        S.of(context).darkmode,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: myFonts,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ).fadeInRight(
                        animate: true,
                        duration: Duration(milliseconds: 400),
                      ),
                  secondary: AnimatedSwitcher(
                    duration: Duration(milliseconds: 550),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: Tween<double>(
                          begin: 0.75,
                          end: 1,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Icon(
                      key: ValueKey(themeNotifire.isDarkMode),
                      themeNotifire.isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: themeNotifire.isDarkMode
                          ? Color(0xFFFFCC33)
                          : Color(0xFF8da1c8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // icon for logout
            buildListTile(
              context,
              S.of(context).Logout,
              () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(SignIn.pageRoute, (route) => false);
              },
              Icons.logout,
              Theme.of(context).iconTheme.color ?? Colors.grey,
            ),
            SizedBox(height: 15),

            // icon for language
            buildListTile(
              context,
              S.of(context).language,
              () {
                Navigator.of(context).pushNamed(LanguageScreen.pageroute);
              },
              Icons.language,
              Theme.of(context).iconTheme.color ?? Colors.grey,
            ),

            SizedBox(height: 15),
            // icon for return to onboarding screen
            buildListTile(
              context,
              S.of(context).onBoarding,
              () async {
                Provider.of<LanguageProvider>(
                  context,
                  listen: false,
                ).returnToOnBoarding();
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  OnBoardingScreen.pageRoute,
                  (route) => false,
                );
              },
              Icons.translate,
              Theme.of(context).iconTheme.color ?? Colors.grey,
            ),

            SizedBox(height: 15),
            // button for favorites
            buildListTile(
              context,
              S.of(context).titleTabScreen2,
              () async {
                Navigator.of(context).pushNamed(FavScreen.pageRoute);
              },
              Icons.favorite,
              Colors.red,
            ),

            ////////////////////////////////////
            SizedBox(height: 15),
            // // icon for upload data
            // buildListTile(
            //   context,
            //   'upload the data',
            //   () async {
            //     await uploadEverything();
            //   },
            //   Icons.upload,
            //   Theme.of(context).iconTheme.color ?? Colors.grey,
            // ),
            // buildListTile(context, text, onPressed, icon, Theme.of(context).iconTheme.color)
            SizedBox(height: 15),
            // // icon for bookings screen
            buildListTile(
              context,
              'My Bookings',
              () {
                Navigator.of(context).pushNamed(UserBookingsScreen.screenRoute);
              },
              Icons.event_available,
              Theme.of(context).iconTheme.color ?? Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildListTile(
    BuildContext context,
    String text,
    void Function()? onPressed,
    IconData icon,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: myFonts,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ).fadeInRight(animate: true, duration: Duration(milliseconds: 400)),
          selected: true,
          selectedTileColor: Colors.blue,

          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: iconColor),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
