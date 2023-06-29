import 'package:mipoka/mipoka/data/models/peserta_kegiatan_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';

class LaporanModel extends Laporan {
  final List<PesertaKegiatanLaporanModel> pesertaKegiatanLaporanModel;
  final List<RincianBiayaKegiatanModel> rincianBiayaKegiatanModel;

  const LaporanModel({
    required super.idLaporan,
    required super.idOrmawa,
    required super.idUser,
    required super.idUsulan,
    required super.pencapaian,
    required this.pesertaKegiatanLaporanModel,
    required this.rincianBiayaKegiatanModel,
    required super.totalUsulan,
    required super.totalRealisasi,
    required super.totalSelisih,
    required super.latarBelakang,
    required super.hasilKegiatan,
    required super.penutup,
    required super.fotoPostinganKegiatan,
    required super.fotoDokumentasiKegiatan,
    required super.fotoTabulasiHasil,
    required super.fotoFakturPembayaran,
    required super.fileLaporanKegiatan,
    required super.validasiPembina,
    required super.statusLaporan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  }) : super(
    pesertaKegiatanLaporan: pesertaKegiatanLaporanModel,
    rincianBiayaKegiatan: rincianBiayaKegiatanModel
  );

  factory LaporanModel.fromEntity(Laporan laporan) {
    return LaporanModel(
      idLaporan: laporan.idLaporan,
      idOrmawa: laporan.idOrmawa,
      idUser: laporan.idUser,
      idUsulan: laporan.idUsulan,
      pencapaian: laporan.pencapaian,
      pesertaKegiatanLaporanModel: laporan.pesertaKegiatanLaporan.map((pesertaKegiatanLaporan) =>
          PesertaKegiatanLaporanModel.fromEntity(pesertaKegiatanLaporan)).toList(),
      rincianBiayaKegiatanModel: laporan.rincianBiayaKegiatan.map((rincianBiayaKegiatan) =>
          RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)).toList(),
      totalUsulan: laporan.totalUsulan,
      totalRealisasi: laporan.totalRealisasi,
      totalSelisih: laporan.totalSelisih,
      latarBelakang: laporan.latarBelakang,
      hasilKegiatan: laporan.hasilKegiatan,
      penutup: laporan.penutup,
      fotoPostinganKegiatan: laporan.fotoPostinganKegiatan,
      fotoDokumentasiKegiatan: laporan.fotoDokumentasiKegiatan,
      fotoTabulasiHasil: laporan.fotoTabulasiHasil,
      fotoFakturPembayaran: laporan.fotoFakturPembayaran,
      fileLaporanKegiatan: laporan.fileLaporanKegiatan,
      validasiPembina: laporan.validasiPembina,
      statusLaporan: laporan.statusLaporan,
      createdAt: laporan.createdAt,
      createdBy: laporan.createdBy,
      updatedAt: laporan.updatedAt,
      updatedBy: laporan.updatedBy,
    );
  }

  factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
    idLaporan: json["id_laporan"],
    idOrmawa: json["id_ormawa"],
    idUser: json["id_user"],
    idUsulan: json["id_usulan"],
    pencapaian: json["pencapaian"],
    pesertaKegiatanLaporanModel: List<PesertaKegiatanLaporanModel>.from(json["peserta_kegiatan_laporan"].map((x) => PesertaKegiatanLaporanModel.fromJson(x))),
    rincianBiayaKegiatanModel: List<RincianBiayaKegiatanModel>.from(json["rincian_biaya_kegiatan"].map((x) => RincianBiayaKegiatanModel.fromJson(x))),
    totalUsulan: json["total_usulan"],
    totalRealisasi: json["total_realisasi"],
    totalSelisih: json["total_selisih"],
    latarBelakang: json["latar_belakang"],
    hasilKegiatan: json["hasil_kegiatan"],
    penutup: json["penutup"],
    fotoPostinganKegiatan: json["foto_postingan_kegiatan"],
    fotoDokumentasiKegiatan: List<String>.from(json["foto_dokumentasi_kegiatan"].map((x) => x)),
    fotoTabulasiHasil: json["foto_tabulasi_hasil"],
    fotoFakturPembayaran: json["foto_faktur_pembayaran"],
    fileLaporanKegiatan: json["file_laporan_kegiatan"],
    validasiPembina: json["validasi_pembina"],
    statusLaporan: json["status_laporan"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_laporan": idLaporan,
    "id_ormawa": idOrmawa,
    "id_user": idUser,
    "id_usulan": idUsulan,
    "pencapaian": pencapaian,
    "peserta_kegiatan_laporan": List<dynamic>.from(pesertaKegiatanLaporanModel.map((x) => x.toJson())),
    "biaya_kegiatan": List<dynamic>.from(rincianBiayaKegiatanModel.map((x) => x.toJson())),
    "total_usulan": totalUsulan,
    "total_realisasi": totalRealisasi,
    "total_selisih": totalSelisih,
    "latar_belakang": latarBelakang,
    "hasil_kegiatan": hasilKegiatan,
    "penutup": penutup,
    "foto_postingan_kegiatan": fotoPostinganKegiatan,
    "foto_dokumentasi_kegiatan": List<dynamic>.from(fotoDokumentasiKegiatan.map((x) => x)),
    "foto_tabulasi_hasil": fotoTabulasiHasil,
    "foto_faktur_pembayaran": fotoFakturPembayaran,
    "file_laporan_kegiatan": fileLaporanKegiatan,
    "validasi_pembina": validasiPembina,
    "status_laporan": statusLaporan,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}