import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';

class JenisKegiatanMptModel extends JenisKegiatanMpt {
  const JenisKegiatanMptModel({
    required super.idJenisKegiatanMpt,
    required super.namaJenisKegiatanMpt,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory JenisKegiatanMptModel.fromEntity(JenisKegiatanMpt jenisKegiatanMpt) {
    return JenisKegiatanMptModel(
      idJenisKegiatanMpt: jenisKegiatanMpt.idJenisKegiatanMpt,
      namaJenisKegiatanMpt: jenisKegiatanMpt.namaJenisKegiatanMpt,
      createdAt: jenisKegiatanMpt.createdAt,
      createdBy: jenisKegiatanMpt.createdBy,
      updatedAt: jenisKegiatanMpt.updatedAt,
      updatedBy: jenisKegiatanMpt.updatedBy,
    );
  }

  factory JenisKegiatanMptModel.fromJson(Map<String, dynamic> json) => JenisKegiatanMptModel(
    idJenisKegiatanMpt: json["id_jenis_kegiatan_mpt"],
    namaJenisKegiatanMpt: json["nama_jenis_kegiatan_mpt"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],

      // "id_jenis_kegiatan_mpt": 342421,
      // "nama_jenis_kegiatan_mpt": "Pelayanan Masyarakat",
      // "created_at": "2023-06-26",
      // "created_by": "Jane Smith",
      // "updated_at": "2023-06-26",
      // "updated_by": "John Doe"
  );

  Map<String, dynamic> toJson() => {
    "id_jenis_kegiatan_mpt": idJenisKegiatanMpt,
    "nama_jenis_kegiatan_mpt": namaJenisKegiatanMpt,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}