import 'package:flutter/material.dart';
import 'package:chesstip/components/placeholders/avatar_placeholder.dart';
import 'package:chesstip/components/visuals/background_fade_match.dart';
import 'package:chesstip/components/alert_dialogs/win_loose_alert_dialog.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  void initState() {
    // After 5 seconds, navigate to the next page
    Future.delayed(const Duration(seconds: 5), () {
      showDialog(
        context: context,
        builder: (_) => WinLooseAlertDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundFadeMatch(),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 190,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AvatarPlaceholder(width: 80, height: 80),
                          Text(
                            "Player 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/images/chess_board.png'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 190,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Player 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          AvatarPlaceholder(width: 80, height: 80)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
