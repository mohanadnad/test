// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';
// import 'package:sudan_tourist_guide/providers/language_provider.dart';

class MembersSection extends StatefulWidget {
  const MembersSection({
    super.key,
    required this.place,
    required this.onMembersChanged,
  });
  final dynamic place;

  final void Function(int adults, int children, int infants) onMembersChanged;
  @override
  State<MembersSection> createState() => _MembersSectionState();
}

class _MembersSectionState extends State<MembersSection> {
  int adults = 1;
  int children = 0;
  int infants = 0;
  DateTime date = DateTime.now();
  DateTime firstDate = DateTime.now();
  double totalPrice = 0;
  void claculatePrice() {
    final base = widget.place.budget;
    setState(() {
      totalPrice =
          (adults * base) + (children * base * 0.5) + (infants * base * 0.1);
    });
  }

  Widget buildCounter(
    IconData icon,
    String title,
    int value,
    VoidCallback onAdd,
    VoidCallback onRemove,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.15),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Theme.of(context).primaryColor),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: myFonts,
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: value > 0 ? onRemove : null,
                icon: Icon(Icons.remove_circle_outline, size: 28),
              ),
              Text("$value", style: TextStyle(fontSize: 20)),
              IconButton(
                onPressed: onAdd,
                icon: Icon(Icons.add_circle_outline, size: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final lang = Provider.of<LanguageProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          // Members Box
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCounter(
                    Icons.person,
                    S.of(context).adults,
                    adults,
                    () {
                      setState(() {
                        adults++;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                    () {
                      setState(() {
                        adults--;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                  ),

                  buildCounter(
                    Icons.child_care,
                    S.of(context).children,
                    children,
                    () {
                      setState(() {
                        children++;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                    () {
                      setState(() {
                        children--;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                  ),

                  buildCounter(
                    Icons.baby_changing_station,
                    S.of(context).infants,
                    infants,
                    () {
                      setState(() {
                        infants++;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                    () {
                      setState(() {
                        infants--;
                        widget.onMembersChanged(adults, children, infants);
                      });
                    },
                  ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${S.of(context).totalMembers}: ${adults + children + infants}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: myFonts,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            adults = 1;
                            children = 0;
                            infants = 0;
                            widget.onMembersChanged(adults, children, infants);
                          });
                        },
                        child: Text(S.of(context).clear),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 20),
          //   padding: EdgeInsets.symmetric(vertical: 20),
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: Theme.of(context).brightness == Brightness.light
          //           ? [
          //               Color(0xFFF7DCEB), // soft pink-peach
          //               Color(0xFFFFEFE3), // light peach/cream
          //             ]
          //           : [
          //               Theme.of(context).canvasColor,
          //               Theme.of(context).canvasColor,
          //             ],
          //       begin: Alignment.topLeft,
          //       end: AlignmentGeometry.bottomRight,
          //     ),
          //     borderRadius: BorderRadius.circular(20),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Theme.of(context).shadowColor.withOpacity(0.2),
          //         blurRadius: 12,
          //         offset: Offset(0, 6),
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     children: [
          //       EasyDateTimeLinePicker(
          //         // selectionMode: SelectionMode.autoCenter(),
          //         locale: lang.locale,
          //         firstDate: DateTime(
          //           firstDate.year,
          //           firstDate.month,
          //           firstDate.day,
          //         ),
          //         lastDate: DateTime(2030, 3, 18),
          //         focusedDate: date,
          //         onDateChange: (newDate) {
          //           setState(() {
          //             date = newDate;
          //           });
          //         },
          //       ),
          //       SizedBox(height: 20),
          //       Container(
          //         padding: EdgeInsets.all(16),
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Theme.of(context).shadowColor),

          //           borderRadius: BorderRadius.circular(16),
          //         ),
          //         child: Text(
          //           "Selected Date: ${date.year}/${date.month}/${date.day}",
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontFamily: myFonts,
          //             fontWeight: FontWeight.w600,
          //             color: Theme.of(context).textTheme.bodyLarge!.color,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
