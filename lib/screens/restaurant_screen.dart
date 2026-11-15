import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import '../app_widget_desing/restaurant_item.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

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
          future: api.getRestaurants(langProvider.locale.languageCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text(S.of(context).restaurantError));
            }
            final selectedRestaurants = snapshot.data!
                .where((restaurant) => restaurant.categories == categoryId)
                .toList();
            if (selectedRestaurants.isEmpty) {
              return Center(child: Text(S.of(context).restaurantError));
            }
            return ListView.builder(
              itemCount: selectedRestaurants.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 400),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 400),
                    child: RestaurantItem(
                      rating: selectedRestaurants[index].avgRating.toString(),
                      title: selectedRestaurants[index].title,
                      id: selectedRestaurants[index].id,
                      imageUrl: selectedRestaurants[index].imageUrl,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
