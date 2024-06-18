import 'package:chesstip/repositories/friends_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/buttons/custom_rounded_wide_button_fade.dart';
import '../models/user.dart';
import '../screens/home.dart';

class FormAddFriend {
  static void show(BuildContext context, Function() onSubmit) {
    String labelTitle = "Adicionar amigo";

    TextEditingController username = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Container(
                padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: TextFormField(
                        controller: username,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          hintText: 'usuário123',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Container(
                      width: 110,
                      height: 47,
                      child: Center(
                        child: Text(
                          "Voltar",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: ShapeDecoration(
                          color: Color(0xffe6e6e6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                    ),
                    onTap: () {},
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomRoundedWideButtonFade(
                          text: 'Adicionar',
                          firstColor: const Color(0xFF8ED782),
                          secondColor: const Color(0xFF598D50),
                          width: 150,
                          height: 47,
                          bool_shadow: false,
                          onPressed: () {
                            final friends = Provider.of<FriendsRepository>(
                                context,
                                listen: false);
                            friends.add(User(
                                id: "1",
                                name: username.text,
                                balance: 100,
                                victories: 550,
                                matches: 567,
                                defeats: 10,
                                rating: 2400,
                                email: "test@test.com",
                                senha: "1234"));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}

void logar(String email, String password, context) {}
