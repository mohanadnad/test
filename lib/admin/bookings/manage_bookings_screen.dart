import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/admin/bookings/trip_type_screen.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
import 'package:sudan_tourist_guide/constructros/trips_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import '../../constructros/booking_constructor.dart';

class ManageBookingsScreen extends StatefulWidget {
  const ManageBookingsScreen({super.key, this.filterUserId});
  final String? filterUserId;
  @override
  State<ManageBookingsScreen> createState() => _ManageBookingsScreenState();
}

class _ManageBookingsScreenState extends State<ManageBookingsScreen> {
  bool loading = true;
  List<BookingConstructor> bookings = [];
  List<HotelConstructor> hotels = [];
  List<TripsConstructor> trips = [];
  Map<String, List<BookingConstructor>> bookingsByTrip = {};

  final ApiGetServices api = ApiGetServices();
  void openTripTypesScreen(
    String tripId,
    List<BookingConstructor> tripBookings,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TripTypeScreen(tripId: tripId, bookings: tripBookings),
      ),
    );
  }

  TripsConstructor? getTripById(String id) {
    try {
      return trips.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  HotelConstructor? getHotelById(String id) {
    try {
      return hotels.firstWhere((h) => h.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadBookings() async {
    setState(() => loading = true);

    final response = await http.get(Uri.parse("${admin}get_bookings.php"));

    final List data = jsonDecode(response.body);
    bookings = data.map((e) => BookingConstructor.fromJson(e)).toList();
    if (widget.filterUserId != null) {
      bookings = bookings
          .where((book) => book.userId == widget.filterUserId)
          .toList();
    }
    bookingsByTrip.clear();
    for (var b in bookings) {
      bookingsByTrip.putIfAbsent(b.tripId, () => []);
      bookingsByTrip[b.tripId]!.add(b);
    }
    setState(() => loading = false);
  }

  Future<void> loadData() async {
    hotels = await api.getHotels("en");
    trips = await api.getTrips("en");
    await loadBookings();

    setState(() => loading = false);
  }

  Future<void> deleteBooking(String id) async {
    await http.post(Uri.parse("${admin}delete_booking.php"), body: {"id": id});
    loadBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).manageBooking,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: bookingsByTrip.entries.map((entry) {
                final tripId = entry.key;
                final tripBookings = entry.value;
                final trip = getTripById(tripId);
                return Card(
                  color: Theme.of(context).cardColor,
                  elevation: 11,
                  shadowColor: Theme.of(context).shadowColor,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        trip?.imageUrl ?? 'https://placehold.co/100',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    title: Text(
                      trip?.title ?? 'Unknown tirp',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: myFonts,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Total Bookings: ${tripBookings.length}',
                      style: TextStyle(fontFamily: myFonts, fontSize: 18),
                    ),
                    onTap: () {
                      openTripTypesScreen(tripId, tripBookings);
                    },
                  ),
                );
              }).toList(),
            ),
    );
  }
}
