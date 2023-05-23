import 'package:equatable/equatable.dart';

class DataPesertaDalamKota extends Equatable {
  final int nimNip;
  final String namaLengkap;
  final String peran;
  final String dasarPengiriman;

  const DataPesertaDalamKota({
    required this.nimNip,
    required this.namaLengkap,
    required this.peran,
    required this.dasarPengiriman,
  });

  @override
  List<Object?> get props => [
    nimNip,
    namaLengkap,
    peran,
    dasarPengiriman,
  ];
}