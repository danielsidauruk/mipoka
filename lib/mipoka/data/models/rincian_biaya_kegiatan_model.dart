import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';

class RincianBiayaKegiatanModel extends RincianBiayaKegiatan {
  const RincianBiayaKegiatanModel({
    required int idRincianBiayaKegiatan,
    required int idUsulan,
    required String namaBiayaKegiatan,
    required int kuantiti,
    required int hargaSatuan,
    required int total,
    required String keterangan,
  }) : super(
    idRincianBiayaKegiatan: idRincianBiayaKegiatan,
    idUsulan: idUsulan,
    namaBiayaKegiatan: namaBiayaKegiatan,
    kuantiti: kuantiti,
    hargaSatuan: hargaSatuan,
    total: total,
    keterangan: keterangan,
  );

  factory RincianBiayaKegiatanModel.fromJson(Map<String, dynamic> json) {
    return RincianBiayaKegiatanModel(
      idRincianBiayaKegiatan: json['idRincianBiayaKegiatan'],
      idUsulan: json['idUsulan'],
      namaBiayaKegiatan: json['namaBiayaKegiatan'],
      kuantiti: json['kuantiti'],
      hargaSatuan: json['hargaSatuan'],
      total: json['total'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRincianBiayaKegiatan': idRincianBiayaKegiatan,
      'idUsulan': idUsulan,
      'namaBiayaKegiatan': namaBiayaKegiatan,
      'kuantiti': kuantiti,
      'hargaSatuan': hargaSatuan,
      'total': total,
      'keterangan': keterangan,
    };
  }
}
