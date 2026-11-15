import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/ai%20agent/api_get_services.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/constructros/hotel_constructor.dart';
import 'package:sudan_tourist_guide/cutsom_tools/custom_button.dart';
import 'package:sudan_tourist_guide/screens/booking/custom_booking_fields.dart';
import 'package:sudan_tourist_guide/screens/booking/members_section.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';
import 'package:sudan_tourist_guide/screens/booking/booking_success_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, this.place});
  static const pageRoute = '/booking_screen';
  final dynamic place;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final userDetails = FirebaseAuth.instance.currentUser!.displayName;
  TextEditingController get uername => TextEditingController(text: userDetails);
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  EasyDatePickerController dateTime = EasyDatePickerController();
  DateTime date = DateTime.now();

  DateTime firstDate = DateTime.now();

  Widget headLine(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: myFonts,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  HotelConstructor? selectedHotel;
  List<HotelConstructor> hotelsInSameCity = [];
  @override
  void initState() {
    loadHotels();
    super.initState();
  }

  Future<void> loadHotels() async {
    final lang = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).locale.languageCode;

    final allHotels = await ApiGetServices().getHotels(lang);

    setState(() {
      hotelsInSameCity = allHotels.where((hotel) {
        return hotel.cityName.trim().toLowerCase() ==
            widget.place.cityName.trim().toLowerCase();
      }).toList();
    });
  }

  int adults = 1;
  bool isNightTrip = false;
  int children = 0;
  int infants = 0;
  // int hotelPrice = 0;
  double totalPrice = 0;
  void calculateTotalPrice() {
    final int base = widget.place.budget;
    final double tripPricePerDay =
        (adults * base) + (children * base * 0.5) + (infants * base * 0.1);
    final double tripPrice = tripPricePerDay;
    // final double finalTotal = tripPrice;
    setState(() {
      totalPrice = tripPrice;
    });
  }

  void _confirmBooking() {
    final bookingData = {
      "user_name": uername.text,
      "phone": phoneNumber.text,
      "trip_id": widget.place.id.toString(),
      // "hotel_id": selectedHotel,
      "adults": adults.toString(),
      "children": children.toString(),
      "infants": infants.toString(),
      "total_price": totalPrice.toString(),
      // "date": date.toIso8601String(),
      "trip_time": isNightTrip ? 'Evening Trip' : 'Morning Trip',
      // "days": selectedDays.toString(),
    };
    print("Booking Confirmed:");
    print(bookingData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingSuccessScreen(
          // days: selectedDays,
          tripTime: isNightTrip ? "Evening Trip" : "Morning Trip",

          userName: uername.text,
          phone: phoneNumber.text,
          tripId: widget.place.id.toString(),

          // hotel: selectedHotel!,
          adults: adults,
          children: children,
          infants: infants,
          totalPrice: totalPrice,
          // date: date,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.place.title,
          style: TextStyle(
            fontFamily: myFonts,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: widget.place.id,
                        child: Image.network(
                          widget.place.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              headLine(S.of(context).name),
              CustomBookingFields(
                textInField: S.of(context).userNameField,

                isPassword: false,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.go,
                myController: uername,
                validator: (val) {
                  if (val == '' || val!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              headLine(S.of(context).phoneNumber),
              CustomBookingFields(
                textInField: S.of(context).phoneNumber,
                isPassword: false,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.go,
                myController: phoneNumber,
                validator: (val) {
                  if (val == '') {
                    return 'Enter you phone number';
                  }
                  if (val!.length < 5) {
                    return 'Phone number must be greter than 9';
                  }
                  if (val.length > 10) {
                    return 'Phone number must be less than 11';
                  }
                  return null;
                },
              ),
              headLine(S.of(context).members),
              // member section screen
              MembersSection(
                place: widget.place,
                onMembersChanged: (a, c, i) {
                  adults = a;
                  children = c;
                  infants = i;

                  calculateTotalPrice();
                },
              ),
              SizedBox(height: 20),

              //    if (hotelsInSameCity.isNotEmpty) ...[
              //   Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 10,
              //     ),
              //     child: Container(
              //       // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         color: Theme.of(context).cardColor,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Theme.of(context).shadowColor.withOpacity(0.2),
              //             blurRadius: 12,
              //             offset: Offset(0, 12),
              //           ),
              //         ],
              //       ),
              //       child: DropdownButtonFormField(
              //         decoration: InputDecoration(
              //           labelText: 'Select Hotel',
              //           labelStyle: TextStyle(
              //             fontFamily: myFonts,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Theme.of(context).textTheme.bodyLarge!.color,
              //           ),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         initialValue: selectedHotel,

              //         items: hotelsInSameCity.map((hotle) {
              //           return DropdownMenuItem(
              //             value: hotle,
              //             child: Row(
              //               children: [
              //                 CircleAvatar(
              //                   backgroundImage: NetworkImage(hotle.imageUrl),
              //                 ),
              //                 SizedBox(width: 12),
              //                 Column(
              //                   children: [
              //                     Text(
              //                       hotle.title,
              //                       style: TextStyle(
              //                         fontFamily: myFonts,
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                       // overflow: TextOverflow.ellipsis,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(width: 5),
              //                 Text(
              //                   '${hotle.budget} SDG',
              //                   style: TextStyle(
              //                     fontFamily: myFonts,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         }).toList(),
              //         onChanged: (value) {
              //           setState(() {
              //             selectedHotel = hotelsInSameCity.firstWhere(
              //               (hotel) => hotel.id.toString() == value?.id,
              //             );
              //             hotelPrice = selectedHotel!.budget;
              //             calculateTotalPrice();
              //           });
              //         },
              //       ),
              //     ),
              //   ),
              // ] else ...[
              //   Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: Text(
              //       "No hotels available in ${widget.place.cityName}",
              //       style: TextStyle(fontSize: 18, fontFamily: myFonts),
              //     ),
              //   ),
              // ],
              // SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 40,
              //     vertical: 10,
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         'Select Trip Days',
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontFamily: myFonts,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).textTheme.bodyLarge!.color,
              //         ),
              //       ),
              //       SizedBox(height: 10),
              //       Container(
              //         padding: EdgeInsets.symmetric(horizontal: 15),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12),
              //           color: Theme.of(context).cardColor,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Theme.of(context).shadowColor,
              //               blurRadius: 12,
              //               offset: Offset(0, 12),
              //             ),
              //           ],
              //         ),
              //         child: DropdownButtonFormField<int>(
              //           initialValue: selectedDays,
              //           decoration: InputDecoration(border: InputBorder.none),
              //           items: List.generate(15, (index) => index + 1).map((
              //             day,
              //           ) {
              //             return DropdownMenuItem(
              //               value: day,
              //               child: Text(
              //                 '$day Days',
              //                 style: TextStyle(
              //                   fontFamily: myFonts,
              //                   fontSize: 18,
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //           onChanged: (value) {
              //             setState(() {
              //               selectedDays = value!;
              //               calculateTotalPrice();
              //             });
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              headLine('Trip Type'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            isNightTrip ? Icons.nights_stay : Icons.wb_sunny,
                            color: isNightTrip ? Colors.blue : Colors.orange,
                          ),
                          SizedBox(width: 12),
                          Text(
                            isNightTrip ? 'Evening Trip' : 'Morning Trip',
                            style: TextStyle(
                              fontFamily: myFonts,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isNightTrip,
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            isNightTrip = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Total Price $totalPrice SDG',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: myFonts,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Center(
                  child: CustomButton(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        _confirmBooking();
                      }
                    },
                    buttonText: 'Confirm Booking',
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
