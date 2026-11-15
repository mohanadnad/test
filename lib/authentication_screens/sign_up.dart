// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/providers/theme_notifire.dart';
import 'sign_in.dart';
import '../cutsom_tools/custom_button.dart';
import '../cutsom_tools/custom_logo.dart';
import '../cutsom_tools/custom_txtfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const pageRoute = '/sign_up';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controllers ============
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();

  TextEditingController password = TextEditingController();

  // global key =============
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  // Function for sign in with google =============

  @override
  Widget build(BuildContext context) {
    Future<String?> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return null;
    }

    final appMode = Provider.of<ThemeNotifire>(context);
    final langProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.light
                ? [
                    Color(0xFFF7DCEB), // soft pink-peach
                    Color(0xFFFFEFE3), // light peach/cream
                  ]
                : [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            appMode.changeAppTheme();
                          },
                          icon: appMode.isDarkMode
                              ? Icon(Icons.light_mode)
                              : Icon(Icons.dark_mode),
                        ),
                        TextButton(
                          onPressed: () {
                            if (langProvider.locale.languageCode == 'ar') {
                              langProvider.changeLanguage('en', context);
                            } else {
                              langProvider.changeLanguage('ar', context);
                            }
                          },
                          child: Text(S.of(context).onAra),
                        ),
                      ],
                    ),
                    CustomLogo(),
                    SizedBox(height: 20),
                    // text for drscibe this page
                    Card(
                      color: Theme.of(context).cardColor,
                      elevation: 25,
                      shadowColor: Theme.of(context).shadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    S.of(context).signup_title,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.color,
                                    ),
                                  ),
                                  // SizedBox(height: 20),
                                  Text(
                                    S.of(context).signup_subtitle,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.color,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  // textField for user name
                                  CustomTxtfield(
                                    textInField: S.of(context).userNameField,
                                    textInlable: S.of(context).signup_username,
                                    icons: Icons.person,
                                    isPassword: false,
                                    textInputType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    myController: userName,
                                    validator: (val) {
                                      if (val == "") {
                                        return "This field can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  // textfield for email ===========
                                  CustomTxtfield(
                                    textInField: S.of(context).emailField,
                                    textInlable: S.of(context).signup_email,
                                    icons: Icons.email,
                                    isPassword: false,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    myController: email,
                                    validator: (val) {
                                      if (val == "") {
                                        return "This field can't be empty";
                                      }
                                      if (val!.length < 8) {
                                        return 'invalid email';
                                      }
                                      if (val.startsWith("3")) {
                                        return "email can't star with character 1-9-@#";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  // Textfield for password =======
                                  CustomTxtfield(
                                    onTap: () {
                                      appMode.toggleVisible();
                                    },
                                    textInField: S.of(context).passwordField,
                                    textInlable: S.of(context).signup_password,
                                    icons: appMode.isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    isPassword: !appMode.isVisible,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    myController: password,
                                    validator: (val) {
                                      if (val!.isEmpty || val == "") {
                                        return "This fiesl can't be empty";
                                      }
                                      if (val.length < 6) {
                                        return "Too short";
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: 15),
                                  CustomButton(
                                    onPressed: () async {
                                      if (formState.currentState!.validate()) {
                                        try {
                                          final credential = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                                email: email.text,
                                                password: password.text,
                                              );
                                          FirebaseAuth.instance.currentUser!
                                              .sendEmailVerification();

                                          AnimatedSnackBar.rectangle(
                                            animationDuration: Duration(
                                              milliseconds: 500,
                                            ),
                                            'Success',
                                            'We send you an email verification ',
                                            type: AnimatedSnackBarType.success,
                                            brightness: Brightness.light,
                                            mobileSnackBarPosition:
                                                MobileSnackBarPosition.bottom,
                                            animationCurve: Curves.bounceIn,
                                          ).show(context);
                                          await Future.delayed(
                                            Duration(seconds: 4),
                                          );
                                          Navigator.of(
                                            context,
                                          ).pushReplacementNamed(
                                            SignIn.pageRoute,
                                          );
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            AnimatedSnackBar.rectangle(
                                              'weak-password',
                                              'The password provided is too weak.',
                                              type:
                                                  AnimatedSnackBarType.warning,
                                              brightness: Brightness.light,
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.bottom,
                                              animationCurve: Curves.bounceIn,
                                            ).show(context);
                                          } else if (e.code ==
                                              'email-already-in-use') {
                                            AnimatedSnackBar.rectangle(
                                              'email-already-in-use',
                                              'The account already exists for that email.',
                                              type:
                                                  AnimatedSnackBarType.warning,
                                              brightness: Brightness.light,
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.bottom,
                                              animationCurve: Curves.bounceIn,
                                            ).show(context);
                                          }
                                        } catch (e) {
                                          print(e);
                                          AnimatedSnackBar.rectangle(
                                            '!!',
                                            '$e.',
                                            type: AnimatedSnackBarType.error,
                                            brightness: Brightness.light,
                                            mobileSnackBarPosition:
                                                MobileSnackBarPosition.bottom,
                                            animationCurve: Curves.bounceIn,
                                          ).show(context);
                                        }
                                      }
                                    },
                                    buttonText: S.of(context).signup_button,
                                  ),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 1,
                                            height: 20,
                                            color: Theme.of(
                                              context,
                                            ).dividerColor,
                                          ),
                                        ),
                                        Text(
                                          S.of(context).orSignUpWith,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge!.color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            thickness: 1,
                                            height: 20,
                                            color: Theme.of(
                                              context,
                                            ).dividerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  // A button for sign Up with google
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    child: SignInButton(
                                      btnColor: Theme.of(context).canvasColor,
                                      btnTextColor: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.color,
                                      imagePosition:
                                          langProvider.locale.languageCode ==
                                              'ar'
                                          ? ImagePosition.right
                                          : ImagePosition.left,
                                      btnText: S.of(context).google,
                                      buttonSize: ButtonSize.large,
                                      buttonType: ButtonType.google,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () {
                                        signInWithGoogle();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0,
                                      top: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context).signup_have_account,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                            ).pushReplacementNamed(
                                              SignIn.pageRoute,
                                            );
                                          },
                                          child: Text(
                                            S.of(context).signup_signin_now,
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // subtitel for the sing in page
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
