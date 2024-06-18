import 'package:chesstip/screens/loading_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chesstip/models/match.dart';
import '../repositories/match_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/users_repository.dart';
import "dart:math";
import '../screens/match_screen.dart';

const List<Widget> timers = <Widget>[
  Text('5 min'),
  Text('10 min'),
  Text('15 min')
];

const List<Widget> money = <Widget>[
  Text('5 R\$'),
  Text('10 R\$'),
  Text('15 R\$')
];

const double_money = <double>[
  5.00,
  10.00,
  15.00,
];

class PlayComponent extends StatefulWidget {
  const PlayComponent({Key? key}) : super(key: key);

  @override
  State<PlayComponent> createState() => _PlayComponentState();
}

class _PlayComponentState extends State<PlayComponent> {
  final List<bool> _selectedTime = <bool>[true, false, false];
  final List<bool> _selectedMoney = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffF7FFF8),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.24),
                  spreadRadius: 5,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF7FFF8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Encontrar partida',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontFamily: 'Gothic A1',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              "Tempo",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            ),
                          ),
                          ToggleButtons(
                            direction: Axis.horizontal,
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < _selectedTime.length; i++) {
                                  _selectedTime[i] = i == index;
                                }
                              });
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: const Color(0xff20661F),
                            selectedColor: Colors.black,
                            fillColor: const Color(0xff7BE079),
                            color: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 80.0,
                            ),
                            isSelected: _selectedTime,
                            children: timers,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Valor",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                            ),
                          ),
                          ToggleButtons(
                            direction: Axis.horizontal,
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0;
                                    i < _selectedMoney.length;
                                    i++) {
                                  _selectedMoney[i] = i == index;
                                }
                              });
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: const Color(0xff20661F),
                            selectedColor: Colors.black,
                            fillColor: const Color(0xff7BE079),
                            color: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 80.0,
                            ),
                            isSelected: _selectedMoney,
                            children: money,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xff69CE45),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {

                    final value = double_money[_selectedMoney.indexOf(true)];

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingMatchScreen(value),
                      ),
                          (route) => false, // RoutePredicate to always return false, which stops removing routes immediately
                    );

                  },
                  child: const Text(
                    "Jogar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
