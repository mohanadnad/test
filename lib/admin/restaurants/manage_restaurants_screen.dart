import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import '../../constructros/resturnt_constructor.dart';

class ManageRestaurantsScreen extends StatefulWidget {
  const ManageRestaurantsScreen({super.key});

  @override
  State<ManageRestaurantsScreen> createState() =>
      _ManageRestaurantsScreenState();
}

class _ManageRestaurantsScreenState extends State<ManageRestaurantsScreen> {
  bool loading = true;
  List<ResturntConstructor> restaurants = [];

  Future<void> loadRestaurants() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_restaurants.php"));

    final List data = jsonDecode(response.body);

    restaurants = data.map((e) => ResturntConstructor.fromJson(e)).toList();

    setState(() => loading = false);
  }

  Future<void> deleteRestaurant(String id) async {
    await http.post(
      Uri.parse("${admin}delete_restaurant.php"),
      body: {"id": id},
    );

    loadRestaurants();
  }

  void openAddDialog() {
    final id = TextEditingController();
    final name = TextEditingController();
    final nameEn = TextEditingController();
    final imageUrl = TextEditingController();
    final city = TextEditingController();
    final cityEn = TextEditingController();
    final price = TextEditingController();
    final rating = TextEditingController();
    final webUrl = TextEditingController();
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
        title: const Text("Add Restaurant"),
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
                decoration: const InputDecoration(labelText: "Web Url"),
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
                decoration: const InputDecoration(labelText: "Travel Type En"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}add_restaurant.php"),
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
              loadRestaurants();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void openEditDialog(ResturntConstructor restaurant) {
    final name = TextEditingController(text: restaurant.title);
    final rating = TextEditingController(text: restaurant.rating.toString());
    final nameEn = TextEditingController(text: restaurant.titleEn);
    final imageUrl = TextEditingController(text: restaurant.imageUrl);
    final webUrl = TextEditingController(text: restaurant.webUrl);
    final city = TextEditingController(text: restaurant.cityName);
    final cityEn = TextEditingController(text: restaurant.cityNameEn);
    final price = TextEditingController(text: restaurant.budget.toString());
    // final categoryId = TextEditingController(text: restaurant.categories);
    final travelType = TextEditingController(text: restaurant.travelType);
    final travelTypeEn = TextEditingController(text: restaurant.travelTypeEn);
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
    String selectedCategoryId = restaurant.categories;
    final lat = TextEditingController(
      text: restaurant.location.latitude.toString(),
    );
    final lng = TextEditingController(
      text: restaurant.location.longitude.toString(),
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Restaurant"),
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
                Uri.parse("${admin}edit_restaurant.php"),
                body: {
                  "id": restaurant.id,
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
              loadRestaurants();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void openActivitiesDialog(String restaurantId) async {
    List activities = [];
    bool loading = true;

    final response = await http.get(
      Uri.parse(
        "${admin}get_restaurant_activities.php?restaurant_id=$restaurantId",
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
            title: const Text("Restaurant Activities"),
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
                                                      "${admin}edit_restaurant_activity.php",
                                                    ),
                                                    body: {
                                                      "id": act["id"]
                                                          .toString(),
                                                      "restaurant_id":
                                                          restaurantId,
                                                      "activities":
                                                          actController.text,
                                                      "activitiesEn":
                                                          actEnController.text,
                                                    },
                                                  );

                                                  Navigator.pop(context);
                                                  openActivitiesDialog(
                                                    restaurantId,
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
                                            "${admin}delete_restaurant_activity.php",
                                          ),
                                          body: {"id": act["id"].toString()},
                                        );

                                        openActivitiesDialog(restaurantId);
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
                    Uri.parse("${admin}add_restaurant_activity.php"),
                    body: {
                      "restaurant_id": restaurantId,
                      "activities": actController.text,
                      "activitiesEn": actEnController.text,
                    },
                  );
                  Navigator.pop(context);
                  openActivitiesDialog(restaurantId);
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
    loadRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).manageRes,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: openAddDialog),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Card(
                  shadowColor: Theme.of(context).shadowColor,
                  elevation: 11,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        restaurant.imageUrl,
                        width: 100,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              'assets/images/11.png',
                              width: 90,
                              height: 70,
                            ),
                      ),
                    ),
                    title: Text(
                      restaurant.title,
                      style: TextStyle(fontFamily: myFonts, fontSize: 18),
                    ),
                    subtitle: Text(
                      restaurant.cityName,
                      style: TextStyle(fontFamily: myFonts, fontSize: 14),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconButtonDesign(
                          context,
                          restaurant,
                          () => openActivitiesDialog(restaurant.id),
                          Icons.list,
                          Colors.green,
                        ),
                        SizedBox(width: 5),
                        iconButtonDesign(
                          context,
                          restaurant,
                          () => openEditDialog(restaurant),
                          Icons.edit,
                          Colors.blue,
                        ),
                        SizedBox(width: 5),

                        iconButtonDesign(
                          context,
                          restaurant,
                          () => deleteRestaurant(restaurant.id),
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

  Material iconButtonDesign(
    BuildContext context,
    ResturntConstructor restaurant,
    void Function()? onPressed,
    IconData icon,
    Color color,
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
