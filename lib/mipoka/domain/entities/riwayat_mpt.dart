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

  RiwayatMpt copyWith({
    int? idRiwayatMpt,
    int? idKegiatan,
    int? idUser,
    String? status,
    String? file,
    String? hash,
    String? keteranganA,
    String? keteranganB,
    DateTime? mulai,
    DateTime? akhir,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return RiwayatMpt(
      idRiwayatMpt: idRiwayatMpt ?? this.idRiwayatMpt,
      idKegiatan: idKegiatan ?? this.idKegiatan,
      idUser: idUser ?? this.idUser,
      status: status ?? this.status,
      file: file ?? this.file,
      hash: hash ?? this.hash,
      keteranganA: keteranganA ?? this.keteranganA,
      keteranganB: keteranganB ?? this.keteranganB,
      mulai: mulai ?? this.mulai,
      akhir: akhir ?? this.akhir,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
