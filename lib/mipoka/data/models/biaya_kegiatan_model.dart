import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';

class BiayaKegiatanModel extends BiayaKegiatan {
  const BiayaKegiatanModel({
    required String namaBiayaKegiatan,
    required int qty,
    required int hargaSatuan,
    required int total,
    required String keterangan,
  }) : super(
    namaBiayaKegiatan: namaBiayaKegiatan,
    qty: qty,
    hargaSatuan: hargaSatuan,
    total: total,
    keterangan: keterangan,
  );

  factory BiayaKegiatanModel.fromJson(Map<String, dynamic> json) {
    return BiayaKegiatanModel(
      namaBiayaKegiatan: json['namaBiayaKegiatan'] as String,
      qty: json['qty'] as int,
      hargaSatuan: json['hargaSatuan'] as int,
      total: json['total'] as int,
      keterangan: json['keterangan'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaBiayaKegiatan': namaBiayaKegiatan,
      'qty': qty,
      'hargaSatuan': hargaSatuan,
      'total': total,
      'keterangan': keterangan,
    };
  }
}
