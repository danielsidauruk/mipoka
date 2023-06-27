import 'package:mipoka/mipoka/domain/entities/revisi_usulan.dart';

class RevisiUsulanModel extends RevisiUsulan {
  RevisiUsulanModel({
    required super.idRevisiUsulan,
    required super.idAdmin,
    required super.idUsulan,
    required super.revisiPembiayaan,
    required super.revisiNamaKegiatan,
    required super.revisiBentukKegiatan,
    required super.revisiKategoriBentukKegiatan,
    required super.revisiDeskripsiKegiatan,
    required super.revisiTanggalMulaiKegiatan,
    required super.revisiTanggalSelesaiKegiatan,
    required super.revisiWaktuMulaiKegiatan,
    required super.revisiWaktuSelesaiKegiatan,
    required super.revisiTanggalKeberangkatan,
    required super.revisiTanggalKepulangan,
    required super.revisiJumlahPartisipan,
    required super.revisiKategoriJumlahPartisipan,
    required super.revisiTargetKegiatan,
    required super.revisiTotalPendanaan,
    required super.revisiKategoriTotalPendanaan,
    required super.revisiKeterangan,
    required super.revisiTandaTanganOrmawa,
    required super.revisiIdPartisipan,
    required super.revisiIdRincianBiayaKegiatan,
    required super.revisiLatarBelakang,
    required super.revisiTujuanKegiatan,
    required super.revisiManfaatKegiatan,
    required super.revisiBentukPelaksanaanKegiatan,
    required super.revisiTargetPencapaianKegiatan,
    required super.revisiWaktuDanTempatPelaksanaan,
    required super.revisiRencanaAnggaranKegiatan,
    required super.revisiIdTertibAcara,
    required super.revisiPerlengkapanDanPeralatan,
    required super.revisiPenutup,
    required super.revisiFotoPostinganKegiatan,
    required super.revisiFotoSuratUndanganKegiatan,
    required super.revisiFotoLinimasaKegiatan,
    required super.revisiFotoTempatKegiatan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  static RevisiUsulanModel fromEntity(RevisiUsulan revisiUsulan) {
    return RevisiUsulanModel(
      idRevisiUsulan: revisiUsulan.idRevisiUsulan,
      idAdmin: revisiUsulan.idAdmin,
      idUsulan: revisiUsulan.idUsulan,
      revisiPembiayaan: revisiUsulan.revisiPembiayaan,
      revisiNamaKegiatan: revisiUsulan.revisiNamaKegiatan,
      revisiBentukKegiatan: revisiUsulan.revisiBentukKegiatan,
      revisiKategoriBentukKegiatan: revisiUsulan.revisiKategoriBentukKegiatan,
      revisiDeskripsiKegiatan: revisiUsulan.revisiDeskripsiKegiatan,
      revisiTanggalMulaiKegiatan: revisiUsulan.revisiTanggalMulaiKegiatan,
      revisiTanggalSelesaiKegiatan: revisiUsulan.revisiTanggalSelesaiKegiatan,
      revisiWaktuMulaiKegiatan: revisiUsulan.revisiWaktuMulaiKegiatan,
      revisiWaktuSelesaiKegiatan: revisiUsulan.revisiWaktuSelesaiKegiatan,
      revisiTanggalKeberangkatan: revisiUsulan.revisiTanggalKeberangkatan,
      revisiTanggalKepulangan: revisiUsulan.revisiTanggalKepulangan,
      revisiJumlahPartisipan: revisiUsulan.revisiJumlahPartisipan,
      revisiKategoriJumlahPartisipan: revisiUsulan.revisiKategoriJumlahPartisipan,
      revisiTargetKegiatan: revisiUsulan.revisiTargetKegiatan,
      revisiTotalPendanaan: revisiUsulan.revisiTotalPendanaan,
      revisiKategoriTotalPendanaan: revisiUsulan.revisiKategoriTotalPendanaan,
      revisiKeterangan: revisiUsulan.revisiKeterangan,
      revisiTandaTanganOrmawa: revisiUsulan.revisiTandaTanganOrmawa,
      revisiIdPartisipan: revisiUsulan.revisiIdPartisipan,
      revisiIdRincianBiayaKegiatan: revisiUsulan.revisiIdRincianBiayaKegiatan,
      revisiLatarBelakang: revisiUsulan.revisiLatarBelakang,
      revisiTujuanKegiatan: revisiUsulan.revisiTujuanKegiatan,
      revisiManfaatKegiatan: revisiUsulan.revisiManfaatKegiatan,
      revisiBentukPelaksanaanKegiatan: revisiUsulan.revisiBentukPelaksanaanKegiatan,
      revisiTargetPencapaianKegiatan: revisiUsulan.revisiTargetPencapaianKegiatan,
      revisiWaktuDanTempatPelaksanaan: revisiUsulan.revisiWaktuDanTempatPelaksanaan,
      revisiRencanaAnggaranKegiatan: revisiUsulan.revisiRencanaAnggaranKegiatan,
      revisiIdTertibAcara: revisiUsulan.revisiIdTertibAcara,
      revisiPerlengkapanDanPeralatan: revisiUsulan.revisiPerlengkapanDanPeralatan,
      revisiPenutup: revisiUsulan.revisiPenutup,
      revisiFotoPostinganKegiatan: revisiUsulan.revisiFotoPostinganKegiatan,
      revisiFotoSuratUndanganKegiatan: revisiUsulan.revisiFotoSuratUndanganKegiatan,
      revisiFotoLinimasaKegiatan: revisiUsulan.revisiFotoLinimasaKegiatan,
      revisiFotoTempatKegiatan: revisiUsulan.revisiFotoTempatKegiatan,
      createdAt: revisiUsulan.createdAt,
      createdBy: revisiUsulan.createdBy,
      updatedAt: revisiUsulan.updatedAt,
      updatedBy: revisiUsulan.updatedBy,
    );
  }

  factory RevisiUsulanModel.fromJson(Map<String, dynamic> json) => RevisiUsulanModel(
    idRevisiUsulan: json["id_revisi_usulan"],
    idAdmin: json["id_admin"],
    idUsulan: json["id_usulan"],
    revisiPembiayaan: json["revisi_pembiayaan"],
    revisiNamaKegiatan: json["revisi_nama_kegiatan"],
    revisiBentukKegiatan: json["revisi_bentuk_kegiatan"],
    revisiKategoriBentukKegiatan: json["revisi_kategori_bentuk_kegiatan"],
    revisiDeskripsiKegiatan: json["revisi_deskripsi_kegiatan"],
    revisiTanggalMulaiKegiatan: json["revisi_tanggal_mulai_kegiatan"],
    revisiTanggalSelesaiKegiatan: json["revisi_tanggal_selesai_kegiatan"],
    revisiWaktuMulaiKegiatan: json["revisi_waktu_mulai_kegiatan"],
    revisiWaktuSelesaiKegiatan: json["revisi_waktu_selesai_kegiatan"],
    revisiTanggalKeberangkatan: json["revisi_tanggal_keberangkatan"],
    revisiTanggalKepulangan: json["revisi_tanggal_kepulangan"],
    revisiJumlahPartisipan: json["revisi_jumlah_partisipan"],
    revisiKategoriJumlahPartisipan: json["revisi_kategori_jumlah_partisipan"],
    revisiTargetKegiatan: json["revisi_target_kegiatan"],
    revisiTotalPendanaan: json["revisi_total_pendanaan"],
    revisiKategoriTotalPendanaan: json["revisi_kategori_total_pendanaan"],
    revisiKeterangan: json["revisi_keterangan"],
    revisiTandaTanganOrmawa: json["revisi_tanda_tangan_ormawa"],
    revisiIdPartisipan: List<String>.from(json["revisi_id_partisipan"].map((x) => x)),
    revisiIdRincianBiayaKegiatan: List<String>.from(json["revisi_id_rincian_biaya_kegiatan"].map((x) => x)),
    revisiLatarBelakang: json["revisi_latar_belakang"],
    revisiTujuanKegiatan: json["revisi_tujuan_kegiatan"],
    revisiManfaatKegiatan: json["revisi_manfaat_kegiatan"],
    revisiBentukPelaksanaanKegiatan: json["revisi_bentuk_pelaksanaan_kegiatan"],
    revisiTargetPencapaianKegiatan: json["revisi_target_pencapaian_kegiatan"],
    revisiWaktuDanTempatPelaksanaan: json["revisi_waktu_dan_tempat_pelaksanaan"],
    revisiRencanaAnggaranKegiatan: json["revisi_rencana_anggaran_kegiatan"],
    revisiIdTertibAcara: json["revisi_id_tertib_acara"],
    revisiPerlengkapanDanPeralatan: json["revisi_perlengkapan_dan_peralatan"],
    revisiPenutup: json["revisi_penutup"],
    revisiFotoPostinganKegiatan: json["revisi_foto_postingan_kegiatan"],
    revisiFotoSuratUndanganKegiatan: json["revisi_foto_surat_undangan_kegiatan"],
    revisiFotoLinimasaKegiatan: json["revisi_foto_linimasa_kegiatan"],
    revisiFotoTempatKegiatan: List<String>.from(json["revisi_foto_tempat_kegiatan"].map((x) => x)),
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_revisi_usulan": idRevisiUsulan,
    "id_admin": idAdmin,
    "id_usulan": idUsulan,
    "revisi_pembiayaan": revisiPembiayaan,
    "revisi_nama_kegiatan": revisiNamaKegiatan,
    "revisi_bentuk_kegiatan": revisiBentukKegiatan,
    "revisi_kategori_bentuk_kegiatan": revisiKategoriBentukKegiatan,
    "revisi_deskripsi_kegiatan": revisiDeskripsiKegiatan,
    "revisi_tanggal_mulai_kegiatan": revisiTanggalMulaiKegiatan,
    "revisi_tanggal_selesai_kegiatan": revisiTanggalSelesaiKegiatan,
    "revisi_waktu_mulai_kegiatan": revisiWaktuMulaiKegiatan,
    "revisi_waktu_selesai_kegiatan": revisiWaktuSelesaiKegiatan,
    "revisi_tanggal_keberangkatan": revisiTanggalKeberangkatan,
    "revisi_tanggal_kepulangan": revisiTanggalKepulangan,
    "revisi_jumlah_partisipan": revisiJumlahPartisipan,
    "revisi_kategori_jumlah_partisipan": revisiKategoriJumlahPartisipan,
    "revisi_target_kegiatan": revisiTargetKegiatan,
    "revisi_total_pendanaan": revisiTotalPendanaan,
    "revisi_kategori_total_pendanaan": revisiKategoriTotalPendanaan,
    "revisi_keterangan": revisiKeterangan,
    "revisi_tanda_tangan_ormawa": revisiTandaTanganOrmawa,
    "revisi_id_partisipan": List<dynamic>.from(revisiIdPartisipan.map((x) => x)),
    "revisi_id_rincian_biaya_kegiatan": List<dynamic>.from(revisiIdRincianBiayaKegiatan.map((x) => x)),
    "revisi_latar_belakang": revisiLatarBelakang,
    "revisi_tujuan_kegiatan": revisiTujuanKegiatan,
    "revisi_manfaat_kegiatan": revisiManfaatKegiatan,
    "revisi_bentuk_pelaksanaan_kegiatan": revisiBentukPelaksanaanKegiatan,
    "revisi_target_pencapaian_kegiatan": revisiTargetPencapaianKegiatan,
    "revisi_waktu_dan_tempat_pelaksanaan": revisiWaktuDanTempatPelaksanaan,
    "revisi_rencana_anggaran_kegiatan": revisiRencanaAnggaranKegiatan,
    "revisi_id_tertib_acara": revisiIdTertibAcara,
    "revisi_perlengkapan_dan_peralatan": revisiPerlengkapanDanPeralatan,
    "revisi_penutup": revisiPenutup,
    "revisi_foto_postingan_kegiatan": revisiFotoPostinganKegiatan,
    "revisi_foto_surat_undangan_kegiatan": revisiFotoSuratUndanganKegiatan,
    "revisi_foto_linimasa_kegiatan": revisiFotoLinimasaKegiatan,
    "revisi_foto_tempat_kegiatan": List<dynamic>.from(revisiFotoTempatKegiatan.map((x) => x)),
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}