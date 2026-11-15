// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';
import 'package:sudan_tourist_guide/generated/l10n.dart';

class TabDesing extends StatelessWidget {
  const TabDesing({super.key, required this.currentIndex, required this.index});
  final void Function(int) currentIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            // height: 55,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.35),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.25),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: NavigationBar(
              // maintainBottomViewPadding: true,
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              height: 55,
              selectedIndex: index,
              onDestinationSelected: currentIndex,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              backgroundColor: Colors.transparent,
              indicatorColor: Theme.of(context).primaryColor.withOpacity(0.85),

              labelTextStyle: WidgetStateProperty.all(
                TextStyle(
                  fontFamily: myFonts,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              destinations: [
                NavigationDestination(
                  icon: AnimatedScale(
                    scale: 1.4,
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      Icons.home_outlined,
                      color: Theme.of(context).iconTheme.color,
                      size: 22,
                    ),
                  ),
                  label: S.of(context).iconLabel1,
                  selectedIcon: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryIconTheme.color,
                    size: 24,
                  ),
                ),
                NavigationDestination(
                  icon: AnimatedScale(
                    scale: 1.5,
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      Icons.map_outlined,
                      color: Theme.of(context).iconTheme.color,
                      size: 22,
                    ),
                  ),
                  label: S.of(context).map,
                  selectedIcon: Icon(
                    Icons.map,
                    color: Theme.of(context).primaryIconTheme.color,
                    size: 24,
                  ),
                ),

                NavigationDestination(
                  icon: Icon(
                    Icons.card_travel_outlined,
                    color: Theme.of(context).iconTheme.color,
                    size: 22,
                  ),
                  label: S.of(context).travels,
                  selectedIcon: Icon(
                    Icons.card_travel_rounded,
                    color: Theme.of(context).primaryIconTheme.color,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
