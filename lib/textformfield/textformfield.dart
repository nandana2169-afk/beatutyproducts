import 'package:beautyproducts/Colors/colors.dart';
import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  final String? Function(String?)? validator;
  const Customtextformfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.validator,

    final dynamic fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}

class Withouticon extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  // final IconData icon;
  final String? Function(String?)? validator;
  const Withouticon({
    super.key,
    required this.hintText,
    required this.controller,
    final dynamic fillColor,
    // required this.icon,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
        filled: true,
        fillColor: Appcolor.textcolor,
        // prefixIcon: Icon(icon),
      ),
    );
  }
}

class Withoutvalidate extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool filled;
  final Color fillColor;
  final Function(String)? onChanged;   // 👈 ADD THIS

  const Withoutvalidate({
    super.key,
    required this.hintText,
    required this.icon,
    required this.filled,
    required this.fillColor,
    this.onChanged,   // 👈 ADD THIS
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,   // 👈 CONNECT HERE
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        filled: filled,
        fillColor: fillColor,
        border: OutlineInputBorder(),
      ),
    );
  }
}
