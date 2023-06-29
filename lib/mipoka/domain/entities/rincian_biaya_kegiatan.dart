import 'package:equatable/equatable.dart';

class RincianBiayaKegiatan extends Equatable {
  final int idRincianBiayaKegiatan;
  final String namaBiaya;
  final String keterangan;
  final int kuantitas;
  final int hargaSatuan;
  final int usulanAnggaran;
  final int realisasiAnggaran;
  final int selisih;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const RincianBiayaKegiatan({
    required this.idRincianBiayaKegiatan,
    required this.namaBiaya,
    required this.keterangan,
    required this.kuantitas,
    required this.hargaSatuan,
    required this.usulanAnggaran,
    required this.realisasiAnggaran,
    required this.selisih,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  RincianBiayaKegiatan copyWith({
    int? idRincianBiayaKegiatan,
    String? namaBiaya,
    String? keterangan,
    int? kuantitas,
    int? hargaSatuan,
    int? usulanAnggaran,
    int? realisasiAnggaran,
    int? selisih,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RincianBiayaKegiatan(
        idRincianBiayaKegiatan: idRincianBiayaKegiatan ?? this.idRincianBiayaKegiatan,
        namaBiaya: namaBiaya ?? this.namaBiaya,
        keterangan: keterangan ?? this.keterangan,
        kuantitas: kuantitas ?? this.kuantitas,
        hargaSatuan: hargaSatuan ?? this.hargaSatuan,
        usulanAnggaran: usulanAnggaran ?? this.usulanAnggaran,
        realisasiAnggaran: realisasiAnggaran ?? this.realisasiAnggaran,
        selisih: selisih ?? this.selisih,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idRincianBiayaKegiatan,
    namaBiaya,
    keterangan,
    kuantitas,
    hargaSatuan,
    usulanAnggaran,
    realisasiAnggaran,
    selisih,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
