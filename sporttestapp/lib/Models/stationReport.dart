class StationReport {
  late double rumpfbeuge;
  late double sprint;
  late int standweitsprung;
  late int situps;
  late int liegestuetz;
  late int springen;
  late int balancierenRueckwaerts6CM;
  late int balancierenRueckwaerts45CM;
  late int balancierenRueckwaerts3CM;
  late int balancierenRueckwaerts;
  late int lauf;
  late int height;
  late int weight;

  StationReport(
      this.rumpfbeuge,
      this.sprint,
      this.standweitsprung,
      this.situps,
      this.liegestuetz,
      this.springen,
      this.balancierenRueckwaerts6CM,
      this.balancierenRueckwaerts45CM,
      this.balancierenRueckwaerts3CM,
      this.balancierenRueckwaerts,
      this.lauf,
      this.height,
      this.weight);
  Map<String, dynamic> toJson() => {
        'rumpfbeuge': rumpfbeuge,
        'sprint': sprint,
        'standweitsprung': standweitsprung,
        'situps': situps,
        'liegestuetz': liegestuetz,
        'springen': springen,
        'balancierenRueckwaerts6CM': balancierenRueckwaerts6CM,
        'balancierenRueckwaerts45CM': balancierenRueckwaerts45CM,
        'balancierenRueckwaerts3CM': balancierenRueckwaerts3CM,
        'balancierenRueckwaerts': balancierenRueckwaerts,
        'lauf': lauf,
        'groesse': height,
        'gewicht': weight
      };
}
