import 'package:equatable/equatable.dart';

class Partisipan extends Equatable {
  final int idPeserta;
  final int idUsulan;
  final String nim;
  final String namaLengkap;
  final String nik;
  final String tempatLahir;
  final String tanggalLahir;
  final String peran;
  final String dasarKirim;

  const Partisipan({
    required this.idPeserta,
    required this.idUsulan,
    required this.nim,
    required this.namaLengkap,
    required this.nik,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.peran,
    required this.dasarKirim,
  });

  @override
  List<Object?> get props => [
    idPeserta,
    idUsulan,
    nim,
    namaLengkap,
    nik,
    tempatLahir,
    tanggalLahir,
    peran,
    dasarKirim,
  ];
}
