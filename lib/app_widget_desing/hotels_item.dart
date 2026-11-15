import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/my_strings.dart';
import '../providers/language_provider.dart';
import '../screens/trip_details_screen.dart';
import '../providers/favorites_screen.dart';

class HotelsItem extends StatelessWidget {
  const HotelsItem({
    super.key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.avgRating,
  });
  final String title;
  final String id;
  final String imageUrl;
  final String avgRating;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesScreen>(context);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 1),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            TripDetailsScreen.screenRoute,
            arguments: {'id': id, 'type': 'hotel'},
          );
        },
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
                right: langProvider.locale.languageCode == 'ar' ? 15 : null,
                left: langProvider.locale.languageCode == 'en' ? 15 : null,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: myFonts,
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: langProvider.locale.languageCode == 'ar' ? 15 : null,
                right: langProvider.locale.languageCode == 'en' ? 15 : null,
                child: CircleAvatar(
                  radius: 22,
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
                      Text('$avgRating', style: TextStyle(fontSize: 18)),
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
