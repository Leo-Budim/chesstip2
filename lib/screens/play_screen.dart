import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';
import '../components/play_match.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          PlayComponent(),
        ],
      ),
    );
  }
}
