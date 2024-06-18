import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/placeholders/avatar_placeholder.dart';
import '../components/play_match.dart';
import '../models/match.dart';
import '../repositories/match_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/users_repository.dart';
import 'match_screen.dart';

class LoadingMatchScreen extends StatefulWidget {
  final double value;

  const LoadingMatchScreen(this.value, {Key? key}) : super(key: key);

  @override
  State<LoadingMatchScreen> createState() => _LoadingMatchScreenState();
}

class _LoadingMatchScreenState extends State<LoadingMatchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      final matches = Provider.of<MatchRepository>(context, listen: false);

      matches.add(
          Match(
            whitePlayer: UserRepository().user,
            blackPlayer: UsersRepository().list[Random().nextInt(UsersRepository().list.length)],
            value: widget.value,
            status: MatchStatusEnum.onGoing,
          )
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MatchScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chess-bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarPlaceholder(width: 150, height: 150),
                  Text(
                    'VS',
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
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffF0EFEB),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 8,
                          blurRadius: 3,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "gifs/loading.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

