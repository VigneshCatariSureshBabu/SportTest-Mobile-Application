class StationDetails7 {
  late int schritte6CM01;
  late int schritte6CM02;
  late int schritte45CM01;
  late int schritte45CM02;
  late int schritte3CM01;
  late int schritte3CM02;

  StationDetails7(this.schritte6CM01, this.schritte6CM02, this.schritte45CM01,
      this.schritte45CM02, this.schritte3CM01, this.schritte3CM02);
  Map<String, dynamic> toJson() => {
        'schritte6CM01': schritte6CM01,
        'schritte6CM02': schritte6CM02,
        'schritte45CM01': schritte45CM01,
        'schritte45CM02': schritte45CM02,
        'schritte3CM01': schritte3CM01,
        'schritte3CM02': schritte3CM02,
      };
}
