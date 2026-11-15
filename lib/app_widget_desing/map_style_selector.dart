import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import '../constant/map_enum.dart';
import '../generated/l10n.dart';
import '../providers/map_style_provider.dart';

class MapStyleSelector extends StatelessWidget {
  const MapStyleSelector({super.key});
  Widget buildListTile(
    String text,
    Function()? onTap,
    String imageUrl,
    BuildContext context,
  ) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Text(
        text,

        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).textTheme.titleLarge!.color,
          fontFamily: myFonts,
        ),
      ),
      onTap: onTap,
      leading: Container(
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mapDesign = Provider.of<MapStyleProvider>(context);
    return Container(
      // decoration: BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            S.of(context).choosMapStyle,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.titleLarge!.color,
              fontFamily: myFonts,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            S.of(context).ligtMap,
            () {
              mapDesign.changStyle(MapStyle.light);
              Navigator.of(context).pop();
            },
            'assets/images/light_map.jpg',
            context,
          ),
          SizedBox(height: 10),
          buildListTile(
            S.of(context).darkMap,
            () {
              mapDesign.changStyle(MapStyle.dark);
              Navigator.of(context).pop();
            },
            'assets/images/dark_map.jpg',
            context,
          ),
          SizedBox(height: 10),
          buildListTile(
            S.of(context).sateliteMap,
            () {
              mapDesign.changStyle(MapStyle.satellite);
              Navigator.of(context).pop();
            },
            'assets/images/satelite.webp',
            context,
          ),
        ],
      ),
    );
  }
}
