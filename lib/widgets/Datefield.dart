import 'package:flutter/material.dart';
class RoundedDateField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final VoidCallback onTap;

  RoundedDateField({
    required this.labelText,
    required this.icon,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );

    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
        prefixIcon: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.purple,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        enabledBorder: customBorder,
        focusedBorder: customBorder,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      style: TextStyle(fontSize: 12),
    );
  }
}
