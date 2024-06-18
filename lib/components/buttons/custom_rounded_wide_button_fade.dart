import 'package:flutter/material.dart';

class CustomRoundedWideButtonFade extends StatelessWidget {
  final String text;
  final Color firstColor;
  final Color secondColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool bool_shadow;

  CustomRoundedWideButtonFade({
    required this.text,
    required this.firstColor,
    required this.secondColor,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.bool_shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [firstColor, secondColor],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadows: [
          if (bool_shadow)
          BoxShadow(
            color: Color(0x30000000),
            blurRadius: 4,
            offset: Offset(5, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }
}
