import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';

class Laporan extends Equatable {
  final int idLaporan;
  final RevisiLaporan revisiLaporan;
  final UsulanKegiatan usulanKegiatan;
  final String pencapaian;
  final List<PesertaKegiatanLaporan> pesertaKegiatanLaporan;
  final List<RincianBiayaKegiatan> rincianBiayaKegiatan;
  final int totalUsulan;
  final int totalRealisasi;
  final int totalSelisih;
  final String latarBelakang;
  final String hasilKegiatan;
  final String penutup;
  final String fotoPostinganKegiatan;
  final List<String> fotoDokumentasiKegiatan;
  final String fotoTabulasiHasil;
  final String fotoFakturPembayaran;
  final String fileLaporanKegiatan;
  final String validasiPembina;
  final String statusLaporan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Laporan({
    required this.idLaporan,
    required this.revisiLaporan,
    required this.usulanKegiatan,
    required this.pencapaian,
    required this.pesertaKegiatanLaporan,
    required this.rincianBiayaKegiatan,
    required this.totalUsulan,
    required this.totalRealisasi,
    required this.totalSelisih,
    required this.latarBelakang,
    required this.hasilKegiatan,
    required this.penutup,
    required this.fotoPostinganKegiatan,
    required this.fotoDokumentasiKegiatan,
    required this.fotoTabulasiHasil,
    required this.fotoFakturPembayaran,
    required this.fileLaporanKegiatan,
    required this.validasiPembina,
    required this.statusLaporan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Laporan copyWith({
    int? idLaporan,
    RevisiLaporan? revisiLaporan,
    UsulanKegiatan? usulanKegiatan,
    String? pencapaian,
    List<PesertaKegiatanLaporan>? pesertaKegiatanLaporan,
    List<RincianBiayaKegiatan>? rincianBiayaKegiatan,
    int? totalUsulan,
    int? totalRealisasi,
    int? totalSelisih,
    String? latarBelakang,
    String? hasilKegiatan,
    String? penutup,
    String? fotoPostinganKegiatan,
    List<String>? fotoDokumentasiKegiatan,
    String? fotoTabulasiHasil,
    String? fotoFakturPembayaran,
    String? fileLaporanKegiatan,
    String? validasiPembina,
    String? statusLaporan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Laporan(
        idLaporan: idLaporan ?? this.idLaporan,
        revisiLaporan: revisiLaporan ?? this.revisiLaporan,
        usulanKegiatan: usulanKegiatan ?? this.usulanKegiatan,
        pencapaian: pencapaian ?? this.pencapaian,
        pesertaKegiatanLaporan: pesertaKegiatanLaporan ?? this.pesertaKegiatanLaporan,
        rincianBiayaKegiatan: rincianBiayaKegiatan ?? this.rincianBiayaKegiatan,
        totalUsulan: totalUsulan ?? this.totalUsulan,
        totalRealisasi: totalRealisasi ?? this.totalRealisasi,
        totalSelisih: totalSelisih ?? this.totalSelisih,
        latarBelakang: latarBelakang ?? this.latarBelakang,
        hasilKegiatan: hasilKegiatan ?? this.hasilKegiatan,
        penutup: penutup ?? this.penutup,
        fotoPostinganKegiatan: fotoPostinganKegiatan ?? this.fotoPostinganKegiatan,
        fotoDokumentasiKegiatan: fotoDokumentasiKegiatan ?? this.fotoDokumentasiKegiatan,
        fotoTabulasiHasil: fotoTabulasiHasil ?? this.fotoTabulasiHasil,
        fotoFakturPembayaran: fotoFakturPembayaran ?? this.fotoFakturPembayaran,
        fileLaporanKegiatan: fileLaporanKegiatan ?? this.fileLaporanKegiatan,
        validasiPembina: validasiPembina ?? this.validasiPembina,
        statusLaporan: statusLaporan ?? this.statusLaporan,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idLaporan,
    revisiLaporan,
    usulanKegiatan,
    pencapaian,
    pesertaKegiatanLaporan,
    rincianBiayaKegiatan,
    totalUsulan,
    totalRealisasi,
    totalSelisih,
    latarBelakang,
    hasilKegiatan,
    penutup,
    fotoPostinganKegiatan,
    fotoDokumentasiKegiatan,
    fotoTabulasiHasil,
    fotoFakturPembayaran,
    fileLaporanKegiatan,
    validasiPembina,
    statusLaporan,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}