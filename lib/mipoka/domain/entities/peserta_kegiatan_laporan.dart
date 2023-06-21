import 'package:equatable/equatable.dart';

// => Just Updated
class PesertaKegiatanLaporan extends Equatable {
  final int idPesertaKegiatanLaporan;
  final String nim;
  final String namaLengkap;
  final String peran;

  const PesertaKegiatanLaporan({
    required this.idPesertaKegiatanLaporan,
    required this.nim,
    required this.namaLengkap,
    required this.peran,
  });

  PesertaKegiatanLaporan copyWith({
    int? idPesertaKegiatanLaporan,
    String? nim,
    String? namaLengkap,
    String? peran,
  }) =>
      PesertaKegiatanLaporan(
        idPesertaKegiatanLaporan: idPesertaKegiatanLaporan ?? this.idPesertaKegiatanLaporan,
        nim: nim ?? this.nim,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        peran: peran ?? this.peran,
      );

  @override
  List<Object?> get props => [
    idPesertaKegiatanLaporan,
    nim,
    namaLengkap,
    peran,
  ];
}