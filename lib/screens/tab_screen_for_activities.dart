import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import '../constant/my_strings.dart';
import 'hotels_screen.dart';
import 'restaurant_screen.dart';
// import 'package:sudan_tourist_guide/app_information.dart';
import '../screens/trips_screen.dart';

class TabScreenForActivities extends StatelessWidget {
  const TabScreenForActivities({super.key});
  static const screenRoute = '/tab_screen_activities';
  @override
  Widget build(BuildContext context) {
    final myArguements =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final tripTitle = myArguements["title"];

    // ignore: unused_local_variable

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            tripTitle!,
            style: TextStyle(
              fontFamily: myFonts,
              fontSize: 30,
              color: Theme.of(context).textTheme.bodyLarge!.color,

              fontWeight: FontWeight.bold,
            ),
          ).fadeInDown(duration: Duration(milliseconds: 600)),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontFamily: myFonts,
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontWeight: FontWeight.bold,
            ),

            unselectedLabelStyle: TextStyle(
              fontFamily: myFonts,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            tabAlignment: TabAlignment.center,
            tabs: [
              Tab(text: S.of(context).places),
              Tab(text: S.of(context).attractions),
              Tab(text: S.of(context).restaurants),
            ],
            isScrollable: true,
            indicatorWeight: 2,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).textTheme.bodyMedium!.color,

            indicatorSize: TabBarIndicatorSize.label,
            indicatorAnimation: TabIndicatorAnimation.elastic,
          ),
        ),
        body: TabBarView(
          children: [TripsScreen(), HotelsScreen(), RestaurantScreen()],
        ),
      ),
    );
  }
}
