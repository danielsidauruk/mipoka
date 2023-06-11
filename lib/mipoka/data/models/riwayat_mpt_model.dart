import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';

class RiwayatMptModel extends RiwayatMpt {
  const RiwayatMptModel({
    required int idRiwayatMpt,
    required int idKegiatan,
    required int idUser,
    required String status,
    required String file,
    required String hash,
    required String keteranganA,
    required String keteranganB,
    required DateTime mulai,
    required DateTime akhir,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) : super(
    idRiwayatMpt: idRiwayatMpt,
    idKegiatan: idKegiatan,
    idUser: idUser,
    status: status,
    file: file,
    hash: hash,
    keteranganA: keteranganA,
    keteranganB: keteranganB,
    mulai: mulai,
    akhir: akhir,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );

  factory RiwayatMptModel.fromJson(Map<String, dynamic> json) {
    return RiwayatMptModel(
      idRiwayatMpt: json['idRiwayatMpt'],
      idKegiatan: json['idKegiatan'],
      idUser: json['idUser'],
      status: json['status'],
      file: json['file'],
      hash: json['hash'],
      keteranganA: json['keteranganA'],
      keteranganB: json['keteranganB'],
      mulai: DateTime.parse(json['mulai']),
      akhir: DateTime.parse(json['akhir']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRiwayatMpt': idRiwayatMpt,
      'idKegiatan': idKegiatan,
      'idUser': idUser,
      'status': status,
      'file': file,
      'hash': hash,
      'keteranganA': keteranganA,
      'keteranganB': keteranganB,
      'mulai': mulai.toIso8601String(),
      'akhir': akhir.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
