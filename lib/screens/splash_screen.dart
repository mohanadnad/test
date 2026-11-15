// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sudan_tourist_guide/providers/language_provider.dart';
// // import 'package:flutter_animate/flutter_animate.dart';
// // import 'package:sudan_tourist_guide/onboarding/on_boarding_screen.dart';
// // import 'package:sudan_tourist_guide/screens/tab_screen.dart';

// class SplashScreen extends StatefulWidget {
//   // final bool showHome;
//   // const SplashScreen({super.key, required this.showHome});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   dynamic get showHome => showHome;

//   @override
//   Widget build(BuildContext context) {
//     langPro = Provider.of<LanguageProvider>(context);
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/style1.png',
//             width: size.width,
//             height: size.height,
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 TypewriterAnimatedText(
//                   'Hello world!',
//                   textStyle: const TextStyle(
//                     fontSize: 32.0,
//                     fontFamily:langPro.,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 500),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
