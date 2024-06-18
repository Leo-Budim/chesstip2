import 'package:flutter/material.dart';

class CustomRoundedWideButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomRoundedWideButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 47,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFF0F0F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadows: [
          BoxShadow(
            color: color,
            blurRadius: 4,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }
}
