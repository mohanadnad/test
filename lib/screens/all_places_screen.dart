import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/app_widget_desing/map_icon.dart';
import 'package:sudan_tourist_guide/providers/search_enging.dart';
import '../app_widget_desing/map_style_selector.dart';
import '../constant/map_enum.dart';
import '../providers/language_provider.dart';
import '../providers/map_style_provider.dart';
import 'trip_details_screen.dart';

class AllPlacesScreen extends StatefulWidget {
  static const pageRoute = '/all_places';
  const AllPlacesScreen({super.key});

  @override
  State<AllPlacesScreen> createState() => _AllPlacesScreenState();
}

class _AllPlacesScreenState extends State<AllPlacesScreen> {
  final LatLng khartom = LatLng(15.5007, 32.5599);

  final MapController _mapController = MapController();

  void zoomIn() {
    _mapController.move(
      _mapController.camera.center,
      _mapController.camera.zoom + 1,
    );
  }

  void zoomOut() {
    _mapController.move(
      _mapController.camera.center,
      _mapController.camera.zoom - 1,
    );
  }

  Widget buildMapButtons(
    IconData icon,
    Function()? onPressed,
    BuildContext context,
  ) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      child: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final langProv = Provider.of<LanguageProvider>(context);
    final mapStyleProvider = Provider.of<MapStyleProvider>(context);
    final placesProv = Provider.of<SearchEnging>(context);
    final filteredPlaces = placesProv.filteredSearch;

    return Scaffold(
      // appBar: AppBar(title: Text(S.of(context).map), centerTitle: true),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(initialCenter: khartom, initialZoom: 12),
            children: [
              TileLayer(
                urlTemplate: getMapStyle(mapStyleProvider.currentStyle),
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.mohanad.sudan_tourist_guide',
              ),
              MarkerLayer(
                markers: filteredPlaces.map((place) {
                  print("Marker: ${place.title} - ${place.type}");
                  return Marker(
                    point: place.location,
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          TripDetailsScreen.screenRoute,
                          arguments: {"id": place.id, "type": place.type},
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            place.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 20,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 20),
                MapIcon(
                  iconData: Icons.home,
                  color: placesProv.selectedFilter == "all"
                      ? Colors.black38
                      : Colors.white,
                  onPressed: () {
                    placesProv.filterByType("all");
                  },
                ),

                MapIcon(
                  iconData: Icons.restaurant,
                  color: placesProv.selectedFilter == "restaurant"
                      ? Colors.black38
                      : Colors.white,
                  onPressed: () {
                    placesProv.filterByType("restaurant");
                  },
                ),

                MapIcon(
                  iconData: Icons.hotel,
                  color: placesProv.selectedFilter == "hotel"
                      ? Colors.black38
                      : Colors.white,
                  onPressed: () {
                    placesProv.filterByType("hotel");
                  },
                ),

                MapIcon(
                  iconData: Icons.card_travel,
                  color: placesProv.selectedFilter == "trip"
                      ? Colors.black38
                      : Colors.white,
                  onPressed: () {
                    placesProv.filterByType("trip");
                  },
                ),

                MapIcon(
                  iconData: Icons.search,
                  color: Colors.white,
                  onPressed: () {
                    if (placesProv.allSearch.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please wait, data is still loading...",
                          ),
                        ),
                      );
                      return;
                    }

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
                                      hintText: "Search places...",
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),

                                    onChanged: (value) {
                                      // تحديث الخريطة
                                      placesProv.search(value);

                                      // تحديث الـ BottomSheet
                                      setModalState(() {});
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Results: ${placesProv.filteredSearch.length}",
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            right: langProv.locale.languageCode == 'en' ? 20 : null,
            left: langProv.locale.languageCode == 'ar' ? 20 : null,

            child: Column(
              children: [
                buildMapButtons(Icons.layers, () {
                  showModalBottomSheet(
                    sheetAnimationStyle: AnimationStyle(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      reverseCurve: Curves.easeOut,
                    ),
                    // backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => MapStyleSelector(),
                  );
                }, context),
                SizedBox(height: 10),
                buildMapButtons(Icons.zoom_in, () {
                  zoomIn();
                }, context),
                SizedBox(height: 10),
                buildMapButtons(Icons.zoom_out, () {
                  zoomOut();
                }, context),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
