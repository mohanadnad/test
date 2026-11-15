import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/app_widget_desing/drawer_desing.dart';
import 'package:sudan_tourist_guide/app_widget_desing/tab_desing.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/cutsom_tools/filtering_method.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/providers/search_enging.dart';
import 'package:sudan_tourist_guide/screens/category_screen.dart';
import 'package:sudan_tourist_guide/screens/chat_pot.dart';
import 'package:sudan_tourist_guide/screens/travels_screen.dart';
import 'package:sudan_tourist_guide/screens/trip_details_screen.dart';

import 'all_places_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const pageRoute = '/tap_screen';
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lang = Provider.of<LanguageProvider>(
        context,
        listen: false,
      ).locale.languageCode;

      Provider.of<SearchEnging>(context, listen: false).loadPlaces(lang);
    });
  }

  void myScreens(int screenIndex) {
    setState(() {
      currentIndex = screenIndex;
    });
  }

  int currentIndex = 0;

  List<Map<String, dynamic>> get myListScreen {
    return [
      {
        "screen": const CategoryScreen(),
        "titel": S.of(context).titleTabScreen1,
      },
      {"screen": const AllPlacesScreen(), "titel": S.of(context).map},
      {"screen": const TravelsScreen(), "titel": S.of(context).titleTabScreen3},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<SearchEnging>(context);
    // final langProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          myListScreen[currentIndex]["titel"],
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ).fadeInDown(duration: Duration(milliseconds: 600)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ChatPot.pageRoute);
            },
            icon: Icon(Icons.auto_awesome),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return StatefulBuilder(
                    builder: (context, setModalState) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText:
                                    "Search hotels, restaurants, trips...",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onChanged: (value) {
                                // تحديث نتائج البحث في TabScreen
                                searchProv.search(value);

                                // تحديث الـ BottomSheet نفسه
                                setModalState(() {});
                              },
                            ),

                            SizedBox(height: 20),

                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                itemCount: searchProv.filteredSearch.length,
                                itemBuilder: (context, index) {
                                  final item = searchProv.filteredSearch[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        item.imageUrl,
                                      ),
                                    ),
                                    title: Text(item.title),
                                    subtitle: Text(item.type),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        TripDetailsScreen.screenRoute,
                                        arguments: {
                                          "id": item.id,
                                          "type": item.type,
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              FilteringMethod.show(context);
            },
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      drawer: DrawerDesing(),
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(child: myListScreen[currentIndex]["screen"]),
          Positioned(
            left: 1,
            right: 1,
            bottom: 20,
            child: TabDesing(currentIndex: myScreens, index: currentIndex),
          ),
        ],
      ),
    );
  }
}
