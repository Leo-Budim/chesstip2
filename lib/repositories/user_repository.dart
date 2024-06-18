import 'package:chesstip/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class UserRepository extends ChangeNotifier {
  static final User _user = User(
      id: "1",
      name: "Leonardo Budim",
      balance: 100,
      victories: 550,
      matches: 567,
      defeats: 10,
      rating: 2400,
      email: "test@test.com",
      senha: "1234");

  User get user => _user;

  match_rasult_update_user_info(value) {
    user.balance = user.balance + value;
    user.matches = user.matches + 1;

    if (value > 0)
      user.victories = user.victories + 1;
    else
      user.defeats = user.defeats + 1;

    notifyListeners();
  }

  update(String username, String? email, String uid, double balance,
      int matches, int victories, int defeats, int rating) {
    user.name = username;
    user.email = email!;
    user.id = uid;
    user.balance = balance.toDouble();
    user.matches = matches;
    user.victories = victories;
    user.defeats = defeats;
    user.rating = rating;

    notifyListeners();
  }

  notify_listener() {
    notifyListeners();
  }
}
