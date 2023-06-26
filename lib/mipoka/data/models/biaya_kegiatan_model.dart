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
  });

  factory BiayaKegiatanModel.fromEntity(BiayaKegiatan rincianBiayaKegiatan) {
    return BiayaKegiatanModel(
      idBiayaKegiatan: rincianBiayaKegiatan.idBiayaKegiatan,
      namaBiayaKegiatan: rincianBiayaKegiatan.namaBiayaKegiatan,
      kuantiti: rincianBiayaKegiatan.kuantiti,
      hargaSatuan: rincianBiayaKegiatan.hargaSatuan,
      total: rincianBiayaKegiatan.total,
      keterangan: rincianBiayaKegiatan.keterangan,
    );
  }

  factory BiayaKegiatanModel.fromJson(Map<String, dynamic> json) => BiayaKegiatanModel(
    idBiayaKegiatan: json["id_biaya_kegiatan"],
    namaBiayaKegiatan: json["nama_biaya_kegiatan"],
    kuantiti: json["kuantiti"],
    hargaSatuan: json["harga_satuan"],
    total: json["total"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "id_biaya_kegiatan": idBiayaKegiatan,
    "nama_biaya_kegiatan": namaBiayaKegiatan,
    "kuantiti": kuantiti,
    "harga_satuan": hargaSatuan,
    "total": total,
    "keterangan": keterangan,
  };
}
