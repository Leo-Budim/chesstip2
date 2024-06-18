import 'package:flutter/material.dart';
import 'package:chesstip/repositories/users_repository.dart';
import 'package:chesstip/models/match.dart';
import 'dart:collection';

class MatchRepository extends ChangeNotifier {
  UnmodifiableListView<Match> get list => UnmodifiableListView(_list);

  static final List<Match> _list = [];

  add(Match match) {
    _list.add(match);
    notifyListeners();
  }

  get_last() {
    return list.last;
  }
}
