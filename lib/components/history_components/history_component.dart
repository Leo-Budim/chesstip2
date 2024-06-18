import 'package:flutter/material.dart';
import 'package:chesstip/models/match.dart';
import 'package:intl/intl.dart';

class HistoryComponent extends StatelessWidget {
  Color cardColor;
  String matchResult;
  Match match;
  String signal;
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: 'R\$');
  HistoryComponent({
    super.key,
    required this.cardColor,
    required this.matchResult,
    required this.match,
    required this.signal,
  });

  getWinnerName(Match match) {
    return match.blackPlayer.name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.20),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            matchResult,
                            style: TextStyle(fontSize: 20, color: cardColor),
                          ),
                          Text(
                            "vs: ${getWinnerName(match)}",
                            style: const TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("$signal ${real.format(match.value)}"),
                    const Text("16:19")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
