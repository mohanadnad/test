import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/travels_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class ManageTravelsScreen extends StatefulWidget {
  const ManageTravelsScreen({super.key});

  @override
  State<ManageTravelsScreen> createState() => _ManageTravelsScreenState();
}

class _ManageTravelsScreenState extends State<ManageTravelsScreen> {
  bool loading = true;
  List<TravelsConstructor> travels = [];

  Future<void> loadTravels() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_travels.php"));

    final List data = jsonDecode(response.body);

    travels = data.map((e) => TravelsConstructor.fromJson(e)).toList();

    setState(() => loading = false);
  }

  Future<void> deleteTravel(String id) async {
    await http.post(Uri.parse("${admin}delete_travel.php"), body: {"id": id});

    loadTravels();
  }

  // Function to add new travel
  void openAddDialog() {
    final id = TextEditingController();
    final title = TextEditingController();
    final titleEn = TextEditingController();
    final imageUrl = TextEditingController();
    final youtubeUrl = TextEditingController();
    final desc = TextEditingController();
    final descEn = TextEditingController();
    final city = TextEditingController();
    final cityEn = TextEditingController();
    final type = TextEditingController();
    final typeEn = TextEditingController();
    final rating = TextEditingController();
    // final categoryId = TextEditingController();
    final lat = TextEditingController();
    final lng = TextEditingController();
    final budget = TextEditingController();
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
        title: const Text("Add Travel"),
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
                controller: youtubeUrl,
                decoration: const InputDecoration(labelText: "YouTube URL"),
              ),
              TextField(
                controller: desc,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: descEn,
                decoration: const InputDecoration(labelText: "Description EN"),
              ),
              TextField(
                controller: city,
                decoration: const InputDecoration(labelText: "City"),
              ),
              TextField(
                controller: rating,
                decoration: const InputDecoration(labelText: "Rating"),
              ),
              TextField(
                controller: cityEn,
                decoration: const InputDecoration(labelText: "City EN"),
              ),
              TextField(
                controller: type,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: typeEn,
                decoration: const InputDecoration(labelText: "Travel Type EN"),
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
                controller: budget,
                decoration: const InputDecoration(labelText: "Budget"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}add_travel.php"),
                body: {
                  "id": id.text,
                  "title": title.text,
                  "titleEn": titleEn.text,
                  "imageUrl": imageUrl.text,
                  "youtubeUrl": youtubeUrl.text,
                  "discription": desc.text,
                  "descriptionEn": descEn.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "travelType": type.text,
                  "travelTypeEn": typeEn.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "budget": budget.text,
                  "rating": rating.text,
                },
              );
              Navigator.pop(context);
              loadTravels();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  //  Function to edit travel
  void openEditDialog(TravelsConstructor travel) {
    final title = TextEditingController(text: travel.title);
    final titleEn = TextEditingController(text: travel.titleEn);
    final imageUrl = TextEditingController(text: travel.imageUrl);
    final youtubeUrl = TextEditingController(text: travel.youtubeUrl);
    final desc = TextEditingController(text: travel.discription);
    final descEn = TextEditingController(text: travel.descriptionEn);
    final city = TextEditingController(text: travel.cityName);
    final cityEn = TextEditingController(text: travel.cityNameEn);
    final type = TextEditingController(text: travel.travelType);
    final typeEn = TextEditingController(text: travel.travelTypeEn);
    final rating = TextEditingController(text: travel.rating.toString());
    // final categoryId = TextEditingController(text: travel.categories);
    final lat = TextEditingController(
      text: travel.location.latitude.toString(),
    );
    final lng = TextEditingController(
      text: travel.location.longitude.toString(),
    );
    final budget = TextEditingController(text: travel.budget.toString());
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
    String selectedCategoryId = travel.categories;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Travel"),
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
                controller: youtubeUrl,
                decoration: const InputDecoration(labelText: "YouTube URL"),
              ),
              TextField(
                controller: rating,
                decoration: const InputDecoration(labelText: "Rating"),
              ),
              TextField(
                controller: desc,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: descEn,
                decoration: const InputDecoration(labelText: "Description EN"),
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
                controller: type,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: typeEn,
                decoration: const InputDecoration(labelText: "Travel Type EN"),
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
                controller: budget,
                decoration: const InputDecoration(labelText: "Budget"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}edit_travel.php"),
                body: {
                  "id": travel.id,
                  "title": title.text,
                  "titleEn": titleEn.text,
                  "imageUrl": imageUrl.text,
                  "youtubeUrl": youtubeUrl.text,
                  "discription": desc.text,
                  "descriptionEn": descEn.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "travelType": type.text,
                  "travelTypeEn": typeEn.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "budget": budget.text,
                  "rating": rating.text,
                },
              );
              Navigator.pop(context);
              loadTravels();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    loadTravels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).managePop,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            onPressed: openAddDialog,
          ),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: travels.length,
              itemBuilder: (context, index) {
                final travel = travels[index];
                return Card(
                  elevation: 11,
                  shadowColor: Theme.of(context).shadowColor,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        travel.imageUrl,
                        width: 90,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      travel.title,
                      style: TextStyle(fontFamily: myFonts, fontSize: 18),
                    ),
                    subtitle: Text(
                      travel.cityName,
                      style: TextStyle(fontFamily: myFonts, fontSize: 15),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconButtonDesign(
                          context,
                          travel,
                          Icons.list,
                          Colors.green,
                          () => openActivitiesDialog(travel.id),
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          context,
                          travel,
                          Icons.edit,
                          Colors.blue,
                          () => openEditDialog(travel),
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          context,
                          travel,
                          Icons.delete,
                          Colors.red,
                          () => deleteTravel(travel.id),
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
    TravelsConstructor travel,
    IconData icon,
    Color color,
    void Function()? onPressed,
  ) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 11,
      shadowColor: Theme.of(context).shadowColor,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }

  void openActivitiesDialog(String travelId) async {
    List activities = [];
    bool loading = true;

    // Load activities
    final response = await http.get(
      Uri.parse(
        "${admin}travels/get_travel_activities.php?travel_id=$travelId",
      ),
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
            title: const Text("Travel Activities"),
            content: SizedBox(
              width: 400,
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // List of activities
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
                                                      "${admin}travels/edit_travel_activity.php",
                                                    ),
                                                    body: {
                                                      "id": act["id"]
                                                          .toString(),
                                                      "travel_id": travelId,
                                                      "activities":
                                                          actController.text,
                                                      "activitiesEn":
                                                          actEnController.text,
                                                    },
                                                  );

                                                  Navigator.pop(context);
                                                  openActivitiesDialog(
                                                    travelId,
                                                  );
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
                                            "${admin}travels/delete_travel_activity.php",
                                          ),
                                          body: {"id": act["id"].toString()},
                                        );

                                        openActivitiesDialog(travelId);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),
                        const Divider(),

                        // Add new activity
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
                    Uri.parse("${admin}travels/add_travel_activity.php"),
                    body: {
                      "travel_id": travelId,
                      "activities": actController.text,
                      "activitiesEn": actEnController.text,
                    },
                  );

                  Navigator.pop(context);
                  openActivitiesDialog(travelId);
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
}
