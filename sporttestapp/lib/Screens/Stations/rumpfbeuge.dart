// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';
import '../../Models/stationReport.dart';

class Rumpfbeuge extends StatefulWidget {
  const Rumpfbeuge({Key? key}) : super(key: key);

  @override
  State<Rumpfbeuge> createState() => _RumpfbeugeState();
}

class _RumpfbeugeState extends State<Rumpfbeuge> {
  StationReport station = StationReport(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  final db = FirebaseFirestore.instance;
  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _durchgana01 = TextEditingController();
  final TextEditingController _durchgana02 = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
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
                            'Rumpfbeuge',
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
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Kein Probeversuch",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• 2 Durchgänge",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Finger über Fußsohle = Negativer Wert (-);",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "  Finger unter Fußsohle = Positiver Wert",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
                    textWidgetForInteger(_height, 'Körpergröße'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_weight, 'Gewicht'),
                    const SizedBox(
                      height: 40,
                    ),
                    textWidgetForNegativeNumber(_durchgana01, 'Durchgang 01'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForNegativeNumber(_durchgana02, 'Durchgang 02'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            if (double.parse(_durchgana01.text) <
                                double.parse(_durchgana02.text)) {
                              station.rumpfbeuge =
                                  double.parse(_durchgana01.text);
                            } else {
                              station.rumpfbeuge =
                                  double.parse(_durchgana02.text);
                            }
                            station.height = int.parse(_height.text);
                            station.weight = int.parse(_weight.text);
                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .set(station.toJson());
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
