import 'package:equatable/equatable.dart';

class Usulan extends Equatable {
  final int idUsulan;
  final int idUser;
  final int idOrmawa;
  final String sumberDana;
  final String namaKegiatan;
  final String bentukKegiatanA;
  final String deskripsiKegiatan;
  final DateTime waktuKegiatan;
  final String tempatKegiatan;
  final String keberangkatan;
  final String kepulangan;
  final int jumlahPeserta;
  final String targetKegiatanA;
  final String totalDana;
  final int idPratisipan;
  final int idRincian;
  final String ketuaOrmawa;
  final String pembina;
  final String latarBelakang;
  final String tujuanKegiatan;
  final String manfaatKegiatan;
  final String bentukKegiatan;
  final String targetKegiatan;
  final String waktuTempat;
  final int idPanitiaPeserta;
  final String tertibAcara;
  final String rencanaAnggaran;
  final String perlengkapan;
  final String penutup;
  final int idLampiran;
  final String status;
  final String roles;
  final String file;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String updatedBy;

  Usulan({
    required this.idUsulan,
    required this.idUser,
    required this.idOrmawa,
    required this.sumberDana,
    required this.namaKegiatan,
    required this.bentukKegiatanA,
    required this.deskripsiKegiatan,
    required this.waktuKegiatan,
    required this.tempatKegiatan,
    required this.keberangkatan,
    required this.kepulangan,
    required this.jumlahPeserta,
    required this.targetKegiatanA,
    required this.totalDana,
    required this.idPratisipan,
    required this.idRincian,
    required this.ketuaOrmawa,
    required this.pembina,
    required this.latarBelakang,
    required this.tujuanKegiatan,
    required this.manfaatKegiatan,
    required this.bentukKegiatan,
    required this.targetKegiatan,
    required this.waktuTempat,
    required this.idPanitiaPeserta,
    required this.tertibAcara,
    required this.rencanaAnggaran,
    required this.perlengkapan,
    required this.penutup,
    required this.idLampiran,
    required this.status,
    required this.roles,
    required this.file,
    required this.updatedAt,
    required this.createdAt,
    required this.updatedBy,
  });

  @override
  List<Object?> get props =>
      [
        idUsulan,
        idUser,
        idOrmawa,
        sumberDana,
        namaKegiatan,
        bentukKegiatanA,
        deskripsiKegiatan,
        waktuKegiatan,
        tempatKegiatan,
        keberangkatan,
        kepulangan,
        jumlahPeserta,
        targetKegiatanA,
        totalDana,
        idPratisipan,
        idRincian,
        ketuaOrmawa,
        pembina,
        latarBelakang,
        tujuanKegiatan,
        manfaatKegiatan,
        bentukKegiatan,
        targetKegiatan,
        waktuTempat,
        idPanitiaPeserta,
        tertibAcara,
        rencanaAnggaran,
        perlengkapan,
        penutup,
        idLampiran,
        status,
        roles,
        file,
        updatedAt,
        createdAt,
        updatedBy,
      ];

  factory Usulan.fromJson(Map<String, dynamic> json) {
    return Usulan(
      idUsulan: json['id_usulan'],
      idUser: json['id_user'],
      idOrmawa: json['id_ormawa'],
      sumberDana: json['sumber_dana'],
      namaKegiatan: json['nama_kegiatan'],
      bentukKegiatanA: json['bentuk_kegiatanA'],
      deskripsiKegiatan: json['deskripsi_kegiatan'],
      waktuKegiatan: DateTime.parse(json['waktu_kegiatan']),
      tempatKegiatan: json['tempat_kegiatan'],
      keberangkatan: json['keberangkatan'],
      kepulangan: json['kepulangan'],
      jumlahPeserta: json['jumlah_peserta'],
      targetKegiatanA: json['target_kegiatanA'],
      totalDana: json['total_dana'],
      idPratisipan: json['id_pratisipan'],
      idRincian: json['id_rincian'],
      ketuaOrmawa: json['ketua_ormawa'],
      pembina: json['pembina'],
      latarBelakang: json['latar_belakang'],
      tujuanKegiatan: json['tujuan_kegiatan'],
      manfaatKegiatan: json['manfaat_kegiatan'],
      bentukKegiatan: json['bentuk_kegiatan'],
      targetKegiatan: json['target_kegiatan'],
      waktuTempat: json['waktu_tempat'],
      idPanitiaPeserta: json['id_panitia_peserta'],
      tertibAcara: json['tertib_acara'],
      rencanaAnggaran: json['rencana_anggaran'],
      perlengkapan: json['perlengkapan'],
      penutup: json['penutup'],
      idLampiran: json['id_lampiran'],
      status: json['status'],
      roles: json['roles'],
      file: json['file'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedBy: json['updated_by'],
    );
  }
}
