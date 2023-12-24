import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/jenis_kegiatan_mpt.dart';

class NamaKegiatanMpt extends Equatable{
  final int idNamaKegiatanMpt;
  final JenisKegiatanMpt jenisKegiatanMpt;
  final String namaKegiatan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const NamaKegiatanMpt({
    required this.idNamaKegiatanMpt,
    required this.jenisKegiatanMpt,
    required this.namaKegiatan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  NamaKegiatanMpt copyWith({
    int? idNamaKegiatanMpt,
    JenisKegiatanMpt? jenisKegiatanMpt,
    String? namaKegiatan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      NamaKegiatanMpt(
        idNamaKegiatanMpt: idNamaKegiatanMpt ?? this.idNamaKegiatanMpt,
        jenisKegiatanMpt: jenisKegiatanMpt ?? this.jenisKegiatanMpt,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idNamaKegiatanMpt,
    jenisKegiatanMpt,
    namaKegiatan,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
