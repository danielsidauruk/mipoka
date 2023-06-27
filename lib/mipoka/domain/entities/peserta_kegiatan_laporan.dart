import 'package:equatable/equatable.dart';

class PesertaKegiatanLaporan extends Equatable {
  final int idPesertaKegiatanLaporan;
  final String nim;
  final String namaLengkap;
  final String peran;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const PesertaKegiatanLaporan({
    required this.idPesertaKegiatanLaporan,
    required this.nim,
    required this.namaLengkap,
    required this.peran,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  PesertaKegiatanLaporan copyWith({
    int? idPesertaKegiatanLaporan,
    String? nim,
    String? namaLengkap,
    String? peran,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      PesertaKegiatanLaporan(
        idPesertaKegiatanLaporan: idPesertaKegiatanLaporan ?? this.idPesertaKegiatanLaporan,
        nim: nim ?? this.nim,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        peran: peran ?? this.peran,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idPesertaKegiatanLaporan,
    nim,
    namaLengkap,
    peran,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
