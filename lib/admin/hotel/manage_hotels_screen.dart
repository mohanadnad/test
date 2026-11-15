import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class ManageHotelsScreen extends StatefulWidget {
  const ManageHotelsScreen({super.key});

  @override
  State<ManageHotelsScreen> createState() => _ManageHotelsScreenState();
}

class _ManageHotelsScreenState extends State<ManageHotelsScreen> {
  bool loading = true;
  List<HotelConstructor> hotels = [];
  Future<void> loadHotels() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_hotels.php"));

    final List data = jsonDecode(response.body);

    hotels = data.map((e) => HotelConstructor.fromJson(e)).toList();

    setState(() => loading = false);
  }

  Future<void> deleteHotel(String id) async {
    await http.post(Uri.parse("${admin}delete_hotel.php"), body: {"id": id});

    loadHotels();
  }

  void openAddDialog() {
    final id = TextEditingController();
    final rating = TextEditingController();
    final name = TextEditingController();
    final nameEn = TextEditingController();
    final imageUrl = TextEditingController();
    final webUrl = TextEditingController();
    final city = TextEditingController();
    final cityEn = TextEditingController();
    final price = TextEditingController();
    // final categoryId = TextEditingController();
    final lat = TextEditingController();
    final lng = TextEditingController();
    final travelType = TextEditingController();
    final travelTypeEn = TextEditingController();
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
        title: const Text("Add Hotel"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: id,
                decoration: const InputDecoration(labelText: "ID"),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: nameEn,
                decoration: const InputDecoration(labelText: "Name EN"),
              ),
              TextField(
                controller: imageUrl,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
              TextField(
                controller: webUrl,
                decoration: const InputDecoration(labelText: "Web URL"),
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
                controller: price,
                decoration: const InputDecoration(labelText: "Price"),
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
                controller: travelType,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: travelTypeEn,
                decoration: const InputDecoration(labelText: "Travel Type en"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}add_hotel.php"),
                body: {
                  "id": id.text,
                  "title": name.text,
                  "titleEn": nameEn.text,
                  "imageUrl": imageUrl.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "budget": price.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "travelType": travelType.text,
                  "travelTypeEn": travelTypeEn.text,
                  "rating": rating.text,
                  "webUrl": webUrl.text,
                },
              );
              Navigator.pop(context);
              loadHotels();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void openEditDialog(HotelConstructor hotel) {
    final name = TextEditingController(text: hotel.title);
    final nameEn = TextEditingController(text: hotel.titleEn);
    final imageUrl = TextEditingController(text: hotel.imageUrl);
    final webUrl = TextEditingController(text: hotel.webUrl);
    final city = TextEditingController(text: hotel.cityName);
    final cityEn = TextEditingController(text: hotel.cityNameEn);
    final price = TextEditingController(text: hotel.budget.toString());
    final rating = TextEditingController(text: hotel.rating.toString());
    // final categoryId = TextEditingController(text: hotel.categories);
    final lat = TextEditingController(text: hotel.location.latitude.toString());
    final lng = TextEditingController(
      text: hotel.location.longitude.toString(),
    );
    final traveType = TextEditingController(text: hotel.travelType);
    final travelTypeEn = TextEditingController(text: hotel.travelTypeEn);
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
    String selectedCategoryId = hotel.categories;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Hotel"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: nameEn,
                decoration: const InputDecoration(labelText: "Name EN"),
              ),
              TextField(
                controller: imageUrl,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
              TextField(
                controller: webUrl,
                decoration: const InputDecoration(labelText: "web URL"),
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
                decoration: const InputDecoration(labelText: "rating"),
              ),
              TextField(
                controller: price,
                decoration: const InputDecoration(labelText: "Price"),
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
                controller: traveType,
                decoration: const InputDecoration(labelText: "Travel Type"),
              ),
              TextField(
                controller: travelTypeEn,
                decoration: const InputDecoration(labelText: "Travel Type en"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}edit_hotel.php"),
                body: {
                  "id": hotel.id,
                  "title": name.text,
                  "titleEn": nameEn.text,
                  "imageUrl": imageUrl.text,
                  "cityName": city.text,
                  "cityNameEn": cityEn.text,
                  "budget": price.text,
                  "categoryId": selectedCategoryId,
                  "latitude": lat.text,
                  "longitude": lng.text,
                  "travelType": traveType.text,
                  "travelTypeEn": travelTypeEn.text,
                  "rating": rating.text,
                  'webUrl': webUrl.text,
                },
              );
              Navigator.pop(context);
              loadHotels();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void openActivitiesDialog(String hotelId) async {
    List activities = [];
    bool loading = true;

    final response = await http.get(
      Uri.parse("${admin}hotel_activities.php?hotel_id=$hotelId"),
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
            title: const Text("Hotel Activities"),
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
                                                      "${admin}edit_activity.php",
                                                    ),
                                                    body: {
                                                      "id": act["id"]
                                                          .toString(),
                                                      "hotel_id": hotelId,
                                                      "activities":
                                                          actController.text,
                                                      "activitiesEn":
                                                          actEnController.text,
                                                    },
                                                  );

                                                  Navigator.pop(context);
                                                  openActivitiesDialog(hotelId);
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
                                            "${admin}delete_hotel_activity.php",
                                          ),
                                          body: {"id": act["id"].toString()},
                                        );

                                        openActivitiesDialog(hotelId);
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
                    Uri.parse("${admin}add_hotel_activity.php"),
                    body: {
                      "hotel_id": hotelId,
                      "activities": actController.text,
                      "activitiesEn": actEnController.text,
                    },
                  );
                  Navigator.pop(context);
                  openActivitiesDialog(hotelId);
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
  void initState() {
    loadHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).manageHotel,
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
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Card(
                  shadowColor: Theme.of(context).shadowColor,
                  elevation: 11,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        hotel.imageUrl,
                        width: 90,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/11.png'),
                      ),
                    ),
                    title: Text(
                      hotel.title,
                      style: TextStyle(fontSize: 18, fontFamily: myFonts),
                    ),
                    subtitle: Text(
                      hotel.cityName,
                      style: TextStyle(fontSize: 14, fontFamily: myFonts),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconButtonDesign(
                          hotel,
                          () => openActivitiesDialog(hotel.id),
                          Icons.list,
                          Colors.green,
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          hotel,
                          () => openEditDialog(hotel),
                          Icons.edit,
                          Colors.blue,
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          hotel,
                          () => deleteHotel(hotel.id),
                          Icons.delete,
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget iconButtonDesign(
    HotelConstructor hotel,
    void Function()? onPressed,
    IconData icon,
    Color color,
  ) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 8,
      shadowColor: Theme.of(context).shadowColor,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
