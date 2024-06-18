import 'package:chesstip/database/db_firestore.dart';
import 'package:chesstip/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import '../components/buttons/custom_rounded_wide_button_fade.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:chesstip/database/db_firestore.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  String labelTitle = "Cadastro";

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? error_message = '';
  bool is_login = true;

  Future<void> create_user_with_email_and_password(String username) async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      DBFirestore.create_new_user(username);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      error_message = e.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error_message!),
          duration: Duration(seconds: 2), // SnackBar display duration
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    labelTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nome de usuário",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return 'Campo vazio';
                            return null;
                          },
                          controller: username,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'usuário123',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'Campo vazio';
                            else if (!EmailValidator.validate(value))
                              return 'Email errado';
                            return null;
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'seuemail@example.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Senha",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return 'Campo vazio';
                            if (value!.length < 6)
                              return 'Senha precisa de mais de 6 digitos';
                            return null;
                          },
                          controller: password,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: '123456',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomRoundedWideButtonFade(
                    text: 'Cadastrar',
                    firstColor: const Color(0xFF8ED782),
                    secondColor: const Color(0xFF598D50),
                    width: 328,
                    height: 47,
                    bool_shadow: true,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        create_user_with_email_and_password(username.text);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
