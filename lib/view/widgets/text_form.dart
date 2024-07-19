
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
    required this.keyboardType,
  });

  final String hintText;
  final Widget icon;
  final bool obscureText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 60, 
        child: TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon,
            labelText: hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Gruppo-Regular",
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
