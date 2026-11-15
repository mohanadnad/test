import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/trips_constructor.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
// import 'package:sudan_tourist_guide/screens/booking/edit_booking_screen.dart';

class UserBookingsScreen extends StatefulWidget {
  const UserBookingsScreen({super.key});
  static const screenRoute = '/user_bookings_screen';
  @override
  State<UserBookingsScreen> createState() => _UserBookingsScreenState();
}

class _UserBookingsScreenState extends State<UserBookingsScreen> {
  bool isLoading = true;

  List<dynamic> bookings = [];
  // List<HotelConstructor> hotels = [];
  List<TripsConstructor> trips = [];
  final ApiGetServices api = ApiGetServices();
  Future<void> deleteBooking(String bookingId) async {
    final response = await http.post(
      Uri.parse(deleteBookingApi),
      body: {'booking_id': bookingId},
    );
    final data = jsonDecode(response.body);
    if (data["status"] == "success") {
      setState(() {
        bookings.removeWhere((b) => b["id"].toString() == bookingId);
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Booking deleted successfully")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed: ${data["message"]}")));
    }
  }

  TripsConstructor? getTripById(String id) {
    try {
      return trips.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  // HotelConstructor? getHotelById(String id) {
  //   try {
  //     return hotels.firstWhere((hotel) => hotel.id == id);
  //   } catch (_) {
  //     return null;
  //   }
  // }

  Future<void> getBookings() async {
    final user = FirebaseAuth.instance.currentUser;

    // print("=== FETCH BOOKINGS FOR USER ===");
    // print("USER ID: ${user!.uid}");

    final response = await http.get(
      Uri.parse("$getUrserBookings?user_id=${user!.uid}"),
    );

    // print("=== RAW RESPONSE ===");
    // print(response.body);

    final data = jsonDecode(response.body);

    // print("=== PARSED BOOKINGS ===");
    // print(data["bookings"]);
    // print("COUNT: ${data["bookings"].length}");

    if (data["status"] == "success") {
      setState(() {
        bookings = data["bookings"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadData(String lang) async {
    // hotels = await api.getHotels(lang);
    trips = await api.getTrips(lang);
    await getBookings();
  }

  @override
  void initState() {
    final lang = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).locale.languageCode;
    loadData(lang);
    super.initState();
  }

  Widget bookingCard(
    dynamic booking,
    TripsConstructor? trip,
    // HotelConstructor? hotel,
  ) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              trip?.imageUrl ?? 'https://placehold.co/150',
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '  ${trip?.title} ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: myFonts,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                // Text(
                //   "Hotel: ${hotel?.title}",
                //   style: TextStyle(
                //     fontFamily: myFonts,
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Text(
                  "Trip Type: ${booking["trip_time"]}",
                  style: TextStyle(
                    fontFamily: myFonts,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Total: ${booking["total_price"]} SDG",
                  style: TextStyle(
                    fontFamily: myFonts,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // IconButton(
                    //   onPressed: () async {
                    //     final updated = await Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (_) => EditBookingScreen(booking: booking),
                    //       ),
                    //     );
                    //     if (updated == true) {
                    //       await getBookings();
                    //     }
                    //   },
                    //   icon: Icon(Icons.edit, color: Colors.blue),
                    // ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Delete Booking"),
                            content: Text(
                              "Are you sure you want to delete this booking?",
                            ),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text("Delete"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  deleteBooking(booking["id"].toString());
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Text(
                        'Delete Booking',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: myFonts,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookings",
          style: TextStyle(fontFamily: myFonts, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? Center(
              child: Text(
                "No bookings found",
                style: TextStyle(fontSize: 20, fontFamily: myFonts),
              ),
            )
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                final trip = getTripById(booking['trip_id']);
                // final hotel = getHotelById(booking['hotel_id']);

                return bookingCard(booking, trip);
              },
            ),
    );
  }
}
