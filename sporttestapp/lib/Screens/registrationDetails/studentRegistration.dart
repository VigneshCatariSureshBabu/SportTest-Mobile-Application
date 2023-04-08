// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';
import '../../Models/user.dart';
import '../Home/home.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  List<String> genders = ['männlich', 'weiblich', 'divers'];
  String selectedGender = 'männlich';
  final db = FirebaseFirestore.instance;
  final newUser = UserDetails(
      'fistName',
      'surName',
      'gender',
      'birthDate',
      'school',
      'classStudy',
      'gFistName',
      'gSurName',
      'street',
      0,
      'otherSportClub',
      'otherSportName',
      'swimmingBadge',
      'consent');

  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _surName = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _school = TextEditingController();
  final TextEditingController _classStudy = TextEditingController();
  final TextEditingController _gFistName = TextEditingController();
  final TextEditingController _gSurName = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _otherSportClub = TextEditingController();
  final TextEditingController _otherSportName = TextEditingController();
  final TextEditingController _swimmingBadge = TextEditingController();
  final TextEditingController _consent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // To get the total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("Sportmotorische Testung"),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, size.height * 0.2),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Daten des Kindes:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: DropdownButton<String>(
                        value: selectedGender,
                        items: genders
                            .map(
                              (gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (gender) =>
                            setState(() => selectedGender = gender!),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_studentId, 'ID'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_firstName, 'Vorname', false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_surName, 'Nachname', false),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.today_rounded,
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            label: Text(
                              'Geburtsdatum',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                              ),
                            )),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          if (date != null) {}
                          setState(() {});
                          _date.text = DateFormat('dd.MM.yyyy').format(date!);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_school, 'Schule', false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_classStudy, 'Klasse', false),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Postanschrift',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'des',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Erziehungsberechtigen',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_gFistName, "Vorname", false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_gSurName, "Nachname", false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_street, 'Straße Hausnummer', false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetForInteger(_postalCode, 'Postleitzahl'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(
                        _otherSportClub,
                        'Ist das Kind Mitglied in einem anderen Sportverein?',
                        false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(
                        _otherSportName,
                        'Wenn ja, geben Sie den Namen des Sportvereins ein',
                        false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_swimmingBadge,
                        'Haben Sie ein Schwimmabzeichen? Ja/Nein', false),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(
                        _consent, 'Einverständniserklärung? (ja/nein)', false),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            newUser.fistName = _firstName.text;
                            newUser.surName = _surName.text;
                            newUser.birthDate = _date.text;
                            newUser.gender = selectedGender;
                            newUser.school = _school.text;
                            newUser.classStudy = _classStudy.text;
                            newUser.otherSportName = _otherSportName.text;
                            newUser.otherSportClub = _otherSportClub.text;
                            newUser.consent = _consent.text;
                            newUser.swimmingBadge = _swimmingBadge.text;
                            newUser.postalCode = int.parse(_postalCode.text);
                            newUser.gFistName = _gFistName.text;
                            newUser.gSurName = _gSurName.text;
                            newUser.street = _street.text;

                            await db
                                .collection('users')
                                .doc(_studentId.text)
                                .set(newUser.toJson());

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
