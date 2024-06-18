import 'package:chesstip/components/custom_app_bar.dart';
import 'package:chesstip/components/history_components/list_history_component.dart';
import 'package:chesstip/components/history_components/win_history_component.dart';
import 'package:chesstip/models/user.dart';
import 'package:chesstip/repositories/match_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/history_components/defeat_history_component.dart';
import '../repositories/user_repository.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final matches = MatchRepository().list;
  late User user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserRepository>(context, listen: false).user;
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListHistoryComponent(
          user: user,
        ));
  }
}
