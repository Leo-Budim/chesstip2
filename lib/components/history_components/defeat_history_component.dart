import 'package:chesstip/components/history_components/history_component.dart';
import 'package:flutter/material.dart';
import 'package:chesstip/models/match.dart';

class DefeatHistoryComponent extends StatelessWidget {
  Match match;
  DefeatHistoryComponent({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HistoryComponent(
      cardColor: Colors.red,
      matchResult: "Derrota",
      match: match,
      signal: "-",
    );
  }
}
