import 'package:equatable/equatable.dart';

class Prestasi extends Equatable {
  final int idPrestasi;
  final String nim;
  final String namaLengkap;
  final String kegiatan;
  final String tingkat;
  final String prestasiDicapai;

  const Prestasi({
    required this.idPrestasi,
    required this.nim,
    required this.namaLengkap,
    required this.kegiatan,
    required this.tingkat,
    required this.prestasiDicapai,
  });

  @override
  List<Object?> get props => [
    idPrestasi,
    nim,
    namaLengkap,
    kegiatan,
    tingkat,
    prestasiDicapai,
  ];
}
