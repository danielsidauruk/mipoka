import 'package:equatable/equatable.dart';

class NamaKegiatanMpt extends Equatable{
  final int idNamaKegiatanMpt;
  final int idJenisKegiatanMpt;
  final String namaKegiatan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const NamaKegiatanMpt({
    required this.idNamaKegiatanMpt,
    required this.idJenisKegiatanMpt,
    required this.namaKegiatan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  NamaKegiatanMpt copyWith({
    int? idNamaKegiatanMpt,
    int? idJenisKegiatanMpt,
    String? namaKegiatan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      NamaKegiatanMpt(
        idNamaKegiatanMpt: idNamaKegiatanMpt ?? this.idNamaKegiatanMpt,
        idJenisKegiatanMpt: idJenisKegiatanMpt ?? this.idJenisKegiatanMpt,
        namaKegiatan: namaKegiatan ?? this.namaKegiatan,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idNamaKegiatanMpt,
    idJenisKegiatanMpt,
    namaKegiatan,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
