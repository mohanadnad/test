import 'package:flutter/material.dart';

class CustomBookingFields extends StatelessWidget {
  const CustomBookingFields({
    super.key,
    required this.textInField,

    required this.isPassword,
    required this.textInputType,
    required this.textInputAction,
    required this.myController,
    required this.validator,
  });
  final String textInField;

  final bool isPassword;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor.withOpacity(0.35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.4),
          ),
        ),

        child: TextFormField(
          controller: myController,
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
          textInputAction: textInputAction,
          obscureText: isPassword,
          keyboardType: textInputType,
          validator: validator,
          decoration: InputDecoration(
            hintText: textInField,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),

            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            filled: true,
            // ignore: deprecated_member_use
            fillColor: Theme.of(context).cardColor.withOpacity(0.8),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
