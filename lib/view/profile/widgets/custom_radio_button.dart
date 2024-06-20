import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final Color activeColor;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor = const Color.fromARGB(255, 243, 131, 33), // Default color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value != groupValue) {
          onChanged?.call(value);
        }
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value == groupValue ? activeColor : Colors.transparent,
          border: Border.all(
            color: activeColor,
            width: 2.0,
          ),
        ),
        child: value == groupValue
            ? Center(
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor, 
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
