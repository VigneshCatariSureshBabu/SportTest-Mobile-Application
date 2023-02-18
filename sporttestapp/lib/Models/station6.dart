class StationDetails6 {
  late int durchgang01;
  late int durchgang02;

  StationDetails6(this.durchgang01, this.durchgang02);
  Map<String, dynamic> toJson() => {
        'durchgang01': durchgang01,
        'durchgang02': durchgang02,
      };
}
