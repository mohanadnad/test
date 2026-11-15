import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
// import 'package:latlong2/latlong.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsDesign extends StatefulWidget {
  final dynamic detailItem;
  const MapsDesign({super.key, this.detailItem});

  @override
  State<MapsDesign> createState() => _MapsDesignState();
}

class _MapsDesignState extends State<MapsDesign> {
  // final LatLng location = LatLng(15.5007, 32.5599); // مثال: الخرطوم
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

  Widget buildFloatingActionButton(IconData icon, Function()? onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: null,
      mini: true,
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    final langProv = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: widget.detailItem.location,
                  initialZoom: 9.2,
                ),

                children: [
                  TileLayer(
                    // Bring your own tiles
                    urlTemplate:
                        'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',

                    userAgentPackageName: 'com.example.learning_fire_base_2',
                    // And many more recommended properties!
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 60,
                        height: 60,
                        point: widget.detailItem.location,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              widget.detailItem.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RichAttributionWidget(
                    // Include a stylish prebuilt attribution widget that meets all requirments
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(
                          Uri.parse('https://openstreetmap.org/copyright'),
                        ), // (external)
                      ),
                      // Also add images...
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: langProv.locale.languageCode == 'en' ? 10 : null,
                left: langProv.locale.languageCode == 'ar' ? 10 : null,
                child: Column(
                  children: [
                    buildFloatingActionButton(Icons.add, () {
                      zoomIn();
                    }),
                    SizedBox(height: 10),
                    buildFloatingActionButton(Icons.remove, () {
                      zoomOut();
                    }),
                    buildFloatingActionButton(Icons.my_location, () {
                      _mapController.move(widget.detailItem.location, 12);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
