import 'package:equatable/equatable.dart';

class RevisiLaporan extends Equatable {
  final int idRevisiLaporan;
  final String idAdmin;
  final int idLaporan;
  final int idUsulan;
  final String revisiPencapaian;
  final String revisiPesertaKegiatanLaporan;
  final String revisiBiayaKegiatan;
  final String revisiLatarBelakang;
  final String revisiHasilKegiatan;
  final String revisiPenutup;
  final String revisiFotoPostinganKegiatan;
  final String revisiFotoDokumentasiKegiatan;
  final String revisiFotoTabulasiHasil;
  final String revisiFotoFakturPembayaran;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const RevisiLaporan({
    required this.idRevisiLaporan,
    required this.idAdmin,
    required this.idLaporan,
    required this.idUsulan,
    required this.revisiPencapaian,
    required this.revisiPesertaKegiatanLaporan,
    required this.revisiBiayaKegiatan,
    required this.revisiLatarBelakang,
    required this.revisiHasilKegiatan,
    required this.revisiPenutup,
    required this.revisiFotoPostinganKegiatan,
    required this.revisiFotoDokumentasiKegiatan,
    required this.revisiFotoTabulasiHasil,
    required this.revisiFotoFakturPembayaran,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  RevisiLaporan copyWith({
    int? idRevisiLaporan,
    String? idAdmin,
    int? idLaporan,
    int? idUsulan,
    String? revisiPencapaian,
    String? revisiPesertaKegiatanLaporan,
    String? revisiBiayaKegiatan,
    String? revisiLatarBelakang,
    String? revisiHasilKegiatan,
    String? revisiPenutup,
    String? revisiFotoPostinganKegiatan,
    String? revisiFotoDokumentasiKegiatan,
    String? revisiFotoTabulasiHasil,
    String? revisiFotoFakturPembayaran,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RevisiLaporan(
        idRevisiLaporan: idRevisiLaporan ?? this.idRevisiLaporan,
        idAdmin: idAdmin ?? this.idAdmin,
        idLaporan: idLaporan ?? this.idLaporan,
        idUsulan: idUsulan ?? this.idUsulan,
        revisiPencapaian: revisiPencapaian ?? this.revisiPencapaian,
        revisiPesertaKegiatanLaporan: revisiPesertaKegiatanLaporan ?? this.revisiPesertaKegiatanLaporan,
        revisiBiayaKegiatan: revisiBiayaKegiatan ?? this.revisiBiayaKegiatan,
        revisiLatarBelakang: revisiLatarBelakang ?? this.revisiLatarBelakang,
        revisiHasilKegiatan: revisiHasilKegiatan ?? this.revisiHasilKegiatan,
        revisiPenutup: revisiPenutup ?? this.revisiPenutup,
        revisiFotoPostinganKegiatan: revisiFotoPostinganKegiatan ?? this.revisiFotoPostinganKegiatan,
        revisiFotoDokumentasiKegiatan: revisiFotoDokumentasiKegiatan ?? this.revisiFotoDokumentasiKegiatan,
        revisiFotoTabulasiHasil: revisiFotoTabulasiHasil ?? this.revisiFotoTabulasiHasil,
        revisiFotoFakturPembayaran: revisiFotoFakturPembayaran ?? this.revisiFotoFakturPembayaran,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idRevisiLaporan,
    idAdmin,
    idLaporan,
    idUsulan,
    revisiPencapaian,
    revisiPesertaKegiatanLaporan,
    revisiBiayaKegiatan,
    revisiLatarBelakang,
    revisiHasilKegiatan,
    revisiPenutup,
    revisiFotoPostinganKegiatan,
    revisiFotoDokumentasiKegiatan,
    revisiFotoTabulasiHasil,
    revisiFotoFakturPembayaran,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
