// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';
import '../Home/home.dart';
import '../Login/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, size.height * 0.2),
          child: Column(
            children: <Widget>[
              Row(children: [
                imageWidget('assets/images/tudLogo.png'),
                const SizedBox(
                  width: 30,
                ),
                imageWidget('assets/images/stadtSportLogo.png'),
              ]),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Anmeldung',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  textWidget(_name, Icons.person, 'Benutzername', false),
                  const SizedBox(
                    height: 20,
                  ),
                  textWidget(
                      _email, Icons.email_outlined, 'E-Mail Adresse', false),
                  const SizedBox(
                    height: 20,
                  ),
                  textWidget(
                      _password, Icons.lock_outline_sharp, 'Passwort', true),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      shadowColor: secondaryColor,
                      elevation: 20,
                      color: primaryColor,
                      child: GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email.text, password: _password.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }).onError((error, stackTrace) {
                            print("Error ${(error.toString())}");
                          });
                        },
                        child: const Center(
                          child: Text(
                            'Anmeldung',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account?",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          ' Anmelden',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                            color: secondaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
