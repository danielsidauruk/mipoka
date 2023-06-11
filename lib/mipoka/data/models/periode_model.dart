import 'package:mipoka/mipoka/domain/entities/periode.dart';

class PeriodeModel extends Periode {
  const PeriodeModel({
    required int idPeriode,
    required String tahun,
    required String ulang,
    required DateTime mulai,
    required DateTime akhir,
  }) : super(
    idPeriode: idPeriode,
    tahun: tahun,
    ulang: ulang,
    mulai: mulai,
    akhir: akhir,
  );

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
