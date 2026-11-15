import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/booking_constructor.dart';

class TripBookingsScreen extends StatefulWidget {
  final String typeName;
  final List<BookingConstructor> bookings;
  const TripBookingsScreen({
    super.key,
    required this.typeName,
    required this.bookings,
  });

  @override
  State<TripBookingsScreen> createState() => _TripBookingsScreenState();
}

class _TripBookingsScreenState extends State<TripBookingsScreen> {
  late List<BookingConstructor> bookings;
  @override
  void initState() {
    bookings = List.from(widget.bookings);
    super.initState();
  }

  Future<void> deleteBooking(String id) async {
    await http.post(Uri.parse("${admin}delete_booking.php"), body: {"id": id});
    setState(() {
      bookings.removeWhere((booking) => booking.id == id);
    });
    Navigator.pop(context, true);
  }

  void openEditBookingDialog(BookingConstructor b) {
    final adults = TextEditingController(text: b.adults.toString());
    final children = TextEditingController(text: b.children.toString());
    final infants = TextEditingController(text: b.infants.toString());
    final tripTime = TextEditingController(text: b.tripTime);
    final userName = TextEditingController(text: b.userName);
    final phoneNumer = TextEditingController(text: b.phone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit Booking"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: userName,
                decoration: InputDecoration(labelText: "Email"),
              ),

              TextField(
                controller: phoneNumer,
                decoration: InputDecoration(labelText: "Phone Numer"),
              ),
              TextField(
                controller: adults,
                decoration: InputDecoration(labelText: "Adults"),
              ),
              TextField(
                controller: children,
                decoration: InputDecoration(labelText: "Children"),
              ),
              TextField(
                controller: infants,
                decoration: InputDecoration(labelText: "Infants"),
              ),
              TextField(
                controller: tripTime,
                decoration: InputDecoration(labelText: "Trip Time"),
              ),
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
                Uri.parse("${admin}edit_booking.php"),
                body: {
                  "id": b.id,
                  'user_name': userName.text,
                  'phone': phoneNumer.text,
                  "adults": adults.text,
                  "children": children.text,
                  "infants": infants.text,
                  "trip_time": tripTime.text,
                },
              );

              final updated = BookingConstructor(
                email: b.email,
                id: b.id,
                userId: b.userId,
                userName: b.userName,
                phone: b.phone,
                tripId: b.tripId,
                adults: int.parse(adults.text),
                children: int.parse(children.text),
                infants: int.parse(infants.text),
                totalPrice: b.totalPrice,
                tripTime: tripTime.text,
                createdAt: b.createdAt,
              );

              setState(() {
                final index = bookings.indexWhere((x) => x.id == b.id);
                bookings[index] = updated;
              });

              // رجوع للشاشة السابقة لإعادة التحميل
              Navigator.pop(context, true);
            },
            child: Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.typeName), centerTitle: true),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (_, index) {
          final b = bookings[index];
          return Card(
            color: Theme.of(context).cardColor,
            elevation: 11,
            shadowColor: Theme.of(context).shadowColor,
            child: ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => openEditBookingDialog(b),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteBooking(b.id),
                  ),
                ],
              ),
              title: Text("User: ${b.userName}"),
              subtitle: Text(
                "Phone: ${b.phone}\n"
                "email: ${b.email}\n"
                "Adults: ${b.adults}\n"
                "Children: ${b.children}\n"
                "Infants: ${b.infants}\n"
                "Total: ${b.totalPrice}\n"
                "Trip Time: ${b.tripTime}\n"
                "Created: ${b.createdAt}",
              ),
            ),
          );
        },
      ),
    );
  }
}
