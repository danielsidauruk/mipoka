import 'package:equatable/equatable.dart';

class RiwayatMpt extends Equatable {
  final int idRiwayatMpt;
  final int idKegiatan;
  final int idUser;
  final String status;
  final String file;
  final String hash;
  final String keteranganA;
  final String keteranganB;
  final DateTime mulai;
  final DateTime akhir;
  final DateTime updatedAt;
  final DateTime createdAt;

  const RiwayatMpt({
    required this.idRiwayatMpt,
    required this.idKegiatan,
    required this.idUser,
    required this.status,
    required this.file,
    required this.hash,
    required this.keteranganA,
    required this.keteranganB,
    required this.mulai,
    required this.akhir,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    idRiwayatMpt,
    idKegiatan,
    idUser,
    status,
    file,
    hash,
    keteranganA,
    keteranganB,
    mulai,
    akhir,
    updatedAt,
    createdAt,
  ];
}
