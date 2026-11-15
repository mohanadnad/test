import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../authentication_screens/sign_in.dart';
import '../constant/my_strings.dart';
import '../generated/l10n.dart';
import 'on_boarding_widget.dart';
import '../providers/language_provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const pageRoute = '/onBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final finished = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              // padding: EdgeInsets.only(bottom: 10),
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  finished.onBoardingFinshed(index);
                },
                children: [
                  OnBoardingWidget(
                    imageUrl: 'assets/images/co1.png',
                    title: S.of(context).onboarding_title_2,
                    description: S.of(context).onboarding_subtitle_2,
                  ),
                  OnBoardingWidget(
                    imageUrl: 'assets/images/khartoum4.jpg',
                    title: S.of(context).onboarding_title_1,
                    description: S.of(context).onboarding_subtitle_1,
                  ),
                  OnBoardingWidget(
                    imageUrl: 'assets/images/chatGpt.png',
                    title: S.of(context).onboarding_title_3,
                    description: S.of(context).onboarding_subtitle_3,
                  ),
                  OnBoardingWidget(
                    imageUrl: 'assets/images/11.png',
                    title: S.of(context).onboarding_title_4,
                    description: S.of(context).onboarding_subtitle_4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            // top: 10,
            child: finished.isLastPage
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // elevated button to go to signIn page
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStatePropertyAll(5),
                            shadowColor: WidgetStatePropertyAll(
                              Theme.of(context).shadowColor,
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.cyanAccent,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          child: Text(
                            S.of(context).signOnboarding,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: myFonts,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.color,
                            ),
                          ),
                        ),
                        // elevated button for go back to previous page
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStatePropertyAll(5),
                            shadowColor: WidgetStatePropertyAll(
                              Theme.of(context).shadowColor,
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.cyanAccent,
                            ),
                          ),
                          onPressed: () {
                            controller.previousPage(
                              duration: Duration(microseconds: 550),
                              curve: Curves.easeInBack,
                            );
                          },
                          child: Text(
                            S.of(context).Back,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: myFonts,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.jumpToPage(3);
                          },
                          child: Text(
                            S.of(context).skip,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 4,
                            effect: WormEffect(
                              dotColor: Colors.white,

                              spacing: 16,
                              activeDotColor: Theme.of(
                                context,
                              ).textTheme.labelLarge!.color,
                            ),
                            onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            S.of(context).next,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      // bottomSheet:
    );
  }
}
