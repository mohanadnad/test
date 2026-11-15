import 'package:flutter/material.dart';

class CustomTxtfield extends StatelessWidget {
  const CustomTxtfield({
    super.key,
    required this.textInField,
    required this.textInlable,
    required this.icons,
    required this.isPassword,
    required this.textInputType,
    required this.textInputAction,
    required this.myController,
    required this.validator,
    this.onTap,
  });
  final String textInField;
  final String textInlable;
  final IconData icons;
  final bool isPassword;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
      textInputAction: textInputAction,
      obscureText: isPassword,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        hintText: textInField,
        hintStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              key: ValueKey(icons),
              icons,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        labelText: textInlable,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        filled: true,
        // ignore: deprecated_member_use
        fillColor: Theme.of(context).cardColor.withOpacity(0.8),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
