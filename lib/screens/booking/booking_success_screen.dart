import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudan_tourist_guide/constant/my_strings.dart';
// import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
import 'package:sudan_tourist_guide/cutsom_tools/custom_button.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/screens/tab_screen.dart';

class BookingSuccessScreen extends StatefulWidget {
  final String userName;
  final String phone;
  final String tripId;
  // final HotelConstructor hotel;
  final int adults;
  final int children;
  final int infants;
  final double totalPrice;
  // final DateTime date;
  final String tripTime;
  // final int days;

  const BookingSuccessScreen({
    super.key,
    required this.userName,
    required this.phone,
    required this.tripId,
    // required this.hotel,
    required this.adults,
    required this.children,
    required this.infants,
    required this.totalPrice,
    // required this.date,
    required this.tripTime,
    // required this.days,
  });

  @override
  State<BookingSuccessScreen> createState() => _BookingSuccessScreenState();
}

class _BookingSuccessScreenState extends State<BookingSuccessScreen> {
  Widget bookingDetails(BuildContext context, String text, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: myFonts,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontFamily: myFonts,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }

  // Widget hotelCard() {
  //   return Container(
  //     padding: const EdgeInsets.all(12),
  //     margin: const EdgeInsets.symmetric(vertical: 10),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).cardColor,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Theme.of(context).shadowColor.withOpacity(0.4),
  //           blurRadius: 12,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(16),
  //           child: Image.network(
  //             widget.hotel.imageUrl,
  //             width: 90,
  //             height: 90,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         SizedBox(width: 12),
  //         Expanded(
  //           child: Text(
  //             widget.hotel.title,
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontFamily: myFonts,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // the function to send the booking to DB
  Future<void> sendBookingToServer(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final respose = await http.post(
      Uri.parse(addBookingApi),
      body: {
        "user_id": user!.uid,
        "email": user.email,
        "user_name": widget.userName,
        "phone": widget.phone,
        "trip_id": widget.tripId,
        // "hotel_id": widget.hotel.id.toString(),
        "adults": widget.adults.toString(),
        "children": widget.children.toString(),
        "infants": widget.infants.toString(),
        "total_price": widget.totalPrice.toString(),
        "trip_time": widget.tripTime,
        // "date": widget.date.toIso8601String(),
        // "days": widget.days.toString(),
      },
    );
    final data = jsonDecode(respose.body);
    if (data['status'] == 'success') {
      AnimatedSnackBar.rectangle(
        duration: Duration(seconds: 4),
        "Success",
        "Booking Confirmed Successfully ",
        type: AnimatedSnackBarType.success,
        brightness: Theme.of(context).brightness,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => TabScreen()),
        (_) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking failed: ${data["message"]}")),
      );
      print(' ${data["message"]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedContainer(
        duration: Duration(microseconds: 400),
        curve: Curves.bounceInOut,

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Icon(Icons.check_circle, color: Colors.green, size: 120),
                  SizedBox(height: 20),

                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: myFonts,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),
                  bookingDetails(
                    context,
                    S.of(context).phoneNumber,
                    widget.phone,
                  ),
                  bookingDetails(
                    context,
                    S.of(context).adults,
                    widget.adults.toString(),
                  ),
                  bookingDetails(
                    context,
                    S.of(context).children,
                    widget.children.toString(),
                  ),
                  bookingDetails(
                    context,
                    S.of(context).infants,
                    widget.infants.toString(),
                  ),
                  // hotelCard(),
                  bookingDetails(
                    context,
                    S.of(context).tripTime,
                    '${widget.tripTime}',
                  ),
                  // bookingDetails(context, 'Date', "${widget.date} "),
                  bookingDetails(
                    context,
                    S.of(context).totalPrice,
                    "${widget.totalPrice} SDG",
                  ),

                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () => Navigator.pop(context),
                        buttonText: S.of(context).Back,
                      ),
                      CustomButton(
                        onPressed: () async {
                          await sendBookingToServer(context);
                        },
                        buttonText: S.of(context).confirm,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
