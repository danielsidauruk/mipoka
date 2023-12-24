import 'package:equatable/equatable.dart';

class JenisKegiatanMpt extends Equatable {
  final int idJenisKegiatanMpt;
  final String namaJenisKegiatanMpt;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const JenisKegiatanMpt({
    required this.idJenisKegiatanMpt,
    required this.namaJenisKegiatanMpt,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  JenisKegiatanMpt copyWith({
    int? idJenisKegiatanMpt,
    String? namaJenisKegiatanMpt,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      JenisKegiatanMpt(
        idJenisKegiatanMpt: idJenisKegiatanMpt ?? this.idJenisKegiatanMpt,
        namaJenisKegiatanMpt: namaJenisKegiatanMpt ?? this.namaJenisKegiatanMpt,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idJenisKegiatanMpt,
    namaJenisKegiatanMpt,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
