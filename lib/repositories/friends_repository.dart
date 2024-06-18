import 'package:chesstip/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

class FriendsRepository extends ChangeNotifier {
  List<User> _list = [];

  UnmodifiableListView<User> get lista => UnmodifiableListView(_list);

  add(User user){
    // Verificar se usuário ja foi adicionado
    // Verifficar se usuário existe
    _list.add(user);
    notifyListeners();
  }

  remove(User user){
    _list.remove(user);
    notifyListeners();
  }

}