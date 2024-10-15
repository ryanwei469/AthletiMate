import 'package:flutter/material.dart';

class CustomDateFormField extends StatelessWidget {
  const CustomDateFormField({
    super.key, 
    required this.hintText,
    required this.min,
    required this.max,
    required this.controller,
  });

  final String hintText;
  final int min;
  final int max;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          final intValue = int.tryParse(value);
          if (intValue == null) {
            return 'Please enter a valid number';
          }
          if (intValue < min || intValue > max) {
            return 'Enter a number between $min and $max';
          }
          return null;
        },
      ),
    );
  }
}
