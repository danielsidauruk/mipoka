import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
    namaBiayaKegiatan,
    qty,
    hargaSatuan,
    total,
    keterangan,
  ];
}
