import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:sudan_tourist_guide/app_widget_desing/hotels_item.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});
  static const myRoute = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    final myArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryId = myArgument['id'];
    // final selectedHotel = hotelsData
    //     .where((hotel) => hotel.categories.contains(id))
    //     .toList();
    final langProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Skeletonizer(
        enabled: langProvider.isLoading,
        child: FutureBuilder(
          future: api.getHotels(langProvider.locale.languageCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text(S.of(context).hoterError));
            }
            final selectedHotels = snapshot.data!
                .where((hotel) => hotel.categories == categoryId)
                .toList();
            if (selectedHotels.isEmpty) {
              return Center(child: Text(S.of(context).hoterError));
            }
            return ListView.builder(
              itemCount: selectedHotels.length,
              itemBuilder: (context, index) {
                final hotel = selectedHotels[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 400),
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: HotelsItem(
                      avgRating: hotel.avgRating.toString(),
                      title: hotel.title,
                      id: hotel.id,
                      imageUrl: hotel.imageUrl,
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
