// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class Lauf extends StatefulWidget {
  const Lauf({Key? key}) : super(key: key);

  @override
  State<Lauf> createState() => _LaufState();
}

class _LaufState extends State<Lauf> {
  /*StationDetails8 staion08 = new StationDetails8(0, 0);*/
  final db = FirebaseFirestore.instance;
  int result = 0;
  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _anzahl = TextEditingController();
  final TextEditingController _rest = TextEditingController();
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
                            '6-minuten-Lauf',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "• Erklärung",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Kein Probeversuch",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Vorher Schnürsenkel kontrollieren!",
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
                    textWidgetForInteger(_anzahl, 'Anzahl der Runden:'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_rest, 'Reststreckke (m):'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            result = ((int.parse(_anzahl.text) * 54) +
                                int.parse(_rest.text));
                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .update({'lauf': result});
                            /*.set(staion08.toJson());*/
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
