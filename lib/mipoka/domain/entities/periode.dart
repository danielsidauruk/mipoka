import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/periode_model.dart';

class Periode extends Equatable {
  final int idPeriode;
  final String tahun;
  final String ulang;
  final DateTime mulai;
  final DateTime akhir;

  const Periode({
    required this.idPeriode,
    required this.tahun,
    required this.ulang,
    required this.mulai,
    required this.akhir,
  });

  PeriodeModel toPeriodeModel() {
    return PeriodeModel(
      idPeriode: idPeriode,
      tahun: tahun,
      ulang: ulang,
      mulai: mulai,
      akhir: akhir,
    );
  }

  @override
  List<Object?> get props => [
    idPeriode,
    tahun,
    ulang,
    mulai,
    akhir,
  ];
}
