import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sudan_tourist_guide/admin/admin_dashboard.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/cutsom_tools/custome_icons.dart';
import 'sign_up.dart';
import '../cutsom_tools/custom_button.dart';
import '../cutsom_tools/custom_logo.dart';
import '../cutsom_tools/custom_txtfield.dart';
import '../generated/l10n.dart';
import '../providers/language_provider.dart';
import '../providers/theme_notifire.dart';
import '../screens/tab_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const pageRoute = '/sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

Future<void> sendUserBasicInfo() async {
  final user = FirebaseAuth.instance.currentUser;
  await http.post(
    Uri.parse(addUser),
    body: {
      "user_id": user!.uid,
      "name": user.displayName ?? '',
      "email": user.email,
    },
  );
}

class _SignInState extends State<SignIn> {
  // controllers ============
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // global key =============
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    // Function for sign in with google =============
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
      await sendUserBasicInfo();
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(TabScreen.pageRoute, (v) => false);
      return null;
    }

    final appMode = Provider.of<ThemeNotifire>(context);
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
                          child: Text(S.of(context).onAra),
                        ),
                      ],
                    ),
                    CustomLogo(),
                    SizedBox(height: 20),
                    // text for drscibe this page
                    Center(
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 15,
                        shadowColor: Theme.of(context).shadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(28),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      S.of(context).signIn,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge!.color,
                                      ),
                                    ),
                                    // subtitel for the sing in page
                                    Text(
                                      S.of(context).signInDescription,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge!.color,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    // textfield for email ===========
                                    CustomTxtfield(
                                      textInField: S.of(context).hint1,
                                      textInlable: S.of(context).emailField,
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
                                    SizedBox(height: 10),
                                    // Textfield for password =======
                                    CustomTxtfield(
                                      onTap: () {
                                        appMode.toggleVisible();
                                      },
                                      textInField: S.of(context).passwordField,
                                      textInlable: S.of(context).hint2,
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
                                    SizedBox(height: 7),
                                    // forget password button
                                    GestureDetector(
                                      onTap: () async {
                                        if (email == "") {
                                          AnimatedSnackBar.rectangle(
                                            "Warning",
                                            "Write your email ",
                                            type: AnimatedSnackBarType.warning,
                                            brightness: Theme.of(
                                              context,
                                            ).brightness,
                                            mobileSnackBarPosition:
                                                MobileSnackBarPosition.bottom,
                                          ).show(context);
                                          return;
                                        }
                                        try {
                                          await FirebaseAuth.instance
                                              .sendPasswordResetEmail(
                                                email: email.text,
                                              );
                                          AnimatedSnackBar.rectangle(
                                            'Success',
                                            'we send you a massege to your email pls check your email.',
                                            type: AnimatedSnackBarType.success,
                                            brightness: Theme.of(
                                              context,
                                            ).brightness,
                                            mobileSnackBarPosition:
                                                MobileSnackBarPosition.bottom,
                                            animationCurve: Curves.bounceIn,
                                          ).show(context);
                                        } catch (e) {
                                          AnimatedSnackBar.rectangle(
                                            "Error",
                                            '$e',
                                            type: AnimatedSnackBarType.error,
                                          ).show(context);
                                        }
                                      },
                                      child: Text(
                                        S.of(context).forget,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge!.color,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    CustomButton(
                                      onLongPress: () async {
                                        if (email.text == 'Admin' &&
                                            password.text == '123456789') {
                                          await Future.delayed(
                                            Duration(seconds: 2),
                                          );
                                          Navigator.of(
                                            context,
                                          ).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (_) => AdminDashboard(),
                                            ),
                                            (_) => true,
                                          );
                                        }
                                        if (email.text == '' ||
                                            password.text == '' ||
                                            email.text.isEmpty ||
                                            password.text.isEmpty ||
                                            email.text != 'Admin' ||
                                            password.text != '123456789') {
                                          AnimatedSnackBar.rectangle(
                                            animationDuration: Duration(
                                              microseconds: 250,
                                            ),
                                            'Error',
                                            'User name or password is wrong check again pls.',
                                            type: AnimatedSnackBarType.error,
                                            brightness: Theme.of(
                                              context,
                                            ).brightness,
                                            mobileSnackBarPosition:
                                                MobileSnackBarPosition.bottom,
                                            animationCurve: Curves.bounceIn,
                                          ).show(context);
                                        }
                                      },

                                      onPressed: () async {
                                        if (formState.currentState!
                                            .validate()) {
                                          try {
                                            final credential =
                                                await FirebaseAuth.instance
                                                    .signInWithEmailAndPassword(
                                                      email: email.text,
                                                      password: password.text,
                                                    );
                                            if (credential
                                                .user!
                                                .emailVerified) {
                                              await sendUserBasicInfo();
                                              Navigator.of(
                                                context,
                                              ).pushNamedAndRemoveUntil(
                                                TabScreen.pageRoute,
                                                (val) => false,
                                              );
                                            } else {
                                              AnimatedSnackBar.rectangle(
                                                'Error',
                                                'we send you a massege to your email pls check your email.',
                                                type:
                                                    AnimatedSnackBarType.error,
                                                brightness: Theme.of(
                                                  context,
                                                ).brightness,
                                                mobileSnackBarPosition:
                                                    MobileSnackBarPosition
                                                        .bottom,
                                                animationCurve: Curves.bounceIn,
                                              ).show(context);
                                            }
                                          } on FirebaseAuthException catch (e) {
                                            if (e.code == 'user-not-found') {
                                              // print('No user found for that email.');
                                              AnimatedSnackBar.rectangle(
                                                'Wrong',
                                                'No user found for that email.',
                                                type:
                                                    AnimatedSnackBarType.error,
                                                brightness: Brightness.light,
                                                mobileSnackBarPosition:
                                                    MobileSnackBarPosition
                                                        .bottom,
                                                animationCurve: Curves.bounceIn,
                                              ).show(context);
                                            } else if (e.code ==
                                                'wrong-password') {
                                              // print('Wrong password provided for that user.');
                                              AnimatedSnackBar.rectangle(
                                                'wrong password',
                                                'Wrong password provided for that user.',
                                                type:
                                                    AnimatedSnackBarType.error,
                                                brightness: Theme.of(
                                                  context,
                                                ).brightness,
                                                mobileSnackBarPosition:
                                                    MobileSnackBarPosition
                                                        .bottom,
                                                animationCurve: Curves.bounceIn,
                                              ).show(context);
                                            }
                                          }
                                        }
                                      },
                                      buttonText: S.of(context).signInButton,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
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
                                          S.of(context).divider,
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
                                    SizedBox(height: 8),
                                    // A button for sign in with google
                                    SignInButton(
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
                                            S.of(context).signupLineButton,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(
                                                context,
                                              ).pushReplacementNamed(
                                                SignUp.pageRoute,
                                              );
                                            },
                                            child: Text(
                                              S.of(context).signupLineButton2,
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
                    ),
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
