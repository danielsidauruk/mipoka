import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';

// => Just Updated 26 / 06 / 2023
class BiayaKegiatanModel extends BiayaKegiatan {
  const BiayaKegiatanModel({
    required super.idBiayaKegiatan,
    required super.namaBiayaKegiatan,
    required super.kuantiti,
    required super.hargaSatuan,
    required super.total,
    required super.keterangan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory BiayaKegiatanModel.fromEntity(BiayaKegiatan rincianBiayaKegiatan) {
    return BiayaKegiatanModel(
      idBiayaKegiatan: rincianBiayaKegiatan.idBiayaKegiatan,
      namaBiayaKegiatan: rincianBiayaKegiatan.namaBiayaKegiatan,
      kuantiti: rincianBiayaKegiatan.kuantiti,
      hargaSatuan: rincianBiayaKegiatan.hargaSatuan,
      total: rincianBiayaKegiatan.total,
      keterangan: rincianBiayaKegiatan.keterangan,
      createdAt: rincianBiayaKegiatan.createdAt,
      createdBy: rincianBiayaKegiatan.createdBy,
      updatedAt: rincianBiayaKegiatan.updatedAt,
      updatedBy: rincianBiayaKegiatan.updatedBy,
    );
  }

  factory BiayaKegiatanModel.fromJson(Map<String, dynamic> json) => BiayaKegiatanModel(
    idBiayaKegiatan: json["id_biaya_kegiatan"],
    namaBiayaKegiatan: json["nama_biaya_kegiatan"],
    kuantiti: json["kuantiti"],
    hargaSatuan: json["harga_satuan"],
    total: json["total"],
    keterangan: json["keterangan"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_biaya_kegiatan": idBiayaKegiatan,
    "nama_biaya_kegiatan": namaBiayaKegiatan,
    "kuantiti": kuantiti,
    "harga_satuan": hargaSatuan,
    "total": total,
    "keterangan": keterangan,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
