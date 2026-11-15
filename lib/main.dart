// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gvl_comments/gvl_comments.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudan_tourist_guide/admin/admin_dashboard.dart';
import 'package:sudan_tourist_guide/providers/search_enging.dart';
import 'package:sudan_tourist_guide/screens/booking/booking_screen.dart';
import 'package:sudan_tourist_guide/screens/comment_screen.dart';
import 'package:sudan_tourist_guide/screens/fav_screen.dart';
import 'package:sudan_tourist_guide/screens/booking/user_bookings_screen.dart';

import 'constant/my_strings.dart';
import 'generated/l10n.dart';
import 'onboarding/on_boarding_screen.dart';
import 'providers/language_provider.dart';
import 'providers/map_style_provider.dart';
import 'screens/all_places_screen.dart';
import 'screens/chat_pot.dart';
import 'screens/language_screen.dart';
import 'authentication_screens/sign_in.dart';
import 'authentication_screens/sign_up.dart';
import 'providers/favorites_screen.dart';
import 'providers/theme_notifire.dart';
import 'screens/tab_screen.dart';
import 'screens/tab_screen_for_activities.dart';
import 'screens/trip_details_screen.dart';
import 'screens/trips_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CommentsKit.initialize(
    installKey: 'cmt_live_bYPbf17BwKtR5Yk6RKhapfbs4rmDqVuAy_iIn_bIlS4',
  );
  sharedPreferences = await SharedPreferences.getInstance();
  final fav = FavoritesScreen();
  final showHome = sharedPreferences?.getBool('showHome') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifire()),
        ChangeNotifierProvider(create: (context) => fav),
        ChangeNotifierProvider(create: (context) => SearchEnging()),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider()..loadSavedLanguage(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapStyleProvider()..loadStyle(),
        ),
      ],
      child: MyApp(showHome: showHome),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showHome});
  final bool showHome;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final themeNotifire = Provider.of<ThemeNotifire>(context);
    if (!themeNotifire.isLoaded) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }
    return MaterialApp(
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: themeNotifire.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: langProvider.locale,
      home:
          (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified &&
              showHome == true)
          ? TabScreen()
          : OnBoardingScreen(),
      routes: {
        // '/' : (context) => OnBoardingScreen(),
        TabScreen.pageRoute: (context) => TabScreen(),
        TabScreenForActivities.screenRoute: (context) =>
            TabScreenForActivities(),
        TripsScreen.screenRoute: (context) => TripsScreen(),
        TripDetailsScreen.screenRoute: (context) => TripDetailsScreen(),
        SignIn.pageRoute: (context) => SignIn(),
        SignUp.pageRoute: (context) => SignUp(),
        ChatPot.pageRoute: (context) => ChatPot(),
        LanguageScreen.pageroute: (context) => LanguageScreen(),
        OnBoardingScreen.pageRoute: (context) => OnBoardingScreen(),
        AllPlacesScreen.pageRoute: (context) => AllPlacesScreen(),
        FavScreen.pageRoute: (context) => FavScreen(),
        CommentScreen.pageRoute: (context) => CommentScreen(),
        BookingScreen.pageRoute: (context) => BookingScreen(),
        UserBookingsScreen.screenRoute: (context) => UserBookingsScreen(),
        AdminDashboard.pageRoute: (context) => AdminDashboard(),
      },
    );
  }
}
