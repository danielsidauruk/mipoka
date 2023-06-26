import 'package:equatable/equatable.dart';

// Just updated 26 / 06 / 2023
class TertibAcara extends Equatable {
  final int idTertibAcara;
  final String waktuMulai;
  final String waktuSelesai;
  final String aktivitas;
  final String keterangan;

  const TertibAcara({
    required this.idTertibAcara,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.aktivitas,
    required this.keterangan,
  });

  TertibAcara copyWith({
    int? idTertibAcara,
    String? waktuMulai,
    String? waktuSelesai,
    String? aktivitas,
    String? keterangan,
  }) {
    return TertibAcara(
      idTertibAcara: idTertibAcara ?? this.idTertibAcara,
      waktuMulai: waktuMulai ?? this.waktuMulai,
      waktuSelesai: waktuSelesai ?? this.waktuSelesai,
      aktivitas: aktivitas ?? this.aktivitas,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object?> get props => [
    idTertibAcara,
    waktuMulai,
    waktuSelesai,
    aktivitas,
    keterangan,
  ];
}