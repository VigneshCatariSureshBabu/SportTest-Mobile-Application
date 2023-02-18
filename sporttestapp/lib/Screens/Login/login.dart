import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import 'package:sporttestapp/Screens/ResetPassword/resetPassword.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';
import '../Signup/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
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
              SingleChildScrollView(
                child: Row(children: [
                  imageWidget('assets/images/tudLogo.png'),
                  const SizedBox(
                    width: 30,
                  ),
                  imageWidget('assets/images/stadtSportLogo.png'),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Sportmotorische',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Testung',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  textWidget(_email, Icons.person_add_alt_outlined,
                      'E-Mail Adresse', false),
                  const SizedBox(
                    height: 20,
                  ),
                  textWidget(
                      _password, Icons.lock_outline_sharp, 'Passwort', true),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: <Widget>[
                      InkResponse(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPassword()));
                          },
                          child: const Text(
                            'Passwort vergessen?',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 10.0,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          )),
                    ],
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
                              .signInWithEmailAndPassword(
                                  email: _email.text, password: _password.text)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          }).onError((error, stackTrace) {});
                        },
                        child: const Center(
                          child: Text(
                            'Anmelden',
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
                        "Noch nicht registriert?",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                        child: const Text(
                          ' Anmeldung',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
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
