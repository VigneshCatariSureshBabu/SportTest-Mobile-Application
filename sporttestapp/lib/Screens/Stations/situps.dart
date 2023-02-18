import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class SitUps extends StatefulWidget {
  const SitUps({Key? key}) : super(key: key);

  @override
  State<SitUps> createState() => _SitUpsState();
}

class _SitUpsState extends State<SitUps> {
  /*StationDetails45 staion04 = new StationDetails45(0);*/
  final db = FirebaseFirestore.instance;

  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _anzahl = TextEditingController();
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
                            'Sit-ups',
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
                      "• 2 Probeversuch",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    const Text(
                      "• 1 Durchgang a 40 sek",
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
                    textWidgetForInteger(_anzahl, 'Anzahl'),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            await db
                                .collection('stationreport')
                                .doc(_studentId.text)
                                .update({'situps': int.parse(_anzahl.text)});
                            /*.set(staion04.toJson());*/
                            // ignore: use_build_context_synchronously
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
