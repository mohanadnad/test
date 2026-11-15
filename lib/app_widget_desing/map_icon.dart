// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({
    super.key,
    required this.iconData,
    required this.color,
    required this.onPressed,
  });
  final IconData iconData;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.2,
                  ),
                ),
                child: Icon(iconData, size: 20, color: color),
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
