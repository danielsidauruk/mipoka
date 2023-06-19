import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';

// => Just Updated
class RincianBiayaKegiatanModel extends RincianBiayaKegiatan {
  const RincianBiayaKegiatanModel({
    required super.idRincianBiayaKegiatan,
    required super.namaBiayaKegiatan,
    required super.kuantiti,
    required super.hargaSatuan,
    required super.total,
    required super.keterangan,
  });

  factory RincianBiayaKegiatanModel.fromEntity(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return RincianBiayaKegiatanModel(
      idRincianBiayaKegiatan: rincianBiayaKegiatan.idRincianBiayaKegiatan,
      namaBiayaKegiatan: rincianBiayaKegiatan.namaBiayaKegiatan,
      kuantiti: rincianBiayaKegiatan.kuantiti,
      hargaSatuan: rincianBiayaKegiatan.hargaSatuan,
      total: rincianBiayaKegiatan.total,
      keterangan: rincianBiayaKegiatan.keterangan,
    );
  }

  factory RincianBiayaKegiatanModel.fromJson(Map<String, dynamic> json) => RincianBiayaKegiatanModel(
    idRincianBiayaKegiatan: json["idRincianBiayaKegiatan"],
    namaBiayaKegiatan: json["namaBiayaKegiatan"],
    kuantiti: json["kuantiti"],
    hargaSatuan: json["hargaSatuan"],
    total: json["total"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "idRincianBiayaKegiatan": idRincianBiayaKegiatan,
    "namaBiayaKegiatan": namaBiayaKegiatan,
    "kuantiti": kuantiti,
    "hargaSatuan": hargaSatuan,
    "total": total,
    "keterangan": keterangan,
  };
}
