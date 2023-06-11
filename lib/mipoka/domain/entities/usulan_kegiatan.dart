import 'package:equatable/equatable.dart';

class UsulanKegiatan extends Equatable {
  final int idUsulan;
  final int idUser;
  final int idOrmawa;
  final String pembiayaan;
  final String namaKegiatan;
  final String bentukKegiatanA;
  final String deskripsiKegiatan;
  final DateTime tanggalMulaiKegiatan;
  final DateTime tanggalSelesaiKegiatan;
  final DateTime waktuMulaiKegiatan;
  final DateTime waktuSelesaiKegiatan;
  final String tempatKegiatan;
  final DateTime tanggalKeberangkatan;
  final DateTime tanggalKepulangan;
  final int jumlahPartisipan;
  final String targetKegiatan;
  final int totalPendana;
  final String tandaTanganOrmawa;
  final int idPartisipan;
  final int idRincianBiayaKegiatan;
  final String ketuaOrmawa;
  final String pembina;
  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String bentukPelaksanaanKegiatan;
  final String targetPencapaianKegiatan;
  final String waktuDanTempatPelaksanaan;
  final String rencanaAnggaranKegiatan;
  final int idPanitiaPeserta;
  final int idTertibAcara;
  final String perlengkapan;
  final String penutup;
  final int idLampiran;
  final String status;
  final String validasiPembina;
  final String roles;
  final String file;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String updatedBy;

  UsulanKegiatan({
    required this.idUsulan,
    required this.idUser,
    required this.idOrmawa,
    required this.pembiayaan,
    required this.namaKegiatan,
    required this.bentukKegiatanA,
    required this.deskripsiKegiatan,
    required this.tanggalMulaiKegiatan,
    required this.tanggalSelesaiKegiatan,
    required this.waktuMulaiKegiatan,
    required this.waktuSelesaiKegiatan,
    required this.tempatKegiatan,
    required this.tanggalKeberangkatan,
    required this.tanggalKepulangan,
    required this.jumlahPartisipan,
    required this.targetKegiatan,
    required this.totalPendana,
    required this.tandaTanganOrmawa,
    required this.idPartisipan,
    required this.idRincianBiayaKegiatan,
    required this.ketuaOrmawa,
    required this.pembina,
    required this.latarBelakang,
    required this.tujuanKegiatan,
    required this.manfaatKegiatan,
    required this.bentukPelaksanaanKegiatan,
    required this.targetPencapaianKegiatan,
    required this.waktuDanTempatPelaksanaan,
    required this.rencanaAnggaranKegiatan,
    required this.idPanitiaPeserta,
    required this.idTertibAcara,
    required this.perlengkapan,
    required this.penutup,
    required this.idLampiran,
    required this.status,
    required this.validasiPembina,
    required this.roles,
    required this.file,
    required this.updatedAt,
    required this.createdAt,
    required this.updatedBy,
  });

  @override
  List<Object?> get props => [
    idUsulan,
    idUser,
    idOrmawa,
    pembiayaan,
    namaKegiatan,
    bentukKegiatanA,
    deskripsiKegiatan,
    tanggalMulaiKegiatan,
    tanggalSelesaiKegiatan,
    waktuMulaiKegiatan,
    waktuSelesaiKegiatan,
    tempatKegiatan,
    tanggalKeberangkatan,
    tanggalKepulangan,
    jumlahPartisipan,
    targetKegiatan,
    totalPendana,
    tandaTanganOrmawa,
    idPartisipan,
    idRincianBiayaKegiatan,
    ketuaOrmawa,
    pembina,
    latarBelakang,
    tujuanKegiatan,
    manfaatKegiatan,
    bentukPelaksanaanKegiatan,
    targetPencapaianKegiatan,
    waktuDanTempatPelaksanaan,
    rencanaAnggaranKegiatan,
    idPanitiaPeserta,
    idTertibAcara,
    perlengkapan,
    penutup,
    idLampiran,
    status,
    validasiPembina,
    roles,
    file,
    updatedAt,
    createdAt,
    updatedBy,
  ];
}
