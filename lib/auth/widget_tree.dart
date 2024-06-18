import 'package:chesstip/database/db_firestore.dart';

import '../auth/auth.dart';
import 'package:chesstip/screens/home.dart';
import 'package:chesstip/forms/form_login.dart';
import 'package:chesstip/forms/form_signup.dart';
import 'package:chesstip/screens/login_signup_screen.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Home();
    //   StreamBuilder(
    //     stream: Auth().authStateChanges,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Home();
    //       } else {
    //         return SignupLoginScreen();
    //       }
    //     },
    //   );
  }
}
