import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';

class PartisipanArgs {
  final int index;
  final UsulanKegiatan usulanKegiatan;

  PartisipanArgs({
    required this.index,
    required this.usulanKegiatan,
  });
}

class BiayaKegiatanArgs {
  final int index;
  final UsulanKegiatan usulanKegiatan;

  BiayaKegiatanArgs({
    required this.index,
    required this.usulanKegiatan,
  });
}

class TertibAcaraArgs {
  final int index;
  final UsulanKegiatan usulanKegiatan;

  TertibAcaraArgs({
    required this.index,
    required this.usulanKegiatan,
  });
}

class RincianBiayaKegiatanArgs {
  final int index;
  final Laporan laporan;

  RincianBiayaKegiatanArgs({
    required this.index,
    required this.laporan,
  });
}

class UsulanArgs {
  final int idUsulan;
  final bool isRevisiUsulan;

  UsulanArgs({
    required this.idUsulan,
    this.isRevisiUsulan = false,
  });
}

class LaporanArgs {
  final int idLaporan;
  final bool isRevisiLaporan;

  LaporanArgs({
    required this.idLaporan,
    this.isRevisiLaporan = false,
  });
}
