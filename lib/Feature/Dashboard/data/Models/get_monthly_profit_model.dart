import 'package:equatable/equatable.dart';

class GetMonthlyProfitModel extends Equatable {
  final int? jan;
  final int? feb;
  final int? mar;
  final int? apr;
  final int? may;
  final double? jun;
  final int? jul;
  final int? aug;
  final int? sep;
  final int? oct;
  final int? nov;
  final int? dec;

  const GetMonthlyProfitModel({
    this.jan,
    this.feb,
    this.mar,
    this.apr,
    this.may,
    this.jun,
    this.jul,
    this.aug,
    this.sep,
    this.oct,
    this.nov,
    this.dec,
  });

  factory GetMonthlyProfitModel.fromJson(Map<String, dynamic> json) {
    return GetMonthlyProfitModel(
      jan: json['Jan'] as int?,
      feb: json['Feb'] as int?,
      mar: json['Mar'] as int?,
      apr: json['Apr'] as int?,
      may: json['May'] as int?,
      jun: (json['Jun'] as num?)?.toDouble(),
      jul: json['Jul'] as int?,
      aug: json['Aug'] as int?,
      sep: json['Sep'] as int?,
      oct: json['Oct'] as int?,
      nov: json['Nov'] as int?,
      dec: json['Dec'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Jan': jan,
        'Feb': feb,
        'Mar': mar,
        'Apr': apr,
        'May': may,
        'Jun': jun,
        'Jul': jul,
        'Aug': aug,
        'Sep': sep,
        'Oct': oct,
        'Nov': nov,
        'Dec': dec,
      };

  @override
  List<Object?> get props {
    return [
      jan,
      feb,
      mar,
      apr,
      may,
      jun,
      jul,
      aug,
      sep,
      oct,
      nov,
      dec,
    ];
  }
}
