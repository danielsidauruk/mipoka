import 'package:equatable/equatable.dart';

class PanitiaPesertaLaporan extends Equatable {
  final int idPanitiaPesertaLaporan;
  final int idLaporan;
  final String jenisMahasiswa;
  final String nim;
  final String namaLengkap;
  final String prodi;
  final String peran;

  const PanitiaPesertaLaporan({
    required this.idPanitiaPesertaLaporan,
    required this.idLaporan,
    required this.jenisMahasiswa,
    required this.nim,
    required this.namaLengkap,
    required this.prodi,
    required this.peran,
  });

  @override
  List<Object?> get props => [
    idPanitiaPesertaLaporan,
    idLaporan,
    jenisMahasiswa,
    nim,
    namaLengkap,
    prodi,
    peran,
  ];
}
