// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `change language`
  String get language {
    return Intl.message(
      'change language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get hint1 {
    return Intl.message('email', name: 'hint1', desc: '', args: []);
  }

  /// ` password`
  String get hint2 {
    return Intl.message(' password', name: 'hint2', desc: '', args: []);
  }

  /// `Sign in to continue using the application`
  String get signInDescription {
    return Intl.message(
      'Sign in to continue using the application',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailField {
    return Intl.message(
      'Enter your email',
      name: 'emailField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get userNameField {
    return Intl.message(
      'Enter your username',
      name: 'userNameField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordField {
    return Intl.message(
      'Enter your password',
      name: 'passwordField',
      desc: '',
      args: [],
    );
  }

  /// `forget your password?`
  String get forget {
    return Intl.message(
      'forget your password?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get signInButton {
    return Intl.message('SignIn', name: 'signInButton', desc: '', args: []);
  }

  /// ` Or SignIn with `
  String get divider {
    return Intl.message(
      ' Or SignIn with ',
      name: 'divider',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get google {
    return Intl.message(
      'Sign in with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get signupLineButton {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signupLineButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Now`
  String get signupLineButton2 {
    return Intl.message(
      'Sign Up Now',
      name: 'signupLineButton2',
      desc: '',
      args: [],
    );
  }

  /// `Sudan Guide`
  String get titleTabScreen1 {
    return Intl.message(
      'Sudan Guide',
      name: 'titleTabScreen1',
      desc: '',
      args: [],
    );
  }

  /// `popular places`
  String get titleTabScreen3 {
    return Intl.message(
      'popular places',
      name: 'titleTabScreen3',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get titleTabScreen2 {
    return Intl.message(
      'Favorites',
      name: 'titleTabScreen2',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arLang {
    return Intl.message('Arabic', name: 'arLang', desc: '', args: []);
  }

  /// `English`
  String get enLang {
    return Intl.message('English', name: 'enLang', desc: '', args: []);
  }

  /// `Log out`
  String get Logout {
    return Intl.message('Log out', name: 'Logout', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkmode {
    return Intl.message('Dark Mode', name: 'darkmode', desc: '', args: []);
  }

  /// `Guide`
  String get iconLabel1 {
    return Intl.message('Guide', name: 'iconLabel1', desc: '', args: []);
  }

  /// `Favorites`
  String get iconLabel2 {
    return Intl.message('Favorites', name: 'iconLabel2', desc: '', args: []);
  }

  /// `عربي`
  String get onAra {
    return Intl.message('عربي', name: 'onAra', desc: '', args: []);
  }

  /// `Unforgettable Cities & Landmarks`
  String get onboarding_title_1 {
    return Intl.message(
      'Unforgettable Cities & Landmarks',
      name: 'onboarding_title_1',
      desc: '',
      args: [],
    );
  }

  /// `From Khartoum to Meroe, museums, pyramids, and traditional markets await you.`
  String get onboarding_subtitle_1 {
    return Intl.message(
      'From Khartoum to Meroe, museums, pyramids, and traditional markets await you.',
      name: 'onboarding_subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Sudan`
  String get onboarding_title_2 {
    return Intl.message(
      'Welcome to Sudan',
      name: 'onboarding_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Discover Sudan’s diversity across the Nile, desert, mountains, and rich cultures.`
  String get onboarding_subtitle_2 {
    return Intl.message(
      'Discover Sudan’s diversity across the Nile, desert, mountains, and rich cultures.',
      name: 'onboarding_subtitle_2',
      desc: '',
      args: [],
    );
  }

  /// `A Journey from the Nile to Wonder`
  String get onboarding_title_3 {
    return Intl.message(
      'A Journey from the Nile to Wonder',
      name: 'onboarding_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Along the Nile’s golden waters, your adventure begins — discovering Sudan’s timeless beauty and serene spirit.`
  String get onboarding_subtitle_3 {
    return Intl.message(
      'Along the Nile’s golden waters, your adventure begins — discovering Sudan’s timeless beauty and serene spirit.',
      name: 'onboarding_subtitle_3',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Journey of Discovery`
  String get onboarding_title_4 {
    return Intl.message(
      'Start Your Journey of Discovery',
      name: 'onboarding_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Use your digital guide to explore Sudan — uncover its magnificent heritage, plan inspiring trips, and navigate the country’s map to start your adventure with confidence.`
  String get onboarding_subtitle_4 {
    return Intl.message(
      'Use your digital guide to explore Sudan — uncover its magnificent heritage, plan inspiring trips, and navigate the country’s map to start your adventure with confidence.',
      name: 'onboarding_subtitle_4',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Sign Up`
  String get signup_title {
    return Intl.message('Sign Up', name: 'signup_title', desc: '', args: []);
  }

  /// `Sign up to continue using the application`
  String get signup_subtitle {
    return Intl.message(
      'Sign up to continue using the application',
      name: 'signup_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get signup_username {
    return Intl.message(
      'User Name',
      name: 'signup_username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_email {
    return Intl.message('Email', name: 'signup_email', desc: '', args: []);
  }

  /// `Password`
  String get signup_password {
    return Intl.message(
      'Password',
      name: 'signup_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_button {
    return Intl.message('Sign Up', name: 'signup_button', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signup_google {
    return Intl.message(
      'Sign in with Google',
      name: 'signup_google',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get signup_have_account {
    return Intl.message(
      'Have an account?',
      name: 'signup_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In Now`
  String get signup_signin_now {
    return Intl.message(
      'Sign In Now',
      name: 'signup_signin_now',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign Up With`
  String get orSignUpWith {
    return Intl.message(
      'Or Sign Up With',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `No items have been added yet.`
  String get emptyListMessage {
    return Intl.message(
      'No items have been added yet.',
      name: 'emptyListMessage',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message('Back', name: 'Back', desc: '', args: []);
  }

  /// `Discover the map`
  String get discoverTheMap {
    return Intl.message(
      'Discover the map',
      name: 'discoverTheMap',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message('Map', name: 'map', desc: '', args: []);
  }

  /// `Map`
  String get mapTitel {
    return Intl.message('Map', name: 'mapTitel', desc: '', args: []);
  }

  /// `Light Map`
  String get ligtMap {
    return Intl.message('Light Map', name: 'ligtMap', desc: '', args: []);
  }

  /// `Dark Map`
  String get darkMap {
    return Intl.message('Dark Map', name: 'darkMap', desc: '', args: []);
  }

  /// `Satelite Map`
  String get sateliteMap {
    return Intl.message(
      'Satelite Map',
      name: 'sateliteMap',
      desc: '',
      args: [],
    );
  }

  /// `Select Map Style`
  String get choosMapStyle {
    return Intl.message(
      'Select Map Style',
      name: 'choosMapStyle',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message('Play', name: 'play', desc: '', args: []);
  }

  /// `Pause`
  String get pause {
    return Intl.message('Pause', name: 'pause', desc: '', args: []);
  }

  /// `Travels`
  String get travels {
    return Intl.message('Travels', name: 'travels', desc: '', args: []);
  }

  /// `Places`
  String get places {
    return Intl.message('Places', name: 'places', desc: '', args: []);
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message('Restaurants', name: 'restaurants', desc: '', args: []);
  }

  /// `Accommodations`
  String get attractions {
    return Intl.message(
      'Accommodations',
      name: 'attractions',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signOnboarding {
    return Intl.message('Sign in', name: 'signOnboarding', desc: '', args: []);
  }

  /// `There is no cities available`
  String get categoryError {
    return Intl.message(
      'There is no cities available',
      name: 'categoryError',
      desc: '',
      args: [],
    );
  }

  /// `There is no hotels available`
  String get hoterError {
    return Intl.message(
      'There is no hotels available',
      name: 'hoterError',
      desc: '',
      args: [],
    );
  }

  /// `There is no restaurants available`
  String get restaurantError {
    return Intl.message(
      'There is no restaurants available',
      name: 'restaurantError',
      desc: '',
      args: [],
    );
  }

  /// `There is no places available`
  String get placeError {
    return Intl.message(
      'There is no places available',
      name: 'placeError',
      desc: '',
      args: [],
    );
  }

  /// `There is no travels available`
  String get travelError {
    return Intl.message(
      'There is no travels available',
      name: 'travelError',
      desc: '',
      args: [],
    );
  }

  /// `Visit Place`
  String get visitPlace {
    return Intl.message('Visit Place', name: 'visitPlace', desc: '', args: []);
  }

  /// `onBoarding screen`
  String get onBoarding {
    return Intl.message(
      'onBoarding screen',
      name: 'onBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Select Trip Type`
  String get selectTripType {
    return Intl.message(
      'Select Trip Type',
      name: 'selectTripType',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get selectCity {
    return Intl.message('Select City', name: 'selectCity', desc: '', args: []);
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message('Members', name: 'members', desc: '', args: []);
  }

  /// `The budget of the trip`
  String get budgetTrip {
    return Intl.message(
      'The budget of the trip',
      name: 'budgetTrip',
      desc: '',
      args: [],
    );
  }

  /// `Adults`
  String get adults {
    return Intl.message('Adults', name: 'adults', desc: '', args: []);
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Infants`
  String get infants {
    return Intl.message('Infants', name: 'infants', desc: '', args: []);
  }

  /// `Total Members:`
  String get totalMembers {
    return Intl.message(
      'Total Members:',
      name: 'totalMembers',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Cities`
  String get cities {
    return Intl.message('Cities', name: 'cities', desc: '', args: []);
  }

  /// `Popular places`
  String get popular {
    return Intl.message('Popular places', name: 'popular', desc: '', args: []);
  }

  /// `Hotels`
  String get hotel {
    return Intl.message('Hotels', name: 'hotel', desc: '', args: []);
  }

  /// `Restaurants`
  String get restaurant {
    return Intl.message('Restaurants', name: 'restaurant', desc: '', args: []);
  }

  /// `Places`
  String get place {
    return Intl.message('Places', name: 'place', desc: '', args: []);
  }

  /// `Bookings`
  String get booking {
    return Intl.message('Bookings', name: 'booking', desc: '', args: []);
  }

  /// `Trip Time`
  String get tripTime {
    return Intl.message('Trip Time', name: 'tripTime', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Manage popular places`
  String get managePop {
    return Intl.message(
      'Manage popular places',
      name: 'managePop',
      desc: '',
      args: [],
    );
  }

  /// `Manage Hotels`
  String get manageHotel {
    return Intl.message(
      'Manage Hotels',
      name: 'manageHotel',
      desc: '',
      args: [],
    );
  }

  /// `Manage Restaurants`
  String get manageRes {
    return Intl.message(
      'Manage Restaurants',
      name: 'manageRes',
      desc: '',
      args: [],
    );
  }

  /// `Manage Places`
  String get managePlaces {
    return Intl.message(
      'Manage Places',
      name: 'managePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Manage Bookings`
  String get manageBooking {
    return Intl.message(
      'Manage Bookings',
      name: 'manageBooking',
      desc: '',
      args: [],
    );
  }

  /// `Manage Users`
  String get manageUser {
    return Intl.message('Manage Users', name: 'manageUser', desc: '', args: []);
  }

  /// `Manage Cities`
  String get manageCities {
    return Intl.message(
      'Manage Cities',
      name: 'manageCities',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
