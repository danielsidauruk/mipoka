import 'package:equatable/equatable.dart';

// Just updated 26 / 06 / 2023
class BiayaKegiatan extends Equatable {
  final int idBiayaKegiatan;
  final String namaBiayaKegiatan;
  final int kuantiti;
  final int hargaSatuan;
  final int total;
  final String keterangan;

  const BiayaKegiatan({
    required this.idBiayaKegiatan,
    required this.namaBiayaKegiatan,
    required this.kuantiti,
    required this.hargaSatuan,
    required this.total,
    required this.keterangan,
  });

  BiayaKegiatan copyWith({
    int? idBiayaKegiatan,
    String? namaBiayaKegiatan,
    int? kuantiti,
    int? hargaSatuan,
    int? total,
    String? keterangan,
  }) {
    return BiayaKegiatan(
      idBiayaKegiatan: idBiayaKegiatan ?? this.idBiayaKegiatan,
      namaBiayaKegiatan: namaBiayaKegiatan ?? this.namaBiayaKegiatan,
      kuantiti: kuantiti ?? this.kuantiti,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      total: total ?? this.total,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object?> get props => [
    idBiayaKegiatan,
    namaBiayaKegiatan,
    kuantiti,
    hargaSatuan,
    total,
    keterangan,
  ];
}