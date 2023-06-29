import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';

class RincianBiayaKegiatanModel extends RincianBiayaKegiatan {
  const RincianBiayaKegiatanModel({
    required super.idRincianBiayaKegiatan,
    required super.namaBiaya,
    required super.keterangan,
    required super.kuantitas,
    required super.hargaSatuan,
    required super.usulanAnggaran,
    required super.realisasiAnggaran,
    required super.selisih,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory RincianBiayaKegiatanModel.fromEntity(RincianBiayaKegiatan rincianBiayaKegiatan) {
    return RincianBiayaKegiatanModel(
      idRincianBiayaKegiatan: rincianBiayaKegiatan.idRincianBiayaKegiatan,
      namaBiaya: rincianBiayaKegiatan.namaBiaya,
      keterangan: rincianBiayaKegiatan.keterangan,
      kuantitas: rincianBiayaKegiatan.kuantitas,
      hargaSatuan: rincianBiayaKegiatan.hargaSatuan,
      usulanAnggaran: rincianBiayaKegiatan.usulanAnggaran,
      realisasiAnggaran: rincianBiayaKegiatan.realisasiAnggaran,
      selisih: rincianBiayaKegiatan.selisih,
      createdAt: rincianBiayaKegiatan.createdAt,
      createdBy: rincianBiayaKegiatan.createdBy,
      updatedAt: rincianBiayaKegiatan.updatedAt,
      updatedBy: rincianBiayaKegiatan.updatedBy,
    );
  }

  factory RincianBiayaKegiatanModel.fromJson(Map<String, dynamic> json) => RincianBiayaKegiatanModel(
    idRincianBiayaKegiatan: json["id_rincian_biaya_kegiatan"],
    namaBiaya: json["nama_biaya"],
    keterangan: json["keterangan"],
    kuantitas: json["kuantitas"],
    hargaSatuan: json["harga_satuan"],
    usulanAnggaran: json["usulan_anggaran"],
    realisasiAnggaran: json["realisasi_anggaran"],
    selisih: json["selisih"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_rincian_biaya_kegiatan": idRincianBiayaKegiatan,
    "nama_biaya": namaBiaya,
    "keterangan": keterangan,
    "kuantitas": kuantitas,
    "harga_satuan": hargaSatuan,
    "usulan_anggaran": usulanAnggaran,
    "realisasi_anggaran": realisasiAnggaran,
    "selisih": selisih,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}