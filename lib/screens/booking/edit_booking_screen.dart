import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';

class EditBookingScreen extends StatefulWidget {
  final dynamic booking;

  const EditBookingScreen({super.key, required this.booking});

  @override
  State<EditBookingScreen> createState() => _EditBookingScreenState();
}

class _EditBookingScreenState extends State<EditBookingScreen> {
  late TextEditingController adultsController;
  late TextEditingController childrenController;
  late TextEditingController infantsController;

  @override
  void initState() {
    adultsController = TextEditingController(
      text: widget.booking["adults"].toString(),
    );
    childrenController = TextEditingController(
      text: widget.booking["children"].toString(),
    );
    infantsController = TextEditingController(
      text: widget.booking["infants"].toString(),
    );
    super.initState();
  }

  Future<void> updateBooking() async {
    final bookingId = widget.booking["id"].toString();

    final response = await http.post(
      Uri.parse(updateBookingApi),
      body: {
        "booking_id": bookingId,
        "adults": adultsController.text,
        "children": childrenController.text,
        "infants": infantsController.text,
      },
    );

    final data = jsonDecode(response.body);

    if (data["status"] == "success") {
      Navigator.pop(context, true); // نرجع success للشاشة السابقة
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed: ${data["message"]}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Booking")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: adultsController,
              decoration: const InputDecoration(labelText: "Adults"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: childrenController,
              decoration: const InputDecoration(labelText: "Children"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: infantsController,
              decoration: const InputDecoration(labelText: "Infants"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateBooking,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
