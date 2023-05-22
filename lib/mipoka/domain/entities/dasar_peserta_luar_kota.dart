import 'package:equatable/equatable.dart';

class DataPesertaLuarKota extends Equatable {
  final int nimNip;
  final String namaLengkap;
  final int nik;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final String peran;
  final String dasarPengiriman;

  const DataPesertaLuarKota({
    required this.nimNip,
    required this.namaLengkap,
    required this.nik,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.peran,
    required this.dasarPengiriman,
  });

  @override
  List<Object?> get props => [
    nimNip,
    namaLengkap,
    nik,
    tempatLahir,
    tanggalLahir,
    peran,
    dasarPengiriman,
  ];
}