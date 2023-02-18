// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _email = TextEditingController();

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
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Passwort',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'zurücksetzen',
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
                  textWidget(
                      _email, Icons.email_outlined, 'E-Mail Adresse', false),
                  const SizedBox(
                    height: 20,
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
                              .sendPasswordResetEmail(email: _email.text)
                              .then((value) => Navigator.of(context).pop());
                        },
                        child: const Center(
                          child: Text(
                            'Rücksetzen',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
