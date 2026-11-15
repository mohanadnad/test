import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.onLongPress,
  });
  final void Function()? onPressed;
  final String buttonText;
  final Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onLongPress: onLongPress,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      color:
          Theme.of(context).buttonTheme.colorScheme?.primary ??
          Theme.of(context).primaryColor,
      elevation: 10,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          shadows: [
            Shadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
