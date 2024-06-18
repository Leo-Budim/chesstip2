import 'package:flutter/material.dart';

class BackgroundFadeMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.20, -0.98),
          end: Alignment(-3, 2),
          colors: [Color(0xFF495C4B), Color(0xFF010B02)],
        ),
      ),
    );
  }
}