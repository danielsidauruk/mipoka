import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';

class BiayaKegiatanModel extends BiayaKegiatan {
  const BiayaKegiatanModel({
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

  factory BiayaKegiatanModel.fromEntity(BiayaKegiatan biayaKegiatan) {
    return BiayaKegiatanModel(
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

  factory BiayaKegiatanModel.fromJson(Map<String, dynamic> json) => BiayaKegiatanModel(
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