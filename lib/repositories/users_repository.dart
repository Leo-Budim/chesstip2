import 'package:chesstip/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class UsersRepository extends ChangeNotifier {

  static final List<User> _list = [
    User(
        id: "1",
        name: "Leonardo",
        balance: 100.00,
        victories: 1,
        matches: 2,
        defeats: 1,
        rating: 1100,
        email: "test@test.com",
        senha: "1234"),
    User(
        id: "2",
        name: "Luis",
        balance: 100.00,
        victories: 1,
        matches: 2,
        defeats: 1,
        rating: 1100,
        email: "test@test.com",
        senha: "1234"),
    User(
        id: "3",
        name: "Mauro",
        balance: 100.00,
        victories: 1,
        matches: 2,
        defeats: 1,
        rating: 1100,
        email: "test@test.com",
        senha: "1234"),
  ];

  UnmodifiableListView<User> get list => UnmodifiableListView(_list);

  add(User user){
    if(!_list.contains(user)) _list.add(user);
    notifyListeners();
  }

  remove(User user){
    _list.remove(user);
    notifyListeners();
  }


}
