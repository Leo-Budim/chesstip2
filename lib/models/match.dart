import 'package:chesstip/models/user.dart';

enum MatchStatusEnum { onGoing, finished, notStarted }

class Match {
  User whitePlayer;
  User blackPlayer;
  String? winnerId;
  double value;
  MatchStatusEnum status = MatchStatusEnum.notStarted;

  Match({
    this.winnerId,
    required this.whitePlayer,
    required this.blackPlayer,
    required this.value,
    required this.status,
  });
}
