class StationDetails {
  late double durchgang01;
  late double durchgang02;
  late double result;

  StationDetails(this.durchgang01, this.durchgang02, this.result);
  Map<String, dynamic> toJson() => {
        'durchgang01': durchgang01,
        'durchgang02': durchgang02,
        'result': result
      };
}
