class pointmodel {
  final int public;
  final int reservable;
  final int totalSuccess;

  pointmodel({
    required this.public,
    required this.reservable,
    required this.totalSuccess,
  });

  factory pointmodel.fromJson(
      Map<String, dynamic> json1, Map<String, dynamic> json2) {
    return pointmodel(
      public: json1['success']['public'],
      reservable: json1['success']['reservable'],
      totalSuccess: json2['success'],
    );
  }
}
