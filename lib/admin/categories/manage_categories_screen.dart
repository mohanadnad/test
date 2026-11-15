import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/category_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  bool loading = true;
  List<CategoryConstructor> categories = [];
  Future<void> loadCategories() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_categories.php"));

    final List data = jsonDecode(response.body);

    categories = data.map((e) => CategoryConstructor.fromJson(e)).toList();

    setState(() => loading = false);
  }

  Future<void> deleteCategory(String id) async {
    await http.post(Uri.parse("${admin}delete_category.php"), body: {"id": id});

    loadCategories();
  }

  void openAddDialog() {
    final idController = TextEditingController();
    final titleController = TextEditingController();
    final titleEnController = TextEditingController();
    final imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Category"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: "ID"),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: titleEnController,
                decoration: const InputDecoration(labelText: "Title EN"),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}add_category.php"),
                body: {
                  "id": idController.text,
                  "title": titleController.text,
                  "title_en": titleEnController.text,
                  "imageUrl": imageUrlController.text,
                },
              );
              Navigator.pop(context);
              loadCategories();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void openEditDialog(CategoryConstructor cat) {
    final titleController = TextEditingController(text: cat.title);
    final titleEnController = TextEditingController(text: cat.titleEn);
    final imageUrlController = TextEditingController(text: cat.imageUrl);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Category"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: titleEnController,
                decoration: const InputDecoration(labelText: "Title EN"),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}edit_category.php"),
                body: {
                  "id": cat.id,
                  "title": titleController.text,
                  "title_en": titleEnController.text,
                  "imageUrl": imageUrlController.text,
                },
              );
              Navigator.pop(context);
              loadCategories();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).manageCities,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: openAddDialog),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return Card(
                  shadowColor: Theme.of(context).shadowColor,
                  elevation: 12,
                  color: Theme.of(context).cardColor,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        cat.imageUrl,
                        width: 90,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    minVerticalPadding: 25,
                    title: Text(
                      cat.title,
                      style: TextStyle(fontFamily: myFonts, fontSize: 20),
                    ),
                    // subtitle: Text(cat.titleEn),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconButtonDesign(
                          context,
                          cat,
                          Icons.edit,
                          Colors.blue,
                          () => openEditDialog(cat),
                        ),
                        SizedBox(width: 10),
                        iconButtonDesign(
                          context,
                          cat,
                          Icons.delete,
                          Colors.red,
                          () => deleteCategory(cat.id),
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
    CategoryConstructor cat,
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
}
