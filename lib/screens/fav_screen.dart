import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
// import 'package:sudan_tourist_guide/constructros/resturnt_constructor.dart';
import 'package:sudan_tourist_guide/constructros/travels_constructor.dart';
import '../app_widget_desing/favorites_design.dart';
import '../constructros/hotel_constructor.dart';
import '../constructros/trips_constructor.dart';
import '../generated/l10n.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});
  static const pageRoute = '/fav_screen';
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    Future.microtask(() async {
      try {
        final provider = Provider.of<FavoritesScreen>(context, listen: false);
        final langProvider = Provider.of<LanguageProvider>(
          context,
          listen: false,
        );
        await provider.loadFavorites(
          langProvider.locale.languageCode,
        ); // تحميل البيانات من API
      } catch (e) {
        debugPrint("Error loading favorites: $e");
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesScreen>(context, listen: true);
    final items = provider.favoriteItems;
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).titleTabScreen2,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ).fadeIn(duration: Duration(milliseconds: 400)),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : items.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).emptyListMessage,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return FavoritesDesign(
                      imageUrl: item.imageUrl,
                      id: item.id,
                      title: item.title,
                      type: item is TripsConstructor
                          ? 'trip'
                          : item is HotelConstructor
                          ? 'hotel'
                          : item is TravelsConstructor
                          ? 'travel'
                          : 'restaurant',
                    );
                  },
                ),
          if (items.isNotEmpty)
            Positioned(
              bottom: 50,
              right: langProvider.locale.languageCode == 'ar' ? 15 : null,
              left: langProvider.locale.languageCode == 'en' ? 15 : null,
              child: FloatingActionButton(
                onPressed: () {
                  provider.clearFavorites();
                },
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
