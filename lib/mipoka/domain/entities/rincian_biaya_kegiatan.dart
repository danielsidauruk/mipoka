import 'package:equatable/equatable.dart';

class RincianBiayaKegiatan extends Equatable {
  final int idRincianBiayaKegiatan;
  final int idUsulan;
  final String namaBiayaKegiatan;
  final int kuantiti;
  final int hargaSatuan;
  final int total;
  final String keterangan;

  const RincianBiayaKegiatan({
    required this.idRincianBiayaKegiatan,
    required this.idUsulan,
    required this.namaBiayaKegiatan,
    required this.kuantiti,
    required this.hargaSatuan,
    required this.total,
    required this.keterangan,
  });

  RincianBiayaKegiatan copyWith({
    int? idRincianBiayaKegiatan,
    int? idUsulan,
    String? namaBiayaKegiatan,
    int? kuantiti,
    int? hargaSatuan,
    int? total,
    String? keterangan,
  }) {
    return RincianBiayaKegiatan(
      idRincianBiayaKegiatan: idRincianBiayaKegiatan ?? this.idRincianBiayaKegiatan,
      idUsulan: idUsulan ?? this.idUsulan,
      namaBiayaKegiatan: namaBiayaKegiatan ?? this.namaBiayaKegiatan,
      kuantiti: kuantiti ?? this.kuantiti,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      total: total ?? this.total,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  @override
  List<Object?> get props => [
    idRincianBiayaKegiatan,
    idUsulan,
    namaBiayaKegiatan,
    kuantiti,
    hargaSatuan,
    total,
    keterangan,
  ];
}
