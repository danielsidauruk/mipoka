import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';

class KegiatanPerPeriodeMptModel extends KegiatanPerPeriodeMpt{
  const KegiatanPerPeriodeMptModel({
    required super.idKegiatanPerPeriodeMpt,
    required super.idNamaKegiatanMpt,
    required super.idPeriodeMpt,
    required super.idJenisKegiatanMpt,
    required super.tanggalMulaiKegiatanPerPeriodeMpt,
    required super.tanggalSelesaiKegiatanPerPeriodeMpt,
    required super.pointMptDiperoleh,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory KegiatanPerPeriodeMptModel.fromEntity(KegiatanPerPeriodeMpt kegiatanMpt) {
    return KegiatanPerPeriodeMptModel(
      idKegiatanPerPeriodeMpt: kegiatanMpt.idKegiatanPerPeriodeMpt,
      idNamaKegiatanMpt: kegiatanMpt.idNamaKegiatanMpt,
      idPeriodeMpt: kegiatanMpt.idPeriodeMpt,
      idJenisKegiatanMpt: kegiatanMpt.idJenisKegiatanMpt,
      tanggalMulaiKegiatanPerPeriodeMpt: kegiatanMpt.tanggalMulaiKegiatanPerPeriodeMpt,
      tanggalSelesaiKegiatanPerPeriodeMpt: kegiatanMpt.tanggalSelesaiKegiatanPerPeriodeMpt,
      pointMptDiperoleh: kegiatanMpt.pointMptDiperoleh,
      createdAt: kegiatanMpt.createdAt,
      createdBy: kegiatanMpt.createdBy,
      updatedAt: kegiatanMpt.updatedAt,
      updatedBy: kegiatanMpt.updatedBy,
    );
  }

  factory KegiatanPerPeriodeMptModel.fromJson(Map<String, dynamic> json) => KegiatanPerPeriodeMptModel(
    idKegiatanPerPeriodeMpt: json["id_kegiatan_per_periode_mpt"],
    idPeriodeMpt: json["id_periode_mpt"],
    idNamaKegiatanMpt: json["id_nama_kegiatan_mpt"],
    idJenisKegiatanMpt: json["id_jenis_kegiatan_mpt"],
    tanggalMulaiKegiatanPerPeriodeMpt: json["tanggal_mulai_kegiatan_per_periode_mpt"],
    tanggalSelesaiKegiatanPerPeriodeMpt: json["tanggal_selesai_kegiatan_per_periode_mpt"],
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
    "id_jenis_kegiatan_mpt": idJenisKegiatanMpt,
    "tanggal_mulai_kegiatan_per_periode_mpt": tanggalMulaiKegiatanPerPeriodeMpt,
    "tanggal_selesai_kegiatan_per_periode_mpt": tanggalSelesaiKegiatanPerPeriodeMpt,
    "point_mpt_diperoleh": pointMptDiperoleh,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
