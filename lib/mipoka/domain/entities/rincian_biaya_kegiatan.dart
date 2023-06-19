import 'package:equatable/equatable.dart';

// Just updated
class RincianBiayaKegiatan extends Equatable {
  final int idRincianBiayaKegiatan;
  final String namaBiayaKegiatan;
  final int kuantiti;
  final int hargaSatuan;
  final int total;
  final String keterangan;

  const RincianBiayaKegiatan({
    required this.idRincianBiayaKegiatan,
    required this.namaBiayaKegiatan,
    required this.kuantiti,
    required this.hargaSatuan,
    required this.total,
    required this.keterangan,
  });

  RincianBiayaKegiatan copyWith({
    int? idRincianBiayaKegiatan,
    String? namaBiayaKegiatan,
    int? kuantiti,
    int? hargaSatuan,
    int? total,
    String? keterangan,
  }) =>
      RincianBiayaKegiatan(
        idRincianBiayaKegiatan: idRincianBiayaKegiatan ?? this.idRincianBiayaKegiatan,
        namaBiayaKegiatan: namaBiayaKegiatan ?? this.namaBiayaKegiatan,
        kuantiti: kuantiti ?? this.kuantiti,
        hargaSatuan: hargaSatuan ?? this.hargaSatuan,
        total: total ?? this.total,
        keterangan: keterangan ?? this.keterangan,
      );

  @override
  List<Object?> get props => [
    idRincianBiayaKegiatan,
    namaBiayaKegiatan,
    kuantiti,
    hargaSatuan,
    total,
    keterangan,
  ];
}