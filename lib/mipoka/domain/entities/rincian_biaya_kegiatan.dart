import 'package:equatable/equatable.dart';

class RincianBiayaKegiatan extends Equatable{
  final int idBiayaKegiatan;
  final String idLaporan;
  final String namaBiaya;
  final String keterangan;
  final int kuantitas;
  final int hargaSatuan;
  final int usulanAnggaran;
  final int realisasiAnggaran;
  final int selisih;
  final int totalUsulan;
  final int totalRealisasi;
  final int totalSelisih;

  const RincianBiayaKegiatan({
    required this.idBiayaKegiatan,
    required this.idLaporan,
    required this.namaBiaya,
    required this.keterangan,
    required this.kuantitas,
    required this.hargaSatuan,
    required this.usulanAnggaran,
    required this.realisasiAnggaran,
    required this.selisih,
    required this.totalUsulan,
    required this.totalRealisasi,
    required this.totalSelisih,
  });

  RincianBiayaKegiatan copyWith({
    int? idBiayaKegiatan,
    String? idLaporan,
    String? namaBiaya,
    String? keterangan,
    int? kuantitas,
    int? hargaSatuan,
    int? usulanAnggaran,
    int? realisasiAnggaran,
    int? selisih,
    int? totalUsulan,
    int? totalRealisasi,
    int? totalSelisih,
  }) =>
      RincianBiayaKegiatan(
        idBiayaKegiatan: idBiayaKegiatan ?? this.idBiayaKegiatan,
        idLaporan: idLaporan ?? this.idLaporan,
        namaBiaya: namaBiaya ?? this.namaBiaya,
        keterangan: keterangan ?? this.keterangan,
        kuantitas: kuantitas ?? this.kuantitas,
        hargaSatuan: hargaSatuan ?? this.hargaSatuan,
        usulanAnggaran: usulanAnggaran ?? this.usulanAnggaran,
        realisasiAnggaran: realisasiAnggaran ?? this.realisasiAnggaran,
        selisih: selisih ?? this.selisih,
        totalUsulan: totalUsulan ?? this.totalUsulan,
        totalRealisasi: totalRealisasi ?? this.totalRealisasi,
        totalSelisih: totalSelisih ?? this.totalSelisih,
      );

  @override
  List<Object?> get props => [
    idBiayaKegiatan,
    idLaporan,
    namaBiaya,
    keterangan,
    kuantitas,
    hargaSatuan,
    usulanAnggaran,
    realisasiAnggaran,
    selisih,
    totalUsulan,
    totalRealisasi,
    totalSelisih,
  ];
}
