import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final _formKey = GlobalKey<FormState>();

  enviar() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Mensagem enviada!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fale conosco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLength: 25,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe um email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    maxLength: 25,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Assunto'),
                        prefixIcon: Icon(Icons.subject_rounded)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Preencha o campo mensagem';
                      }
                    },
                  ),
                  TextFormField(
                    maxLength: 250,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Mensagem'),
                        prefixIcon: Icon(Icons.message)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Preencha o campo mensagem';
                      }
                    },
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff69CE45)),
                          onPressed: () {
                            enviar();
                          },
                          child: const Text(
                            'Enviar',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
