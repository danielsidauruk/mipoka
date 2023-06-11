import 'package:equatable/equatable.dart';

class RincianLaporan extends Equatable {
  final int idRincianLaporan;
  final int idLaporan;
  final String keteranganA;
  final int qty;
  final int satuan;
  final int usulanAnggaran;
  final int realisasiAnggaran;
  final int selisih;

  const RincianLaporan({
    required this.idRincianLaporan,
    required this.idLaporan,
    required this.keteranganA,
    required this.qty,
    required this.satuan,
    required this.usulanAnggaran,
    required this.realisasiAnggaran,
    required this.selisih,
  });

  @override
  List<Object?> get props => [
    idRincianLaporan,
    idLaporan,
    keteranganA,
    qty,
    satuan,
    usulanAnggaran,
    realisasiAnggaran,
    selisih,
  ];
}