// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/providers/favorites_screen.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/screens/trip_details_screen.dart';

class FavoritesDesign extends StatelessWidget {
  const FavoritesDesign({
    super.key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.type,
  });
  final String title;
  final String id;
  final String type;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final fave = Provider.of<FavoritesScreen>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 1),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            TripDetailsScreen.screenRoute,
            arguments: {'id': id, 'type': type},
          );
        },
        child: Card(
          elevation: 12,
          color: Theme.of(context).cardColor,
          shadowColor: Theme.of(context).shadowColor,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: .antiAlias,
          child: Stack(
            children: [
              Container(
                child: Hero(
                  tag: id,
                  // transitionOnUserGestures: true,
                  child: Image.network(
                    imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: langProvider.locale.languageCode == 'en' ? 15 : null,
                left: langProvider.locale.languageCode == 'ar' ? 15 : null,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    onPressed: () {
                      fave.toggleFavorite(id, langProvider.locale.languageCode);
                    },
                    icon: fave.isFavorite(id)
                        ? Icon(Icons.bookmark, color: Colors.white)
                        : Icon(Icons.bookmark_outline, color: Colors.white),
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
