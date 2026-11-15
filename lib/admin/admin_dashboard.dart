import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/admin/bookings/manage_bookings_screen.dart';
import 'package:sudan_tourist_guide/admin/categories/manage_categories_screen.dart';
import 'package:sudan_tourist_guide/admin/hotel/manage_hotels_screen.dart';
import 'package:sudan_tourist_guide/admin/restaurants/manage_restaurants_screen.dart';
import 'package:sudan_tourist_guide/admin/travels/manage_travels_screen.dart';
import 'package:sudan_tourist_guide/admin/trips/manage_trips_screen.dart';
import 'package:sudan_tourist_guide/admin/users/manage_user_screen.dart';
import 'package:sudan_tourist_guide/authentication_screens/sign_in.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/theme_notifire.dart';
import 'package:sudan_tourist_guide/screens/language_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static const pageRoute = 'admin_dashboard';
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool loading = true;

  int categoriesCount = 0;
  int travelsCount = 0;
  int hotelsCount = 0;
  int restaurantsCount = 0;
  int tripsCount = 0;
  int bookingsCount = 0;
  int usersCount = 0;
  Future<int> getCount(String endpoint) async {
    final response = await http.get(Uri.parse("$admin$endpoint"));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      // إذا كانت الاستجابة عبارة عن Map مثل users/get_users.php
      if (decoded is Map && decoded.containsKey("data")) {
        return (decoded["data"] as List).length;
      }

      // إذا كانت الاستجابة عبارة عن List مثل hotels/get_hotels.php
      if (decoded is List) {
        return decoded.length;
      }
    }

    return 0;
  }

  Future<void> loadDashboard() async {
    setState(() => loading = true);

    categoriesCount = await getCount("get_categories.php");
    travelsCount = await getCount("get_travels.php");
    hotelsCount = await getCount("get_hotels.php");
    restaurantsCount = await getCount("get_restaurants.php");
    tripsCount = await getCount("get_trips.php");
    bookingsCount = await getCount("get_bookings.php");
    usersCount = await getCount('get_users.php');

    setState(() => loading = false);
  }

  Widget buildCard(
    String title,
    int count,
    void Function()? onTap,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: myFonts,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "$count",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildListTile(
    BuildContext context,
    String text,
    void Function()? onPressed,
    IconData icon,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: myFonts,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ).fadeInRight(animate: true, duration: Duration(milliseconds: 400)),
          selected: true,
          selectedTileColor: Colors.blue,

          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: iconColor),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    loadDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifire themeNotifire = Provider.of<ThemeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).admin,
          style: TextStyle(fontFamily: myFonts, fontSize: 25),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                padding: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // ignore: deprecated_member_use
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  S.of(context).titleTabScreen1,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: myFonts,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // icon for dark mode
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SwitchListTile(
                    value: themeNotifire.isDarkMode,
                    onChanged: (_) => themeNotifire.changeAppTheme(),
                    title:
                        Text(
                          S.of(context).darkmode,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: myFonts,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ).fadeInRight(
                          animate: true,
                          duration: Duration(milliseconds: 400),
                        ),
                    secondary: AnimatedSwitcher(
                      duration: Duration(milliseconds: 550),
                      transitionBuilder: (child, animation) {
                        return RotationTransition(
                          turns: Tween<double>(
                            begin: 0.75,
                            end: 1,
                          ).animate(animation),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        key: ValueKey(themeNotifire.isDarkMode),
                        themeNotifire.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: themeNotifire.isDarkMode
                            ? Color(0xFFFFCC33)
                            : Color(0xFF8da1c8),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              buildListTile(
                context,
                S.of(context).Logout,
                () {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil(SignIn.pageRoute, (route) => false);
                },
                Icons.logout,
                Theme.of(context).iconTheme.color ?? Colors.grey,
              ),
              SizedBox(height: 15),

              // icon for language
              buildListTile(
                context,
                S.of(context).language,
                () {
                  Navigator.of(context).pushNamed(LanguageScreen.pageroute);
                },
                Icons.language,
                Theme.of(context).iconTheme.color ?? Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                buildCard(
                  S.of(context).cities,
                  categoriesCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageCategoriesScreen(),
                      ),
                    );
                  },
                  Icons.category,
                  Colors.orange,
                ),
                buildCard(
                  S.of(context).popular,
                  travelsCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageTravelsScreen(),
                      ),
                    );
                  },
                  Icons.travel_explore,
                  Colors.blue,
                ),
                buildCard(
                  S.of(context).hotel,
                  hotelsCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageHotelsScreen(),
                      ),
                    );
                  },
                  Icons.hotel,
                  Colors.green,
                ),
                buildCard(
                  S.of(context).restaurant,
                  restaurantsCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageRestaurantsScreen(),
                      ),
                    );
                  },
                  Icons.restaurant,
                  Colors.red,
                ),
                buildCard(
                  S.of(context).place,
                  tripsCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageTripsScreen(),
                      ),
                    );
                  },
                  Icons.map,
                  Colors.purple,
                ),
                buildCard(
                  S.of(context).booking,
                  bookingsCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageBookingsScreen(),
                      ),
                    );
                  },
                  Icons.book,
                  Colors.teal,
                ),
                buildCard(
                  S.of(context).users,

                  usersCount,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AdminUsersScreen()),
                    );
                  },
                  Icons.person,
                  Colors.cyan,
                ),
              ],
            ),
    );
  }
}
