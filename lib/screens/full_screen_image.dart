import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl});
  final String imageUrl;
  static const pageRoute = '/full_screen_image';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 4,
              child: Image.network(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
