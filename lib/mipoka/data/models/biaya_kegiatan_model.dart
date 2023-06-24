import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';

// => Just Updated
class BiayaKegiatanModel extends BiayaKegiatan {
  const BiayaKegiatanModel({
    required super.idRincianBiayaKegiatan,
    required super.namaBiayaKegiatan,
    required super.kuantiti,
    required super.hargaSatuan,
    required super.total,
    required super.keterangan,
  });

  factory BiayaKegiatanModel.fromEntity(BiayaKegiatan rincianBiayaKegiatan) {
    return BiayaKegiatanModel(
      idRincianBiayaKegiatan: rincianBiayaKegiatan.idRincianBiayaKegiatan,
      namaBiayaKegiatan: rincianBiayaKegiatan.namaBiayaKegiatan,
      kuantiti: rincianBiayaKegiatan.kuantiti,
      hargaSatuan: rincianBiayaKegiatan.hargaSatuan,
      total: rincianBiayaKegiatan.total,
      keterangan: rincianBiayaKegiatan.keterangan,
    );
  }

  factory BiayaKegiatanModel.fromJson(Map<String, dynamic> json) => BiayaKegiatanModel(
    idRincianBiayaKegiatan: json["idKegiatan"],
    namaBiayaKegiatan: json["namaBiayaKegiatan"],
    kuantiti: json["qty"],
    hargaSatuan: json["hargaSatuan"],
    total: json["total"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "idKegiatan": idRincianBiayaKegiatan,
    "namaBiayaKegiatan": namaBiayaKegiatan,
    "qty": kuantiti,
    "hargaSatuan": hargaSatuan,
    "total": total,
    "keterangan": keterangan,
  };
}
