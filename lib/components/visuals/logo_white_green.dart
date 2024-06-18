import 'package:flutter/material.dart';

class LogoWhiteGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Registro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Gurajada',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Bit',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontFamily: 'Gurajada',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}