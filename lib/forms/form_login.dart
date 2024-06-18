import 'package:flutter/material.dart';
import '../components/buttons/custom_rounded_wide_button_fade.dart';
import '../database/db_firestore.dart';
import '../repositories/user_repository.dart';
import '../screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth.dart';
import 'package:email_validator/email_validator.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String labelTitle = "Login";

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController companyKey = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? error_message = '';
  bool is_login = true;

  Future<void> sign_in_with_email_and_password() async {
    try {
      await Auth().signInWitchEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // DBFirestore.load_user_from_id();

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      error_message = e.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error_message!),
          duration: const Duration(seconds: 2), // SnackBar display duration
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
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
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
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
                          return null;
                        },
                        controller: password,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          hintText: 'Senha',
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
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedWideButtonFade(
                  text: 'Entrar',
                  firstColor: const Color(0xFF8ED782),
                  secondColor: const Color(0xFF598D50),
                  width: 328,
                  height: 47,
                  bool_shadow: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sign_in_with_email_and_password();
                    }
                    ;
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
    );
  }
}
