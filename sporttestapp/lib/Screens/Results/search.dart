import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporttestapp/Models/result.dart';
import 'package:sporttestapp/Screens/Home/home.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';

class ResultSearch extends StatefulWidget {
  const ResultSearch({Key? key}) : super(key: key);

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final TextEditingController _studentId = TextEditingController();
  bool isVisible = false;
  ResultDetails result = ResultDetails('', '', '', 0, 0, 0, 0, 0, 0, 0, 0);
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(children: [
                        imageWidget('assets/images/tudLogo.png'),
                        const SizedBox(
                          width: 50,
                        ),
                        imageWidget('assets/images/stadtSportLogo.png'),
                      ]),
                      Center(
                        child: Column(
                          children: const [
                            Text(
                              'Suchen',
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textWidgetForIntegerWithCustomKeyboard(_studentId, 'ID'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                            color: primaryColor,
                            onPressed: () {
                              setState(() => isVisible = !isVisible);
                            },
                            child: const Text(
                              'Suchen',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      if (isVisible)
                        FutureBuilder<ResultDetails?>(
                            future: readDocument(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                    'Something is wrong, ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final result = snapshot.data;
                                return result == null
                                    ? const Center(
                                        child: Text('ID not found'),
                                      )
                                    : buildResult(result);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: primaryColor,
                                    valueColor:
                                        AlwaysStoppedAnimation(secondaryColor),
                                    strokeWidth: 10,
                                  ),
                                );
                              }
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ResultDetails?> readDocument() async {
    if (isVisible) setState(() => isVisible = !isVisible);
    final userInfo =
        FirebaseFirestore.instance.collection('users').doc(_studentId.text);
    final testInfo = FirebaseFirestore.instance
        .collection('stationreport')
        .doc(_studentId.text);

    final snapshotUserInfo = await userInfo.get();
    final snapshotTestInfo = await testInfo.get();

    if (snapshotUserInfo.exists && snapshotTestInfo.exists) {
      result.fistName = snapshotUserInfo['vorname'];
      result.surName = snapshotUserInfo['nachname'];
      result.school = snapshotUserInfo['schule'];
      result.rumpfbeuge = snapshotTestInfo['rumpfbeuge'];
      result.sprint = snapshotTestInfo['sprint'];
      result.standweitsprung = snapshotTestInfo['standweitsprung'];
      result.situps = snapshotTestInfo['situps'];
      result.liegestuetz = snapshotTestInfo['liegestuetz'];
      result.springen = snapshotTestInfo['springen'];
      result.balancierenRueckwaerts =
          snapshotTestInfo['balancierenRueckwaerts'];
      result.lauf = snapshotTestInfo['lauf'];
      return result;
    }
    return null;
  }

  Widget buildResult(ResultDetails result) => ListTile(
        title: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Studentische Details',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Grundlegende Details ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
              ),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      const DataCell(Text('Vorname ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.fistName)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Nachname ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.surName)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Schule ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.school)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Station Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
              ),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      const DataCell(Text('Rumpfbeuge ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.rumpfbeuge.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('20m-Sprint ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.sprint.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Standweitsprung ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.standweitsprung.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Sit-ups ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.situps.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Liegestütz ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.liegestuetz.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Herspringen ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.springen.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('Balancieren Rückwärts',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.balancierenRueckwaerts.toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(Text('6-Minuten-Lauf ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(result.lauf.toString())),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
