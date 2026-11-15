import 'package:flutter/material.dart';
import 'package:sudan_tourist_guide/admin/bookings/trip_bookings_screen.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/booking_constructor.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class TripTypeScreen extends StatefulWidget {
  final String tripId;
  final List<BookingConstructor> bookings;
  const TripTypeScreen({
    super.key,
    required this.tripId,
    required this.bookings,
  });

  @override
  State<TripTypeScreen> createState() => _TripTypeScreenState();
}

class _TripTypeScreenState extends State<TripTypeScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, List<BookingConstructor>> types = {};
    for (var b in widget.bookings) {
      types.putIfAbsent(b.tripTime, () => []);
      types[b.tripTime]!.add(b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tripTime,
          style: TextStyle(
            fontFamily: myFonts,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: types.entries.map((entry) {
          return Card(
            color: Theme.of(context).cardColor,
            elevation: 11,
            shadowColor: Theme.of(context).shadowColor,
            child: ListTile(
              title: Text(
                entry.key,
                style: TextStyle(
                  fontFamily: myFonts,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Bookings :${entry.value.length}',
                style: TextStyle(fontFamily: myFonts, fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TripBookingsScreen(
                      typeName: entry.key,
                      bookings: entry.value,
                    ),
                  ),
                ).then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
