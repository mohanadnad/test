import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';
import 'package:sudan_tourist_guide/constructros/travels_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import '../app_widget_desing/travels_design.dart';

class TravelsScreen extends StatelessWidget {
  const TravelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiGetServices();
    final langProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Skeletonizer(
        enabled: langProvider.isLoading,
        child: FutureBuilder<List<TravelsConstructor>>(
          future: api.getTravels(langProvider.locale.languageCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text(S.of(context).travelError));
            }
            final travels = snapshot.data!;
            return Container(
              padding: EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: travels.length,
                itemBuilder: (context, index) {
                  return TravelsDesign(
                    rating: travels[index].avgRating.toString(),
                    imageUrl: travels[index].imageUrl,
                    title: travels[index].title,
                    id: travels[index].id,
                    cityName: travels[index].cityName,
                    travelType: travels[index].travelType,
                    description: travels[index].discription,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
