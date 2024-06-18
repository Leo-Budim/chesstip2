import 'package:flutter/material.dart';
import '../components/buttons/custom_rounded_wide_button_fade.dart';
import '../components/buttons/custom_rounded_wide_button.dart';
import '../components/visuals/logo_white_green.dart';
import '../components/visuals/background_fade_login.dart';
import '../components/visuals/login_signup_title_text.dart';
import '../forms/form_login.dart';
import '../forms/form_signup.dart';

class SignupLoginScreen extends StatelessWidget {
  const SignupLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.90,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit
                      .cover, // Ajusta a imagem para preencher o container
                ),
              ),
            ),
          ),
          BackgroundFadeLogin(),
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoginSignupTitleText(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomRoundedWideButtonFade(
                            text: 'Entrar',
                            firstColor: const Color(0xFF8ED782),
                            secondColor: const Color(0xFF598D50),
                            width: 328,
                            height: 47,
                            bool_shadow: true,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => FormLogin()),
                              // );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: CustomRoundedWideButton(
                              text: 'Cadastrar',
                              color: const Color(0x3F000000),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => FormSignup()),
                                // );
                              },
                            ),
                          ),
                          LogoWhiteGreen(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
