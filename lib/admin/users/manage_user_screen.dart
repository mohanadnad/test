import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/admin/bookings/manage_bookings_screen.dart';
import 'package:sudan_tourist_guide/admin/users/user_constructor.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  List<UserConstructor> users = [];
  bool loading = true;
  Future<List<UserConstructor>> getUsers() async {
    final response = await http.get(Uri.parse('${admin}get_users.php'));
    print("RESPONSE BODY: ${response.body}");
    final data = jsonDecode(response.body);

    if (data["status"] == "success") {
      return (data["data"] as List)
          .map((e) => UserConstructor.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  @override
  void initState() {
    loadUsers();
    super.initState();
  }

  Future<void> deleteUserWithConfirmation(String userId) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete User"),
        content: Text("Are you sure you want to delete this user?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // close dialog

              await http.post(
                Uri.parse("${admin}delete_user.php"),
                body: {"user_id": userId},
              );

              loadUsers(); // refresh list
            },
            child: Text("Yes, Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void openEditUserDialog(UserConstructor user) {
    final name = TextEditingController(text: user.name);
    final email = TextEditingController(text: user.email);
    // final phone = TextEditingController(text: user.phone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit User"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
              ),
              // TextField(
              //   controller: phone,
              //   decoration: InputDecoration(labelText: "Phone"),
              // ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await http.post(
                Uri.parse("${admin}edit_user.php"),
                body: {
                  "user_id": user.userId,
                  "name": name.text,
                  "email": email.text,
                  // "phone": phone.text,
                },
              );

              Navigator.pop(context);
              loadUsers(); // refresh list
            },
            child: Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  Future<void> loadUsers() async {
    users = await getUsers();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).manageUser,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                final u = users[i];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            deleteUserWithConfirmation(u.userId);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {
                            openEditUserDialog(u);
                          },
                          icon: Icon(Icons.edit, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ManageBookingsScreen(
                                  filterUserId: u.userId,
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.book),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(u.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${u.email}"),

                        Text("UID: ${u.userId}"),
                        Text("Bookings: ${u.bookingsCount}"),
                        Text("Created: ${u.createdAt}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
