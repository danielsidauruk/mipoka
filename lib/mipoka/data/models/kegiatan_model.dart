import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';

// ==> Just Updated 26 / 06 / 2023
class KegiatanMptModel extends KegiatanPerPeriodeMpt{
  const KegiatanMptModel({
    required super.idKegiatanPerPeriodeMpt,
    required super.idNamaKegiatanMpt,
    required super.idPeriodeMpt,
    required super.tanggalMulaiKegiatanMpt,
    required super.tanggalSelesaiKegiatanMpt,
    required super.pointMptDiperoleh,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory KegiatanMptModel.fromEntity(KegiatanPerPeriodeMpt kegiatanMpt) {
    return KegiatanMptModel(
      idKegiatanPerPeriodeMpt: kegiatanMpt.idKegiatanPerPeriodeMpt,
      idNamaKegiatanMpt: kegiatanMpt.idNamaKegiatanMpt,
      idPeriodeMpt: kegiatanMpt.idPeriodeMpt,
      tanggalMulaiKegiatanMpt: kegiatanMpt.tanggalMulaiKegiatanMpt,
      tanggalSelesaiKegiatanMpt: kegiatanMpt.tanggalSelesaiKegiatanMpt,
      pointMptDiperoleh: kegiatanMpt.pointMptDiperoleh,
      createdAt: kegiatanMpt.createdAt,
      createdBy: kegiatanMpt.createdBy,
      updatedAt: kegiatanMpt.updatedAt,
      updatedBy: kegiatanMpt.updatedBy,
    );
  }

  factory KegiatanMptModel.fromJson(Map<String, dynamic> json) => KegiatanMptModel(
    idKegiatanPerPeriodeMpt: json["id_kegiatan_per_periode_mpt"],
    idPeriodeMpt: json["id_periode_mpt"],
    idNamaKegiatanMpt: json["id_nama_kegiatan_mpt"],
    tanggalMulaiKegiatanMpt: json["tanggal_mulai_kegiatan_mpt"],
    tanggalSelesaiKegiatanMpt: json["tanggal_selesai_kegiatan_mpt"],
    pointMptDiperoleh: json["point_mpt_diperoleh"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan_per_periode_mpt": idKegiatanPerPeriodeMpt,
    "id_periode_mpt": idPeriodeMpt,
    "id_nama_kegiatan_mpt": idNamaKegiatanMpt,
    "tanggal_mulai_kegiatan_mpt": tanggalMulaiKegiatanMpt,
    "tanggal_selesai_kegiatan_mpt": tanggalSelesaiKegiatanMpt,
    "point_mpt_diperoleh": pointMptDiperoleh,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
