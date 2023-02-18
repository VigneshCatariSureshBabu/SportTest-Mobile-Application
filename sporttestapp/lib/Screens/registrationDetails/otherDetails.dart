// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Components/usefulCustomWidgets.dart';
import '../../Constants/constant.dart';
import '../Home/home.dart';

class OtherDetails extends StatefulWidget {
  const OtherDetails({super.key});
  @override
  State<StatefulWidget> createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  final db = FirebaseFirestore.instance;
  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _gFistName = TextEditingController();
  final TextEditingController _gSurName = TextEditingController();
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _otherSportClub = TextEditingController();
  final TextEditingController _otherSport = TextEditingController();
  final TextEditingController _swimmingBadge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // To get the total height and width of our screen
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
                            'Postanschrift',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'des',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Erziehungsberechtigen',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    textWidgetForInteger(_studentId, "ID"),
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
                    textWidgetForInteger(_houseNumber, 'Hausnummer'),
                    const SizedBox(
                      height: 20,
                    ),
                    textWidgetWithoutIcon(_street, 'Straße', false),
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
                        _otherSport,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          color: primaryColor,
                          onPressed: () async {
                            await db
                                .collection('users')
                                .doc(_studentId.text)
                                .update({
                              'gfirstname': _gFistName.text,
                              'gsurname': _gSurName.text,
                              'housenumber': int.parse(_houseNumber.text),
                              'street': _street.text,
                              'postalcode': int.parse(_postalCode.text),
                              'othersport': _otherSportClub.text,
                              'sportschool': _otherSport.text,
                              'hasswimmingbadge': _swimmingBadge.text,
                            });

                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
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
