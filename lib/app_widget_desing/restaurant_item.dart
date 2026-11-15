import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import '../constant/my_strings.dart';
import '../providers/favorites_screen.dart';
import '../screens/trip_details_screen.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.rating,
  });
  final String title;
  final String id;
  final String imageUrl;
  final String rating;
  void navigateTo(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: {'id': id, 'type': 'restaurant'},
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesScreen>(context);
    final lang = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 1),
      child: GestureDetector(
        onTap: () => navigateTo(context),
        child: Card(
          elevation: 12,
          shadowColor: Theme.of(context).shadowColor,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Theme.of(context).shadowColor,
          clipBehavior: .antiAlias,
          child: Stack(
            children: [
              Hero(
                tag: id,
                transitionOnUserGestures: true,
                child: Image.network(
                  imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: Text(
                  textAlign: TextAlign.right,
                  title,
                  style: TextStyle(
                    fontFamily: myFonts,
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                  ),
                  textDirection: .rtl,
                ),
              ),
              Positioned(
                top: 20,
                left: lang.locale.languageCode == 'ar' ? 15 : null,
                right: lang.locale.languageCode == 'en' ? 15 : null,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black54,
                  // here the consumer to inhernt the methods
                  child: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(id, lang.locale.languageCode);
                    },
                    icon: provider.isFavorite(id)
                        ? Icon(Icons.bookmark)
                        : Icon(Icons.bookmark_outline),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: lang.locale.languageCode == 'en' ? 15 : null,
                right: lang.locale.languageCode == 'ar' ? 15 : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 22,
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
        ),
      ),
    );
  }
}
