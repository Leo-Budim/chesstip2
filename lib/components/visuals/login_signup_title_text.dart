import 'package:flutter/material.dart';

class LoginSignupTitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355,
      child: Text(
        'Domine o tabuleiro e ganhe dinheiro',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: 'GowunDodum',
          fontWeight: FontWeight.w400,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 4), // Define a posição da sombra (horizontal, vertical)
            ),
          ],
        ),
      ),
    );
  }
}
