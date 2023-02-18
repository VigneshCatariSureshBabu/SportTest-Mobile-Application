class StationDetails8 {
  late int anzahl;
  late int reststrecke;

  StationDetails8(this.anzahl, this.reststrecke);
  Map<String, dynamic> toJson() =>
      {'anzahl': anzahl, 'restStrecke': reststrecke};
}
