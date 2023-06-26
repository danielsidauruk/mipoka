import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';

class Laporan extends Equatable {
  final int idLaporan;
  final int idOrmawa;
  final String idUser;
  final int idUsulan;
  final String pencapaian;
  final List<PesertaKegiatanLaporan> pesertaKegiatanLaporan;
  final List<RincianBiayaKegiatan> rincianBiayaKegiatan;
  final String latarBelakang;
  final String hasilKegiatan;
  final String penutup;
  final String fotoPostinganKegiatan;
  final List<String> fotoDokumentasiKegiatan;
  final String fotoTabulasiHasil;
  final String fotoFakturPembayaran;
  final String fileLaporanKegiatan;
  final bool validasiPembina;
  final String statusLaporan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Laporan({
    required this.idLaporan,
    required this.idOrmawa,
    required this.idUser,
    required this.idUsulan,
    required this.pencapaian,
    required this.pesertaKegiatanLaporan,
    required this.rincianBiayaKegiatan,
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
    int? idOrmawa,
    String? idUser,
    int? idUsulan,
    String? pencapaian,
    List<PesertaKegiatanLaporan>? pesertaKegiatanLaporan,
    List<RincianBiayaKegiatan>? rincianBiayaKegiatan,
    String? latarBelakang,
    String? hasilKegiatan,
    String? penutup,
    String? fotoPostinganKegiatan,
    List<String>? fotoDokumentasiKegiatan,
    String? fotoTabulasiHasil,
    String? fotoFakturPembayaran,
    String? fileLaporanKegiatan,
    bool? validasiPembina,
    String? statusLaporan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Laporan(
        idLaporan: idLaporan ?? this.idLaporan,
        idOrmawa: idOrmawa ?? this.idOrmawa,
        idUser: idUser ?? this.idUser,
        idUsulan: idUsulan ?? this.idUsulan,
        pencapaian: pencapaian ?? this.pencapaian,
        pesertaKegiatanLaporan: pesertaKegiatanLaporan ?? this.pesertaKegiatanLaporan,
        rincianBiayaKegiatan: rincianBiayaKegiatan ?? this.rincianBiayaKegiatan,
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
    idOrmawa,
    idUser,
    idUsulan,
    pencapaian,
    pesertaKegiatanLaporan,
    rincianBiayaKegiatan,
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