import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/providers/search_enging.dart';
import 'package:sudan_tourist_guide/screens/trip_details_screen.dart';

class FilteringMethod {
  static void show(BuildContext context) {
    final prov = Provider.of<SearchEnging>(context, listen: false);
    final currentLang = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).locale.languageCode;

    String selectedTripType = prov.selectedTripType;
    String selectedCity = prov.selectedCity;

    // VALUES USED FOR FILTERING (backend values)
    final List<String> tripTypes = [
      "all",
      "Cultural",
      "Nature",
      "Sea trip",
      "Historical",
      "hotel",
      "restaurant",
    ];
    final List<String> cities = [
      "all",
      "Khartoum",
      "Omdurman",
      "Port Sudan",
      "Kassala",
      "Merowe",
      "Ad-Damazin",
      "Suakin",
      "Karima",
      "Darfur",
    ];

    // TRANSLATED VALUES FOR UI

    final List<String> tripTypesUI = currentLang == "ar"
        ? ["الكل", "ثقافية", "طبيعة", "رحلة بحرية", "تاريخية", "فندق", "مطعم"]
        : [
            "All",
            "Cultural",
            "Nature",
            "Sea trip",
            "Historical",
            "hotel",
            "restaurant",
          ];

    final List<String> citiesUI = currentLang == "ar"
        ? [
            "الكل",
            "الخرطوم",
            "أمدرمان",
            "بورتسودان",
            "كسلا",
            "مروي",
            "الدمزين",
            "سواكن",
            "كريمة",
            "دارفور",
          ]
        : [
            "All",
            "Khartoum",
            "Omdurman",
            "Port Sudan",
            "Kasla",
            "Merowe",
            "Ad-Damazin",
            "Suakin",
            "Karima",
            "Darfur",
          ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).selectTripType,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: myFonts,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      children: List.generate(tripTypes.length, (index) {
                        return ChoiceChip(
                          label: Text(
                            tripTypesUI[index],
                            style: TextStyle(
                              fontFamily: myFonts,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          selected:
                              selectedTripType ==
                              (currentLang == 'ar'
                                  ? tripTypesUI[index]
                                  : tripTypes[index]),
                          onSelected: (_) {
                            setState(() {
                              selectedTripType = currentLang == 'ar'
                                  ? tripTypesUI[index]
                                  : tripTypes[index];
                            });
                          },
                        );
                      }),
                    ),

                    const SizedBox(height: 20),
                    // for the cities
                    Text(
                      S.of(context).selectCity,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: myFonts,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      children: List.generate(cities.length, (index) {
                        return ChoiceChip(
                          label: Text(
                            citiesUI[index],
                            style: TextStyle(
                              fontFamily: myFonts,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          selected:
                              selectedCity ==
                              (currentLang == 'ar'
                                  ? citiesUI[index]
                                  : cities[index]),
                          onSelected: (_) {
                            setState(() {
                              selectedCity = currentLang == 'ar'
                                  ? citiesUI[index]
                                  : cities[index];
                            });
                          },
                        );
                      }),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          prov.selectedTripType = selectedTripType;
                          prov.selectedCity = selectedCity;

                          prov.filterCombined(currentLang);
                          setState(() {});
                          // Navigator.pop(context);
                        },
                        child: Text(
                          S.of(context).applyFilter,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: myFonts,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: prov.filteredSearch.length,
                        itemBuilder: (context, index) {
                          final item = prov.filteredSearch[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                item.imageUrl,
                                scale: 25,
                              ),
                            ),
                            title: Text(
                              item.title,
                              style: TextStyle(
                                fontFamily: myFonts,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              currentLang == 'ar'
                                  ? item.travelType
                                  : item.travelTypeEn,
                              style: TextStyle(
                                fontFamily: myFonts,
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                TripDetailsScreen.screenRoute,
                                arguments: {"id": item.id, "type": item.type},
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
