import 'package:mipoka/mipoka/domain/entities/kegiatan_mpt.dart';

// ==> Just Updated 26 / 06 / 2023
class KegiatanMptModel extends KegiatanMpt{
  const KegiatanMptModel({
    required super.idKegiatanMpt,
    required super.jenisKegiatanMpt,
    required super.namaKegiatanMpt,
    required super.idPeriodeMpt,
    required super.tanggalMulaiKegiatanMpt,
    required super.tanggalSelesaiKegiatanMpt,
    required super.pointMptDiperoleh,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory KegiatanMptModel.fromEntity(KegiatanMpt kegiatanMpt) {
    return KegiatanMptModel(
      idKegiatanMpt: kegiatanMpt.idKegiatanMpt,
      jenisKegiatanMpt: kegiatanMpt.jenisKegiatanMpt,
      namaKegiatanMpt: kegiatanMpt.namaKegiatanMpt,
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
    idKegiatanMpt: json["id_kegiatan_mpt"],
    jenisKegiatanMpt: json["jenis_kegiatan_mpt"],
    namaKegiatanMpt: json["nama_kegiatan_mpt"],
    idPeriodeMpt: json["id_periode_mpt"],
    tanggalMulaiKegiatanMpt: json["tanggal_mulai_kegiatan_mpt"],
    tanggalSelesaiKegiatanMpt: json["tanggal_selesai_kegiatan_mpt"],
    pointMptDiperoleh: json["point_mpt_diperoleh"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan_mpt": idKegiatanMpt,
    "jenis_kegiatan_mpt": jenisKegiatanMpt,
    "nama_kegiatan_mpt": namaKegiatanMpt,
    "id_periode_mpt": idPeriodeMpt,
    "tanggal_mulai_kegiatan_mpt": tanggalMulaiKegiatanMpt,
    "tanggal_selesai_kegiatan_mpt": tanggalSelesaiKegiatanMpt,
    "point_mpt_diperoleh": pointMptDiperoleh,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
