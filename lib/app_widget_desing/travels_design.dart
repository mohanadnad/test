// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/providers/favorites_screen.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/screens/trip_details_screen.dart';

class TravelsDesign extends StatelessWidget {
  const TravelsDesign({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.cityName,
    required this.travelType,
    required this.description,
    required this.rating,
  });

  final String imageUrl;
  final String title;
  final String id;
  final String cityName;
  final String travelType;
  final String description;
  final String rating;
  Container _buildTag(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: myFonts,
          fontSize: 17,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  void navigateToTravelDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: {'id': id, 'type': 'travel'},
    );
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final provider = Provider.of<FavoritesScreen>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: GestureDetector(
        onTap: () => navigateToTravelDetails(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            color: Theme.of(context).cardColor,
            shadowColor: Theme.of(context).shadowColor,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: .antiAlias,
            child: Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: id,

                      child: Image.network(
                        imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: langProvider.locale.languageCode == 'ar'
                          ? 15
                          : null,
                      left: langProvider.locale.languageCode == 'en'
                          ? 15
                          : null,
                      child: Row(
                        children: [
                          _buildTag(cityName, context),
                          SizedBox(width: 8),
                          _buildTag(travelType, context),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: langProvider.locale.languageCode == 'en'
                          ? 15
                          : null,
                      left: langProvider.locale.languageCode == 'ar'
                          ? 15
                          : null,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          onPressed: () {
                            provider.toggleFavorite(
                              id,
                              langProvider.locale.languageCode,
                            );
                          },
                          icon: provider.isFavorite(id)
                              ? Icon(Icons.bookmark, color: Colors.white)
                              : Icon(
                                  Icons.bookmark_outline,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: langProvider.locale.languageCode == 'en'
                          ? 15
                          : null,
                      right: langProvider.locale.languageCode == 'ar'
                          ? 15
                          : null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 12,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFFffd700)),
                            SizedBox(width: 10),
                            Text('$rating', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: myFonts,
                        fontSize: 23,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontWeight: FontWeight.bold,
                        // shadows: [Shadow(color: Colors.w, blurRadius: 6)],
                      ),
                    ),
                    // SizedBox(height: 10),
                    // Text(
                    //   description,
                    //   style: TextStyle(
                    //     fontFamily: myFonts,
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 15,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
