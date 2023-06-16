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

  Periode copyWith({
    int? idPeriode,
    String? tahun,
    String? ulang,
    DateTime? mulai,
    DateTime? akhir,
  }) {
    return Periode(
      idPeriode: idPeriode ?? this.idPeriode,
      tahun: tahun ?? this.tahun,
      ulang: ulang ?? this.ulang,
      mulai: mulai ?? this.mulai,
      akhir: akhir ?? this.akhir,
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
