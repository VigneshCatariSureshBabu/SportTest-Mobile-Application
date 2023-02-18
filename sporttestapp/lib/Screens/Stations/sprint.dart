// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class Sprint extends StatefulWidget {
  const Sprint({Key? key}) : super(key: key);

  @override
  State<Sprint> createState() => _SprintState();
}

class _SprintState extends State<Sprint> {
  /*StationDetails staion02 = new StationDetails(0, 0, 0);*/
  double result = 0.0;
  final db = FirebaseFirestore.instance;

  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _durchgana01 = TextEditingController();
  final TextEditingController _durchgana02 = TextEditingController();
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
                            '20m-Sprint',
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
                      "• 2 Durchgänge",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Externer Starter",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• Zeitnahme auf Höhe der Ziellinie",
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
                    textWidgetForInteger(_durchgana01, 'Durchgang 01 (sek)'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_durchgana02, 'Durchgang 02 (sek)'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            /*staion02.durchgang01 =
                                  double.parse(_durchgana01.text);
                              staion02.durchgang02 =
                                  double.parse(_durchgana02.text);*/
                            if (double.parse(_durchgana01.text) <
                                double.parse(_durchgana02.text)) {
                              result = double.parse(_durchgana01.text);
                            } else {
                              result = double.parse(_durchgana02.text);
                            }

                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .update({'sprint': result});
                            /*.set(staion02.toJson());*/
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
