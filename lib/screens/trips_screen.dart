import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import '../app_widget_desing/trips_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});
  static const screenRoute = '/trips_screen';

  @override
  Widget build(BuildContext context) {
    final myArguements =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = myArguements["id"];
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Skeletonizer(
        enabled: langProvider.isLoading,
        child: FutureBuilder(
          future: api.getTrips(langProvider.locale.languageCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text(S.of(context).placeError));
            }
            final selectedTrips = snapshot.data!
                .where((trip) => trip.categories == categoryId)
                .toList();
            if (selectedTrips.isEmpty) {
              return Center(child: Text('111'));
            }
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: selectedTrips.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredList(
                      position: index,

                      duration: const Duration(milliseconds: 400),

                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: TripsItem(
                            rating: selectedTrips[index].avgRating.toString(),
                            imageUrl: selectedTrips[index].imageUrl,
                            id: selectedTrips[index].id,
                            title: selectedTrips[index].title,
                          ),
                        ),
                      ),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
