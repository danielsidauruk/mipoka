import 'package:mipoka/mipoka/domain/entities/nama_kegiatan_mpt.dart';

class NamaKegiatanMptModel extends NamaKegiatanMpt {
  const NamaKegiatanMptModel({
    required super.idNamaKegiatanMpt,
    required super.idJenisKegiatanMpt,
    required super.namaKegiatan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory NamaKegiatanMptModel.fromEntity(NamaKegiatanMpt namaKegiatanMpt) {
    return NamaKegiatanMptModel(
      idNamaKegiatanMpt: namaKegiatanMpt.idNamaKegiatanMpt,
      idJenisKegiatanMpt: namaKegiatanMpt.idJenisKegiatanMpt,
      namaKegiatan: namaKegiatanMpt.namaKegiatan,
      createdAt: namaKegiatanMpt.createdAt,
      createdBy: namaKegiatanMpt.createdBy,
      updatedAt: namaKegiatanMpt.updatedAt,
      updatedBy: namaKegiatanMpt.updatedBy,
    );
  }

  factory NamaKegiatanMptModel.fromJson(Map<String, dynamic> json) => NamaKegiatanMptModel(
    idNamaKegiatanMpt: json["id_nama_kegiatan_mpt"],
    idJenisKegiatanMpt: json["id_jenis_kegiatan_mpt"],
    namaKegiatan: json["nama_kegiatan"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_nama_kegiatan_mpt": idNamaKegiatanMpt,
    "id_jenis_kegiatan_mpt": idJenisKegiatanMpt,
    "nama_kegiatan": namaKegiatan,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}