// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class SeitlichesHerspringen extends StatefulWidget {
  const SeitlichesHerspringen({Key? key}) : super(key: key);

  @override
  State<SeitlichesHerspringen> createState() => _SeitlichesHerspringenState();
}

class _SeitlichesHerspringenState extends State<SeitlichesHerspringen> {
  /*StationDetails6 staion06 = new StationDetails6(0, 0);*/
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
                            'Seitliches',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Hin- u.',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Herspringen',
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
                      "• 5 Probesprunge",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• 2 Durchgange a 15 seK",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• 1 Minute Pause zwischen Durchgängen",
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
                    textWidgetForInteger(
                        _durchgana01, 'Durchgang 01 (Sprünge)'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(
                        _durchgana02, 'Durchgang 02 (Sprünge)'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            result = (double.parse(_durchgana01.text) +
                                    double.parse(_durchgana02.text)) /
                                2;
                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .update({'springen': result});
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
