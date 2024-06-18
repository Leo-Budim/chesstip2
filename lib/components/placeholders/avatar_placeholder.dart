import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  final double width;
  final double height;

  const AvatarPlaceholder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 4,
            blurRadius: 3,
            offset: const Offset(
              2, 2,
            ), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/avatar_placeholder.jpg',
          fit: BoxFit.cover, // ajuste da imagem dentro do contêiner
        ),
      ),
    );
  }
}
