import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/trips_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class ManageTripsScreen extends StatefulWidget {
  const ManageTripsScreen({super.key});

  @override
  State<ManageTripsScreen> createState() => _ManageTripsScreenState();
}

class _ManageTripsScreenState extends State<ManageTripsScreen> {
  bool loading = true;
  List<TripsConstructor> trips = [];

  @override
  void initState() {
    super.initState();
    loadTrips();
  }

  Future<void> loadTrips() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_trips.php"));

    final List data = jsonDecode(response.body);

    trips = data.map((e) => TripsConstructor.fromJson(e)).toList();

    setState(() => loading = false);
  }

  Future<void> deleteTrip(String id) async {
    await http.post(Uri.parse("${admin}delete_trip.php"), body: {"id": id});

    loadTrips();
  }

  void openAddDialog() {
    final id = TextEditingController();
    final title = TextEditingController();
    final titleEn = TextEditingController();
    final imageUrl = TextEditingController();
    final city = TextEditingController();
    final cityEn = TextEditingController();
    final budget = TextEditingController();
    final rating = TextEditingController();
    final travelType = TextEditingController();
    final travelTypeEn = TextEditingController();

    // final categoryId = TextEditingController();
    final lat = TextEditingController();
    final lng = TextEditingController();
    final List<Map<String, String>> categories = [
      {'id': 'c1', 'name': 'Khartoum'},
      {'id': 'c2', 'name': 'Meroe'},
      {'id': 'c3', 'name': 'Port Sudan'},
      {'id': 'c4', 'name': 'Ad-Damazin'},
      {'id': 'c5', 'name': 'Kasla'},
      {'id': 'c6', 'name': 'Suakin'},
      {'id': 'c7', 'name': 'Krima'},
      {'id': 'c8', 'name': 'Darfur'},
      {'id': 'c9', 'name': 'Omdurman'},
    ];
    String selectedCategoryId = categories.isNotEmpty
        ? categories.first["id"]!
        : 'c1';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Trip"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: id,
                decoration: const InputDecoration(labelText: "ID"),
              ),

              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: titleEn,
                decoration: const InputDecoration(labelText: "Title EN"),
              ),
              TextField(
                controller: imageUrl,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
              TextField(
                controller: city,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextField(
                controller: cityEn,
                decoration: const InputDecoration(labelText: "City EN"),
              ),
              TextField(
                controller: travelType,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: travelTypeEn,
                decoration: const InputDecoration(labelText: "Travel Type En"),
              ),
              TextField(
                controller: rating,
                decoration: const InputDecoration(labelText: "Rating"),
              ),
              TextField(
                controller: budget,
                decoration: const InputDecoration(labelText: "Budget"),
              ),
              DropdownButtonFormField<String>(
                initialValue: selectedCategoryId,
                decoration: const InputDecoration(labelText: 'Category'),
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category['id'],
                    child: Text(category['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCategoryId = value!;
                },
              ),
              TextField(
                controller: lat,
                decoration: const InputDecoration(labelText: "Latitude"),
              ),
              TextField(
                controller: lng,
                decoration: const InputDecoration(labelText: "Longitude"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}add_trip.php"),
                body: {
                  "id": id.text,
                  "title": title.text,
                  "titleEn": titleEn.text,
                  "imageUrl": imageUrl.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "budget": budget.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "rating": rating.text,
                  "travelType": travelType.text,
                  "travelTypeEn": travelTypeEn.text,
                },
              );
              Navigator.pop(context);
              loadTrips();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void openEditDialog(TripsConstructor trip) {
    final title = TextEditingController(text: trip.title);
    final titleEn = TextEditingController(text: trip.titleEn);
    final imageUrl = TextEditingController(text: trip.imageUrl);
    final city = TextEditingController(text: trip.cityName);
    final cityEn = TextEditingController(text: trip.cityNameEn);
    final budget = TextEditingController(text: trip.budget.toString());
    // final categoryId = TextEditingController(text: trip.categories);
    final lat = TextEditingController(text: trip.location.latitude.toString());
    final lng = TextEditingController(text: trip.location.longitude.toString());
    final type = TextEditingController(text: trip.travelType);
    final typeEn = TextEditingController(text: trip.travelTypeEn);
    final rating = TextEditingController(text: trip.rating.toString());
    final List<Map<String, String>> categories = [
      {'id': 'c1', 'name': 'Khartoum'},
      {'id': 'c2', 'name': 'Meroe'},
      {'id': 'c3', 'name': 'Port Sudan'},
      {'id': 'c4', 'name': 'Ad-Damazin'},
      {'id': 'c5', 'name': 'Kasla'},
      {'id': 'c6', 'name': 'Suakin'},
      {'id': 'c7', 'name': 'Krima'},
      {'id': 'c8', 'name': 'Darfur'},
      {'id': 'c9', 'name': 'Omdurman'},
    ];
    String selectedCategoryId = trip.categories;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Trip"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: titleEn,
                decoration: const InputDecoration(labelText: "Title EN"),
              ),
              TextField(
                controller: imageUrl,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
              TextField(
                controller: city,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextField(
                controller: cityEn,
                decoration: const InputDecoration(labelText: "City EN"),
              ),
              TextField(
                controller: rating,
                decoration: const InputDecoration(labelText: "Rating"),
              ),
              TextField(
                controller: budget,
                decoration: const InputDecoration(labelText: "Budget"),
              ),
              DropdownButtonFormField<String>(
                initialValue: selectedCategoryId,
                decoration: const InputDecoration(labelText: 'Category'),
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category['id'],
                    child: Text(category['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedCategoryId = value!;
                },
              ),
              TextField(
                controller: lat,
                decoration: const InputDecoration(labelText: "Latitude"),
              ),
              TextField(
                controller: lng,
                decoration: const InputDecoration(labelText: "Longitude"),
              ),
              TextField(
                controller: type,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: typeEn,
                decoration: const InputDecoration(labelText: "Travel type en"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}edit_trip.php"),
                body: {
                  "id": trip.id,
                  "title": title.text,
                  "titleEn": titleEn.text,
                  "imageUrl": imageUrl.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "budget": budget.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "travleType": trip.travelType,
                  "travleTypeEn": trip.travelTypeEn,
                  "rating": rating.text,
                },
              );
              Navigator.pop(context);
              loadTrips();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void openActivitiesDialog(String tripId) async {
    List activities = [];
    bool loading = true;

    final response = await http.get(
      Uri.parse("${admin}get_trip_activities.php?trip_id=$tripId"),
    );

    activities = jsonDecode(response.body);
    loading = false;

    final actController = TextEditingController();
    final actEnController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text("Trip Activities"),
            content: SizedBox(
              width: 400,
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: activities.length,
                            itemBuilder: (context, index) {
                              final act = activities[index];
                              return ListTile(
                                title: Text(act["activities"]),
                                subtitle: Text(act["activitiesEn"]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        actController.text = act["activities"];
                                        actEnController.text =
                                            act["activitiesEn"];

                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text("Edit Activity"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: actController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText: "Activity",
                                                      ),
                                                ),
                                                TextField(
                                                  controller: actEnController,
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            "Activity EN",
                                                      ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await http.post(
                                                    Uri.parse(
                                                      "${admin}edit_trip_activity.php",
                                                    ),
                                                    body: {
                                                      "id": act["id"]
                                                          .toString(),
                                                      "trip_id": tripId,
                                                      "activities":
                                                          actController.text,
                                                      "activitiesEn":
                                                          actEnController.text,
                                                    },
                                                  );

                                                  Navigator.pop(context);
                                                  openActivitiesDialog(tripId);
                                                },
                                                child: const Text("Save"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        await http.post(
                                          Uri.parse(
                                            "${admin}delete_trip_activity.php",
                                          ),
                                          body: {"id": act["id"].toString()},
                                        );

                                        openActivitiesDialog(tripId);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        TextField(
                          controller: actController,
                          decoration: const InputDecoration(
                            labelText: "New Activity",
                          ),
                        ),
                        TextField(
                          controller: actEnController,
                          decoration: const InputDecoration(
                            labelText: "New Activity EN",
                          ),
                        ),
                      ],
                    ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await http.post(
                    Uri.parse("${admin}add_trip_activity.php"),
                    body: {
                      "trip_id": tripId,
                      "activities": actController.text,
                      "activitiesEn": actEnController.text,
                    },
                  );
                  Navigator.pop(context);
                  openActivitiesDialog(tripId);
                },
                child: const Text("Add Activity"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).managePlaces,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 25),
            onPressed: openAddDialog,
          ),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return Card(
                  color: Theme.of(context).cardColor.withOpacity(0.8),
                  shadowColor: Theme.of(context).shadowColor,
                  elevation: 11,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        trip.imageUrl,
                        width: 90,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/11.png'),
                      ),
                    ),
                    title: Text(
                      trip.title,
                      style: TextStyle(fontFamily: myFonts, fontSize: 18),
                    ),
                    subtitle: Text(
                      trip.cityName,
                      style: TextStyle(fontFamily: myFonts, fontSize: 14),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconButtonDesign(
                          context,
                          trip,
                          Icons.list,
                          Colors.green,
                          () => openActivitiesDialog(trip.id),
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          context,
                          trip,
                          Icons.edit,
                          Colors.blue,
                          () => openEditDialog(trip),
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          context,
                          trip,
                          Icons.delete,
                          Colors.red,
                          () => deleteTrip(trip.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Material iconButtonDesign(
    BuildContext context,
    TripsConstructor trip,
    IconData icon,
    Color color,
    void Function()? onPressed,
  ) {
    return Material(
      elevation: 8,
      shadowColor: Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(25),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
