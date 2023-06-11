import 'package:equatable/equatable.dart';

class PanitiaPesertaL extends Equatable {
  final int idPanitiaPesertaL;
  final int idLaporan;
  final String jenisMahasiswa;
  final String nim;
  final String namaLengkap;
  final String prodi;
  final String peran;

  const PanitiaPesertaL({
    required this.idPanitiaPesertaL,
    required this.idLaporan,
    required this.jenisMahasiswa,
    required this.nim,
    required this.namaLengkap,
    required this.prodi,
    required this.peran,
  });

  @override
  List<Object?> get props => [
    idPanitiaPesertaL,
    idLaporan,
    jenisMahasiswa,
    nim,
    namaLengkap,
    prodi,
    peran,
  ];
}
