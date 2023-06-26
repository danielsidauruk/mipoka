import 'package:equatable/equatable.dart';

class RevisiUsulan extends Equatable{
  final int idRevisiUsulan;
  final int idAdmin;
  final int idUsulan;
  final String revisiPembiayaan;
  final String revisiNamaKegiatan;
  final String revisiBentukKegiatan;
  final String revisiKategoriBentukKegiatan;
  final String revisiDeskripsiKegiatan;
  final String revisiTanggalMulaiKegiatan;
  final String revisiTanggalSelesaiKegiatan;
  final String revisiWaktuMulaiKegiatan;
  final String revisiWaktuSelesaiKegiatan;
  final String revisiTanggalKeberangkatan;
  final String revisiTanggalKepulangan;
  final int revisiJumlahPartisipan;
  final String revisiKategoriJumlahPartisipan;
  final String revisiTargetKegiatan;
  final int revisiTotalPendanaan;
  final String revisiKategoriTotalPendanaan;
  final String revisiKeterangan;
  final String revisiTandaTanganOrmawa;
  final List<String> revisiIdPartisipan;
  final List<String> revisiIdRincianBiayaKegiatan;
  final String revisiLatarBelakang;
  final String revisiTujuanKegiatan;
  final String revisiManfaatKegiatan;
  final String revisiBentukPelaksanaanKegiatan;
  final String revisiTargetPencapaianKegiatan;
  final String revisiWaktuDanTempatPelaksanaan;
  final String revisiRencanaAnggaranKegiatan;
  final String revisiIdTertibAcara;
  final String revisiPerlengkapanDanPeralatan;
  final String revisiPenutup;
  final String revisiFotoPostinganKegiatan;
  final String revisiFotoSuratUndanganKegiatan;
  final String revisiFotoLinimasaKegiatan;
  final List<String> revisiFotoTempatKegiatan;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  RevisiUsulan({
    required this.idRevisiUsulan,
    required this.idAdmin,
    required this.idUsulan,
    required this.revisiPembiayaan,
    required this.revisiNamaKegiatan,
    required this.revisiBentukKegiatan,
    required this.revisiKategoriBentukKegiatan,
    required this.revisiDeskripsiKegiatan,
    required this.revisiTanggalMulaiKegiatan,
    required this.revisiTanggalSelesaiKegiatan,
    required this.revisiWaktuMulaiKegiatan,
    required this.revisiWaktuSelesaiKegiatan,
    required this.revisiTanggalKeberangkatan,
    required this.revisiTanggalKepulangan,
    required this.revisiJumlahPartisipan,
    required this.revisiKategoriJumlahPartisipan,
    required this.revisiTargetKegiatan,
    required this.revisiTotalPendanaan,
    required this.revisiKategoriTotalPendanaan,
    required this.revisiKeterangan,
    required this.revisiTandaTanganOrmawa,
    required this.revisiIdPartisipan,
    required this.revisiIdRincianBiayaKegiatan,
    required this.revisiLatarBelakang,
    required this.revisiTujuanKegiatan,
    required this.revisiManfaatKegiatan,
    required this.revisiBentukPelaksanaanKegiatan,
    required this.revisiTargetPencapaianKegiatan,
    required this.revisiWaktuDanTempatPelaksanaan,
    required this.revisiRencanaAnggaranKegiatan,
    required this.revisiIdTertibAcara,
    required this.revisiPerlengkapanDanPeralatan,
    required this.revisiPenutup,
    required this.revisiFotoPostinganKegiatan,
    required this.revisiFotoSuratUndanganKegiatan,
    required this.revisiFotoLinimasaKegiatan,
    required this.revisiFotoTempatKegiatan,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  RevisiUsulan copyWith({
    int? idRevisiUsulan,
    int? idAdmin,
    int? idUsulan,
    String? revisiPembiayaan,
    String? revisiNamaKegiatan,
    String? revisiBentukKegiatan,
    String? revisiKategoriBentukKegiatan,
    String? revisiDeskripsiKegiatan,
    String? revisiTanggalMulaiKegiatan,
    String? revisiTanggalSelesaiKegiatan,
    String? revisiWaktuMulaiKegiatan,
    String? revisiWaktuSelesaiKegiatan,
    String? revisiTanggalKeberangkatan,
    String? revisiTanggalKepulangan,
    int? revisiJumlahPartisipan,
    String? revisiKategoriJumlahPartisipan,
    String? revisiTargetKegiatan,
    int? revisiTotalPendanaan,
    String? revisiKategoriTotalPendanaan,
    String? revisiKeterangan,
    String? revisiTandaTanganOrmawa,
    List<String>? revisiIdPartisipan,
    List<String>? revisiIdRincianBiayaKegiatan,
    String? revisiLatarBelakang,
    String? revisiTujuanKegiatan,
    String? revisiManfaatKegiatan,
    String? revisiBentukPelaksanaanKegiatan,
    String? revisiTargetPencapaianKegiatan,
    String? revisiWaktuDanTempatPelaksanaan,
    String? revisiRencanaAnggaranKegiatan,
    String? revisiIdTertibAcara,
    String? revisiPerlengkapanDanPeralatan,
    String? revisiPenutup,
    String? revisiFotoPostinganKegiatan,
    String? revisiFotoSuratUndanganKegiatan,
    String? revisiFotoLinimasaKegiatan,
    List<String>? revisiFotoTempatKegiatan,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RevisiUsulan(
        idRevisiUsulan: idRevisiUsulan ?? this.idRevisiUsulan,
        idAdmin: idAdmin ?? this.idAdmin,
        idUsulan: idUsulan ?? this.idUsulan,
        revisiPembiayaan: revisiPembiayaan ?? this.revisiPembiayaan,
        revisiNamaKegiatan: revisiNamaKegiatan ?? this.revisiNamaKegiatan,
        revisiBentukKegiatan: revisiBentukKegiatan ?? this.revisiBentukKegiatan,
        revisiKategoriBentukKegiatan: revisiKategoriBentukKegiatan ?? this.revisiKategoriBentukKegiatan,
        revisiDeskripsiKegiatan: revisiDeskripsiKegiatan ?? this.revisiDeskripsiKegiatan,
        revisiTanggalMulaiKegiatan: revisiTanggalMulaiKegiatan ?? this.revisiTanggalMulaiKegiatan,
        revisiTanggalSelesaiKegiatan: revisiTanggalSelesaiKegiatan ?? this.revisiTanggalSelesaiKegiatan,
        revisiWaktuMulaiKegiatan: revisiWaktuMulaiKegiatan ?? this.revisiWaktuMulaiKegiatan,
        revisiWaktuSelesaiKegiatan: revisiWaktuSelesaiKegiatan ?? this.revisiWaktuSelesaiKegiatan,
        revisiTanggalKeberangkatan: revisiTanggalKeberangkatan ?? this.revisiTanggalKeberangkatan,
        revisiTanggalKepulangan: revisiTanggalKepulangan ?? this.revisiTanggalKepulangan,
        revisiJumlahPartisipan: revisiJumlahPartisipan ?? this.revisiJumlahPartisipan,
        revisiKategoriJumlahPartisipan: revisiKategoriJumlahPartisipan ?? this.revisiKategoriJumlahPartisipan,
        revisiTargetKegiatan: revisiTargetKegiatan ?? this.revisiTargetKegiatan,
        revisiTotalPendanaan: revisiTotalPendanaan ?? this.revisiTotalPendanaan,
        revisiKategoriTotalPendanaan: revisiKategoriTotalPendanaan ?? this.revisiKategoriTotalPendanaan,
        revisiKeterangan: revisiKeterangan ?? this.revisiKeterangan,
        revisiTandaTanganOrmawa: revisiTandaTanganOrmawa ?? this.revisiTandaTanganOrmawa,
        revisiIdPartisipan: revisiIdPartisipan ?? this.revisiIdPartisipan,
        revisiIdRincianBiayaKegiatan: revisiIdRincianBiayaKegiatan ?? this.revisiIdRincianBiayaKegiatan,
        revisiLatarBelakang: revisiLatarBelakang ?? this.revisiLatarBelakang,
        revisiTujuanKegiatan: revisiTujuanKegiatan ?? this.revisiTujuanKegiatan,
        revisiManfaatKegiatan: revisiManfaatKegiatan ?? this.revisiManfaatKegiatan,
        revisiBentukPelaksanaanKegiatan: revisiBentukPelaksanaanKegiatan ?? this.revisiBentukPelaksanaanKegiatan,
        revisiTargetPencapaianKegiatan: revisiTargetPencapaianKegiatan ?? this.revisiTargetPencapaianKegiatan,
        revisiWaktuDanTempatPelaksanaan: revisiWaktuDanTempatPelaksanaan ?? this.revisiWaktuDanTempatPelaksanaan,
        revisiRencanaAnggaranKegiatan: revisiRencanaAnggaranKegiatan ?? this.revisiRencanaAnggaranKegiatan,
        revisiIdTertibAcara: revisiIdTertibAcara ?? this.revisiIdTertibAcara,
        revisiPerlengkapanDanPeralatan: revisiPerlengkapanDanPeralatan ?? this.revisiPerlengkapanDanPeralatan,
        revisiPenutup: revisiPenutup ?? this.revisiPenutup,
        revisiFotoPostinganKegiatan: revisiFotoPostinganKegiatan ?? this.revisiFotoPostinganKegiatan,
        revisiFotoSuratUndanganKegiatan: revisiFotoSuratUndanganKegiatan ?? this.revisiFotoSuratUndanganKegiatan,
        revisiFotoLinimasaKegiatan: revisiFotoLinimasaKegiatan ?? this.revisiFotoLinimasaKegiatan,
        revisiFotoTempatKegiatan: revisiFotoTempatKegiatan ?? this.revisiFotoTempatKegiatan,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idRevisiUsulan,
    idAdmin,
    idUsulan,
    revisiPembiayaan,
    revisiNamaKegiatan,
    revisiBentukKegiatan,
    revisiKategoriBentukKegiatan,
    revisiDeskripsiKegiatan,
    revisiTanggalMulaiKegiatan,
    revisiTanggalSelesaiKegiatan,
    revisiWaktuMulaiKegiatan,
    revisiWaktuSelesaiKegiatan,
    revisiTanggalKeberangkatan,
    revisiTanggalKepulangan,
    revisiJumlahPartisipan,
    revisiKategoriJumlahPartisipan,
    revisiTargetKegiatan,
    revisiTotalPendanaan,
    revisiKategoriTotalPendanaan,
    revisiKeterangan,
    revisiTandaTanganOrmawa,
    revisiIdPartisipan,
    revisiIdRincianBiayaKegiatan,
    revisiLatarBelakang,
    revisiTujuanKegiatan,
    revisiManfaatKegiatan,
    revisiBentukPelaksanaanKegiatan,
    revisiTargetPencapaianKegiatan,
    revisiWaktuDanTempatPelaksanaan,
    revisiRencanaAnggaranKegiatan,
    revisiIdTertibAcara,
    revisiPerlengkapanDanPeralatan,
    revisiPenutup,
    revisiFotoPostinganKegiatan,
    revisiFotoSuratUndanganKegiatan,
    revisiFotoLinimasaKegiatan,
    revisiFotoTempatKegiatan,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
