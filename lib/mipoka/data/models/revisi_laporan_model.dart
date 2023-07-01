import 'package:mipoka/mipoka/domain/entities/revisi_laporan.dart';

class RevisiLaporanModel extends RevisiLaporan{
  const RevisiLaporanModel({
    required super.idRevisiLaporan,
    required super.idAdmin,
    required super.idLaporan,
    required super.idUsulan,
    required super.revisiPencapaian,
    required super.revisiPesertaKegiatanLaporan,
    required super.revisiBiayaKegiatan,
    required super.revisiLatarBelakang,
    required super.revisiHasilKegiatan,
    required super.revisiPenutup,
    required super.revisiFotoPostinganKegiatan,
    required super.revisiFotoDokumentasiKegiatan,
    required super.revisiFotoTabulasiHasil,
    required super.revisiFotoFakturPembayaran,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory RevisiLaporanModel.fromEntity(RevisiLaporan revisiLaporan) {
    return RevisiLaporanModel(
      idRevisiLaporan: revisiLaporan.idRevisiLaporan,
      idAdmin: revisiLaporan.idAdmin,
      idLaporan: revisiLaporan.idLaporan,
      idUsulan: revisiLaporan.idUsulan,
      revisiPencapaian: revisiLaporan.revisiPencapaian,
      revisiPesertaKegiatanLaporan: revisiLaporan.revisiPesertaKegiatanLaporan,
      revisiBiayaKegiatan: revisiLaporan.revisiBiayaKegiatan,
      revisiLatarBelakang: revisiLaporan.revisiLatarBelakang,
      revisiHasilKegiatan: revisiLaporan.revisiHasilKegiatan,
      revisiPenutup: revisiLaporan.revisiPenutup,
      revisiFotoPostinganKegiatan: revisiLaporan.revisiFotoPostinganKegiatan,
      revisiFotoDokumentasiKegiatan: revisiLaporan.revisiFotoDokumentasiKegiatan,
      revisiFotoTabulasiHasil: revisiLaporan.revisiFotoTabulasiHasil,
      revisiFotoFakturPembayaran: revisiLaporan.revisiFotoFakturPembayaran,
      createdAt: revisiLaporan.createdAt,
      createdBy: revisiLaporan.createdBy,
      updatedAt: revisiLaporan.updatedAt,
      updatedBy: revisiLaporan.updatedBy,
    );
  }

  factory RevisiLaporanModel.fromJson(Map<String, dynamic> json) => RevisiLaporanModel(
    idRevisiLaporan: json["id_revisi_laporan"],
    idAdmin: json["id_admin"],
    idLaporan: json["id_laporan"],
    idUsulan: json["id_usulan"],
    revisiPencapaian: json["revisi_pencapaian"],
    revisiPesertaKegiatanLaporan: json["revisi_peserta_kegiatan_laporan"],
    revisiBiayaKegiatan: json["revisi_biaya_kegiatan"],
    revisiLatarBelakang: json["revisi_latar_belakang"],
    revisiHasilKegiatan: json["revisi_hasil_kegiatan"],
    revisiPenutup: json["revisi_penutup"],
    revisiFotoPostinganKegiatan: json["revisi_foto_postingan_kegiatan"],
    revisiFotoDokumentasiKegiatan: json["revisi_foto_dokumentasi_kegiatan"],
    revisiFotoTabulasiHasil: json["revisi_foto_tabulasi_hasil"],
    revisiFotoFakturPembayaran: json["revisi_foto_faktur_pembayaran"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_revisi_laporan": idRevisiLaporan,
    "id_admin": idAdmin,
    "id_laporan": idLaporan,
    "id_usulan": idUsulan,
    "revisi_pencapaian": revisiPencapaian,
    "revisi_peserta_kegiatan_laporan": revisiPesertaKegiatanLaporan,
    "revisi_biaya_kegiatan": revisiBiayaKegiatan,
    "revisi_latar_belakang": revisiLatarBelakang,
    "revisi_hasil_kegiatan": revisiHasilKegiatan,
    "revisi_penutup": revisiPenutup,
    "revisi_foto_postingan_kegiatan": revisiFotoPostinganKegiatan,
    "revisi_foto_dokumentasi_kegiatan": revisiFotoDokumentasiKegiatan,
    "revisi_foto_tabulasi_hasil": revisiFotoTabulasiHasil,
    "revisi_foto_faktur_pembayaran": revisiFotoFakturPembayaran,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}