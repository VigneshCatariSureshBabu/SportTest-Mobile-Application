class UserDetails {
  late String fistName;
  late String surName;
  late String gender;
  late String birthDate;
  late String school;
  late String classStudy;
  late String gFistName;
  late String gSurName;
  late String street;
  late int postalCode;
  late String otherSportClub;
  late String otherSportName;
  late String swimmingBadge;
  late String consent;

  UserDetails(
      this.fistName,
      this.surName,
      this.gender,
      this.birthDate,
      this.school,
      this.classStudy,
      this.gFistName,
      this.gSurName,
      this.street,
      this.postalCode,
      this.otherSportClub,
      this.otherSportName,
      this.swimmingBadge,
      this.consent);
  Map<String, dynamic> toJson() => {
        'vorname': fistName,
        'nachname': surName,
        'geburtsdatum': birthDate,
        'geschlecht': gender,
        'schule': school,
        'klasse': classStudy,
        'gvorname': gFistName,
        'gnachname': gSurName,
        'postleitzahl': postalCode,
        'hasswimmingbadge': swimmingBadge,
        'strassehausnummer': street,
        'mehrerenSportverein': otherSportClub,
        'sportvereinname': otherSportName,
        'einverstaendniserklaerung': consent,
      };
}
