import 'dart:ffi';
import 'package:chesstip/screens/loading_match_screen.dart';
import 'package:chesstip/screens/match_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../database/db_firestore.dart';
import '../../repositories/match_repository.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/users_repository.dart';
import '../../screens/home.dart';
import 'package:chesstip/models/match.dart';

class WinLooseAlertDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WinLooseAlertDialogState();
}

class WinLooseAlertDialogState extends State<WinLooseAlertDialog>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final matches = Provider.of<MatchRepository>(context);
    final current_match = matches.list.last;
    // final db = DBFirestore.get();

    bool isVictory = Random().nextBool();

    if (isVictory && current_match.status == MatchStatusEnum.onGoing) {
      current_match.winnerId = UserRepository().user.id;
      UserRepository().match_rasult_update_user_info(current_match.value);
    } else if (!isVictory && current_match.status == MatchStatusEnum.onGoing) {
      current_match.winnerId = current_match.blackPlayer.id;
      UserRepository().match_rasult_update_user_info(-current_match.value);
    }

    // DBFirestore.send_match_result(current_match);
    // DBFirestore.update_user_balance(UserRepository().user.balance);
    current_match.status = MatchStatusEnum.finished;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: 300,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isVictory
                      ? Column(
                          children: [
                            Text(
                              "Vitória",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              "+ R\$${current_match.value.toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              "Derrota",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              "- R\$${current_match.value.toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        child: const Text("Sair"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: const Text("Jogar novamente"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            elevation: 0,
                            side: const BorderSide(
                              color: Colors.black54,
                            )),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoadingMatchScreen(current_match.value),
                            ),
                            (route) =>
                                false, // RoutePredicate to always return false, which stops removing routes immediately
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
