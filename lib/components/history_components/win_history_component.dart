import 'package:chesstip/components/history_components/history_component.dart';
import 'package:flutter/material.dart';
import 'package:chesstip/models/match.dart';

class WinHistoryComponent extends StatelessWidget {
  Match match;
  WinHistoryComponent({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return HistoryComponent(
      cardColor: Colors.green,
      matchResult: "Vitória",
      match: match,
      signal: "+",
    );
  }
}
