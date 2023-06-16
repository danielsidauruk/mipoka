import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';

class BiayaKegiatan extends Equatable {
  final String namaBiayaKegiatan;
  final int qty;
  final int hargaSatuan;
  final int total;
  final String keterangan;

  const BiayaKegiatan({
    required this.namaBiayaKegiatan,
    required this.qty,
    required this.hargaSatuan,
    required this.total,
    required this.keterangan,
  });

  BiayaKegiatan updateWith({
    String? namaBiayaKegiatan,
    int? qty,
    int? hargaSatuan,
    int? total,
    String? keterangan,
  }) {
    return BiayaKegiatan(
      namaBiayaKegiatan: namaBiayaKegiatan ?? this.namaBiayaKegiatan,
      qty: qty ?? this.qty,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      total: total ?? this.total,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object?> get props => [
    namaBiayaKegiatan,
    qty,
    hargaSatuan,
    total,
    keterangan,
  ];
}
