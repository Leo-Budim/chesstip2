import 'package:chesstip/components/history_components/list_history_component.dart';
import 'package:chesstip/models/user.dart';
import 'package:chesstip/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UserDetailScreen extends StatefulWidget {
  User user;

  UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: 'R\$');

  camera() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CameraScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: GestureDetector(
              onTap: () => camera(),
              child: Image.asset(widget.user.avatar),
            ),
          ),
          Text(
            "${widget.user.name} (${widget.user.rating.toString()})",
            style: TextStyle(fontSize: 30),
          ),
          Text(real.format(widget.user.balance)),
          Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Partidas"),
                    Text(widget.user.matches.toString())
                  ],
                ),
                Column(
                  children: [
                    Text("Vitórias"),
                    Text(widget.user.victories.toString())
                  ],
                ),
                Column(
                  children: [
                    Text("Derrotas"),
                    Text(widget.user.defeats.toString())
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [Text("Partidas")],
                  ),
                ),
              ),
              ListHistoryComponent(
                user: widget.user,
              )
            ],
          )
        ],
      ),
    ));
  }
}
