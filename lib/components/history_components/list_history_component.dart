import 'package:chesstip/components/history_components/defeat_history_component.dart';
import 'package:chesstip/components/history_components/win_history_component.dart';
import 'package:chesstip/models/user.dart';
import 'package:chesstip/repositories/match_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHistoryComponent extends StatelessWidget {
  User user;
  ListHistoryComponent({super.key, required this.user});

  winMatch(match) {
    return match.winnerId == user.id;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MatchRepository>(
      builder: (context, matches, child){
        return  matches.list.isEmpty?
        Container(
          child: Center(
              child: Text("Ainda não há partidas jogadas", style: TextStyle(color: Colors.black54),)
          ),
        ):
        ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            if (winMatch(matches.list[index])) {
              return WinHistoryComponent(match: matches.list[index]);
            } else {
              return DefeatHistoryComponent(match: matches.list[index]);
            }
          }),
          itemCount: matches.list.length,
        );
      },
    );
  }
}
