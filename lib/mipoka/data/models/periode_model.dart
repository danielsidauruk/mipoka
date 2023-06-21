import 'package:mipoka/mipoka/domain/entities/periode.dart';

// => Just updated
class PeriodeModel extends Periode {
  const PeriodeModel({
    required super.idPeriode,
    required super.tahun,
    required super.ulang,
    required super.mulai,
    required super.akhir,
  });

  factory PeriodeModel.fromEntity(Periode periode) {
    return PeriodeModel(
      idPeriode: periode.idPeriode,
      tahun: periode.tahun,
      ulang: periode.ulang,
      mulai: periode.mulai,
      akhir: periode.akhir,
    );
  }

  factory PeriodeModel.fromJson(Map<String, dynamic> json) {
    return PeriodeModel(
      idPeriode: json['idPeriode'],
      tahun: json['tahun'],
      ulang: json['ulang'],
      mulai: DateTime.parse(json['mulai']),
      akhir: DateTime.parse(json['akhir']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPeriode': idPeriode,
      'tahun': tahun,
      'ulang': ulang,
      'mulai': mulai.toIso8601String(),
      'akhir': akhir.toIso8601String(),
    };
  }
}
