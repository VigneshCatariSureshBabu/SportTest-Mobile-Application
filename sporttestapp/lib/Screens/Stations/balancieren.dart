// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class Balancieren extends StatefulWidget {
  const Balancieren({Key? key}) : super(key: key);

  @override
  State<Balancieren> createState() => _BalancierenState();
}

class _BalancierenState extends State<Balancieren> {
  /*StationDetails7 staion07 = new StationDetails7(0, 0, 0, 0, 0, 0);*/
  late int result1, result2, result3;
  final db = FirebaseFirestore.instance;
  double slideValue = 0.0;
  double _schritte6CM01 = 0.0;
  double _schritte6CM02 = 0.0;
  double _schritte45CM01 = 0.0;
  double _schritte45CM02 = 0.0;
  double _schritte3CM01 = 0.0;
  double _schritte3CM02 = 0.0;
  final TextEditingController _studentId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sportmotorische Testung"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.home),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, size.height * 0.2),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            'Balancieren',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rückwärts',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "• Erklärung und Demonstration",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Pro Balken: 1x vor- und 1x rückwärts zur Probe, dann 2 Durchgange",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Der 1. Schritt zählt nicht",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Max. 8 Punkte pro Durchgang",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_studentId, 'ID'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "6cm-Balken",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte6CM01,
                      max: 8,
                      divisions: 8,
                      label: _schritte6CM01.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte6CM01 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte6CM02,
                      max: 8,
                      divisions: 8,
                      label: _schritte6CM02.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte6CM02 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const Text(
                      "4,5cm-Balken",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte45CM01,
                      max: 8,
                      divisions: 8,
                      label: _schritte45CM01.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte45CM01 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte45CM02,
                      max: 8,
                      divisions: 8,
                      label: _schritte45CM02.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte45CM02 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const Text(
                      "3cm-Balken",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte3CM01,
                      max: 8,
                      divisions: 8,
                      label: _schritte3CM01.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte3CM01 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const Text(
                      "Schritte",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      value: _schritte3CM02,
                      max: 8,
                      divisions: 8,
                      label: _schritte3CM02.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _schritte3CM02 = value;
                        });
                      },
                      activeColor: primaryColor,
                      inactiveColor: secondaryColor,
                      thumbColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            if (_schritte6CM01 > _schritte6CM02) {
                              result1 = _schritte6CM01.round();
                            } else {
                              result1 = _schritte6CM02.round();
                            }
                            if (_schritte45CM01 > _schritte45CM02) {
                              result2 = _schritte45CM01.round();
                            } else {
                              result2 = _schritte45CM02.round();
                            }
                            if (_schritte3CM01 > _schritte3CM02) {
                              result3 = _schritte3CM01.round();
                            } else {
                              result3 = _schritte3CM02.round();
                            }
                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .update({
                              'balancierenRueckwaerts6CM': result1,
                              'balancierenRueckwaerts45CM': result2,
                              'balancierenRueckwaerts3CM': result3,
                              'balancierenRueckwaerts':
                                  result1 + result2 + result3
                            });
                            /*.set(staion07.toJson());*/
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text(
                            'Weiter',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
