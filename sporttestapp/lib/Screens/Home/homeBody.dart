// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sporttestapp/Constants/constant.dart';
import 'package:sporttestapp/Screens/Results/search.dart';
import 'package:sporttestapp/Screens/Stations/balancieren.dart';
import 'package:sporttestapp/Screens/Stations/lauf.dart';
import 'package:sporttestapp/Screens/Stations/liegestuetz.dart';
import 'package:sporttestapp/Screens/Stations/herspringen.dart';
import 'package:sporttestapp/Screens/Stations/situps.dart';
import 'package:sporttestapp/Screens/Stations/sprint.dart';
import 'package:sporttestapp/Screens/Stations/standweitsprung.dart';
import 'package:sporttestapp/Screens/registrationDetails/studentRegistration.dart';
import '../Stations/rumpfbeuge.dart';
import '../../Components/usefulCustomWidgets.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sind Sie sicher?'),
            content: const Text('Möchten Sie eine App beenden?'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('Nein'),
              ),
              TextButton(
                onPressed: () => Navigator.popUntil(
                    context, (route) => route.isFirst), // <-- SEE HERE
                child: const Text('Ja'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sportmotorische Testung"),
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultSearch()));
              },
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentRegistration()));
              },
              icon: const Icon(Icons.add_box_rounded),
            ),
            IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));*/
              },
              icon: const Icon(Icons.logout_sharp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, size.height * 0.2),
            child: Center(
              child: Column(
                children: [
                  Row(children: [
                    imageWidget('assets/images/tudLogo.png'),
                    const SizedBox(
                      width: 50,
                    ),
                    imageWidget('assets/images/stadtSportLogo.png'),
                  ]),
                  /*ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherDetails()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryColor),
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Erziehungsberechtigen',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),*/
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Station',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Rumpfbeuge()));
                          },
                          label: const Text(
                            'Rumpfbeuge',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          icon: const Icon(
                            Icons.accessibility_sharp,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Sprint()));
                          },
                          label: const Text(
                            '20m - Sprint',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          icon: const Icon(
                            Icons.directions_run,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Standweitsprung()));
                        },
                        label: const Text(
                          'Standweitsprung',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.pivot_table_chart_sharp,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SitUps()));
                        },
                        label: const Text(
                          'Sit-ups',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Liegestuetz()));
                        },
                        label: const Text(
                          'Liegestütz',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.arrow_upward,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SeitlichesHerspringen()));
                        },
                        label: const Text(
                          'Hin-&Herspringen',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.adjust_sharp,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Balancieren()));
                        },
                        label: const Text(
                          'Balancieren rückwärts',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.balance,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Lauf()));
                        },
                        label: const Text(
                          '6-Minuten-Lauf',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        icon: const Icon(
                          Icons.run_circle_outlined,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
