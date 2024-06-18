import 'package:chesstip/auth/widget_tree.dart';
import 'package:chesstip/components/custom_app_bar.dart';
import 'package:chesstip/models/user.dart';
import 'package:chesstip/repositories/user_repository.dart';
import 'package:chesstip/screens/about_us.dart';
import 'package:chesstip/screens/profile_screen.dart';
import 'package:chesstip/screens/question_answer.dart';
import 'package:chesstip/screens/send_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late User user;
  List screens = ['Perfil', 'Fale Conosco'];

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserRepository>(context, listen: false).user;

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(children: [
        ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.person),
          ),
          title: const Text(
            'Perfil',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text('Alterar nome, senha...'),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()))
          },
        ),
        ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.message_rounded),
          ),
          title: const Text(
            'Fale Conosco',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text('Sugestões, reclamações...'),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SendMessage()))
          },
        ),
        ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.help),
          ),
          title: const Text(
            'Perguntas Frequentes',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text('Como depositar dinheiro? Como...'),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const QAs()))
          },
        ),
        ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.info),
          ),
          title: const Text(
            'Sobre nós',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUs()))
          },
        ),
        ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.logout),
          ),
          title: const Text(
            'Sair',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          onTap: () => {

            Auth().signOut(),
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WidgetTree()))
          },
        )

      ]),
    );
  }
}
