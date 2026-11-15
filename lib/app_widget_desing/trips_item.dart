import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/my_strings.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_screen.dart';
import '../screens/trip_details_screen.dart';

class TripsItem extends StatelessWidget {
  const TripsItem({
    super.key,
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.rating,
  });
  final String imageUrl;
  final String id;
  final String title;
  final String rating;
  void navigatTo(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: {'id': id, 'type': 'trip'},
    );
  }

  // final provider = Provider.of<FavoritesScreen>(context);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesScreen>(context);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 1),
      child: GestureDetector(
        onTap: () => navigatTo(context),
        child: Card(
          shadowColor: Theme.of(context).shadowColor,
          color: Theme.of(context).cardColor,
          elevation: 12,

          // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Hero(
                tag: id,
                child: Image.network(
                  imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/i.png'),
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
                right: langProvider.locale.languageCode == 'ar' ? 15 : null,
                left: langProvider.locale.languageCode == 'en' ? 15 : null,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: myFonts,
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: langProvider.locale.languageCode == 'ar' ? 15 : null,
                right: langProvider.locale.languageCode == 'en' ? 15 : null,
                child: CircleAvatar(
                  radius: 22,

                  // foregroundColor: Colors.white,
                  backgroundColor: Colors.black54,
                  // here the consumer to inhernt the methods
                  child: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(
                        id,
                        langProvider.locale.languageCode,
                      );
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
                left: langProvider.locale.languageCode == 'en' ? 15 : null,
                right: langProvider.locale.languageCode == 'ar' ? 15 : null,
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
        ),
      ),
    );
  }
}
