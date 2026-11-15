import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.light
                ? [Colors.lightBlue.shade200, Colors.blue.shade400]
                : [Colors.blueGrey.shade800, Colors.blueGrey.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.white70,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Image.asset(
            'assets/images/inside-icon.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
