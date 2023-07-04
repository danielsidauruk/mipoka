import 'package:mipoka/mipoka/domain/entities/riwayat_kegiatan_mpt.dart';

class RiwayatMptModel extends RiwayatKegiatanMpt {
  const RiwayatMptModel({
    required super.idRiwayatKegiatanMpt,
    required super.idKegiatanPerPeriodeMpt,
    required super.idUser,
    required super.statusMpt,
    required super.fileSertifikatMpt,
    required super.hash,
    required super.keteranganMhs,
    required super.keteranganSa,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory RiwayatMptModel.fromEntity(RiwayatKegiatanMpt riwayatMpt) {
    return RiwayatMptModel(
      idRiwayatKegiatanMpt: riwayatMpt.idRiwayatKegiatanMpt,
      idKegiatanPerPeriodeMpt: riwayatMpt.idKegiatanPerPeriodeMpt,
      idUser: riwayatMpt.idUser,
      statusMpt: riwayatMpt.statusMpt,
      fileSertifikatMpt: riwayatMpt.fileSertifikatMpt,
      hash: riwayatMpt.hash,
      keteranganMhs: riwayatMpt.keteranganMhs,
      keteranganSa: riwayatMpt.keteranganSa,
      createdAt: riwayatMpt.createdAt,
      createdBy: riwayatMpt.createdBy,
      updatedAt: riwayatMpt.updatedAt,
      updatedBy: riwayatMpt.updatedBy,
    );
  }

  factory RiwayatMptModel.fromJson(Map<String, dynamic> json) => RiwayatMptModel(
    idRiwayatKegiatanMpt: json["id_riwayat_kegiatan_mpt"],
    idKegiatanPerPeriodeMpt: json["id_kegiatan_per_periode_mpt"],
    idUser: json["id_user"],
    statusMpt: json["status_mpt"],
    fileSertifikatMpt: json["file_sertifikat_mpt"],
    hash: json["hash"],
    keteranganMhs: json["keterangan_mhs"],
    keteranganSa: json["keterangan_sa"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_riwayat_kegiatan_mpt": idRiwayatKegiatanMpt,
    "id_kegiatan_per_periode_mpt": idKegiatanPerPeriodeMpt,
    "id_user": idUser,
    "status_mpt": statusMpt,
    "file_sertifikat_mpt": fileSertifikatMpt,
    "hash": hash,
    "keterangan_mhs": keteranganMhs,
    "keterangan_sa": keteranganSa,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
