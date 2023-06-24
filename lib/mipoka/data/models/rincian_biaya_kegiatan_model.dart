import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';

class RincianBiayaKegiatanModel extends RincianBiayaKegiatan {
  const RincianBiayaKegiatanModel({
    required super.idBiayaKegiatan,
    required super.idLaporan,
    required super.namaBiaya,
    required super.keterangan,
    required super.kuantitas,
    required super.hargaSatuan,
    required super.usulanAnggaran,
    required super.realisasiAnggaran,
    required super.selisih,
    required super.totalUsulan,
    required super.totalRealisasi,
    required super.totalSelisih,
  });

  factory RincianBiayaKegiatanModel.fromEntity(RincianBiayaKegiatan biayaKegiatan) {
    return RincianBiayaKegiatanModel(
      idBiayaKegiatan: biayaKegiatan.idBiayaKegiatan,
      idLaporan: biayaKegiatan.idLaporan,
      namaBiaya: biayaKegiatan.namaBiaya,
      keterangan: biayaKegiatan.keterangan,
      kuantitas: biayaKegiatan.kuantitas,
      hargaSatuan: biayaKegiatan.hargaSatuan,
      usulanAnggaran: biayaKegiatan.usulanAnggaran,
      realisasiAnggaran: biayaKegiatan.realisasiAnggaran,
      selisih: biayaKegiatan.selisih,
      totalUsulan: biayaKegiatan.totalUsulan,
      totalRealisasi: biayaKegiatan.totalRealisasi,
      totalSelisih: biayaKegiatan.totalSelisih,
    );
  }

  factory RincianBiayaKegiatanModel.fromJson(Map<String, dynamic> json) => RincianBiayaKegiatanModel(
    idBiayaKegiatan: json["idBiayaKegiatan"],
    idLaporan: json["idLaporan"],
    namaBiaya: json["namaBiaya"],
    keterangan: json["keterangan"],
    kuantitas: json["kuantitas"],
    hargaSatuan: json["hargaSatuan"],
    usulanAnggaran: json["usulanAnggaran"],
    realisasiAnggaran: json["realisasiAnggaran"],
    selisih: json["selisih"],
    totalUsulan: json["totalUsulan"],
    totalRealisasi: json["totalRealisasi"],
    totalSelisih: json["totalSelisih"],
  );

  Map<String, dynamic> toJson() => {
    "idBiayaKegiatan": idBiayaKegiatan,
    "idLaporan": idLaporan,
    "namaBiaya": namaBiaya,
    "keterangan": keterangan,
    "kuantitas": kuantitas,
    "hargaSatuan": hargaSatuan,
    "usulanAnggaran": usulanAnggaran,
    "realisasiAnggaran": realisasiAnggaran,
    "selisih": selisih,
    "totalUsulan": totalUsulan,
    "totalRealisasi": totalRealisasi,
    "totalSelisih": totalSelisih,
  };
}