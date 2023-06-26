import 'package:equatable/equatable.dart';

// Just updated 26 / 06 / 2023
class BiayaKegiatan extends Equatable {
  final int idBiayaKegiatan;
  final String namaBiayaKegiatan;
  final int kuantiti;
  final int hargaSatuan;
  final int total;
  final String keterangan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;


  const BiayaKegiatan({
    required this.idBiayaKegiatan,
    required this.namaBiayaKegiatan,
    required this.kuantiti,
    required this.hargaSatuan,
    required this.total,
    required this.keterangan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  BiayaKegiatan copyWith({
    int? idBiayaKegiatan,
    String? namaBiayaKegiatan,
    int? kuantiti,
    int? hargaSatuan,
    int? total,
    String? keterangan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) {
    return BiayaKegiatan(
      idBiayaKegiatan: idBiayaKegiatan ?? this.idBiayaKegiatan,
      namaBiayaKegiatan: namaBiayaKegiatan ?? this.namaBiayaKegiatan,
      kuantiti: kuantiti ?? this.kuantiti,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      total: total ?? this.total,
      keterangan: keterangan ?? this.keterangan,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedBy: updatedBy ?? this.updatedBy,
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
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}