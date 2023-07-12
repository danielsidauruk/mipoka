import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';

class UsulanKegiatanModel extends UsulanKegiatan {

  final MipokaUserModel userModel;
  final OrmawaModel ormawaModel;
  final List<PartisipanModel> partisipanModel;
  final List<BiayaKegiatanModel> biayaKegiatanModel;
  final List<TertibAcaraModel> tertibAcaraModel;

  const UsulanKegiatanModel({
    required super.idUsulan,
    required this.userModel,
    required this.ormawaModel,
    required super.pembiayaan,
    required super.namaKegiatan,
    required super.bentukKegiatan,
    required super.kategoriBentukKegiatan,
    required super.deskripsiKegiatan,
    required super.tanggalMulaiKegiatan,
    required super.tanggalSelesaiKegiatan,
    required super.waktuMulaiKegiatan,
    required super.waktuSelesaiKegiatan,
    required super.tempatKegiatan,
    required super.tanggalKeberangkatan,
    required super.tanggalKepulangan,
    required super.jumlahPartisipan,
    required super.kategoriJumlahPartisipan,
    required super.targetKegiatan,
    required super.totalPendanaan,
    required super.kategoriTotalPendanaan,
    required super.keterangan,
    required super.tandaTanganOrmawa,
    required this.partisipanModel,
    required this.biayaKegiatanModel,
    required super.totalBiaya,
    required super.latarBelakang,
    required super.tujuanKegiatan,
    required super.manfaatKegiatan,
    required super.bentukPelaksanaanKegiatan,
    required super.targetPencapaianKegiatan,
    required super.waktuDanTempatPelaksanaan,
    required super.rencanaAnggaranKegiatan,
    required this.tertibAcaraModel,
    required super.perlengkapanDanPeralatan,
    required super.penutup,
    required super.fotoPostinganKegiatan,
    required super.fotoSuratUndanganKegiatan,
    required super.fotoLinimasaKegiatan,
    required super.fotoTempatKegiatan,
    required super.fileUsulanKegiatan,
    required super.validasiPembina,
    required super.tandaTanganPembina,
    required super.statusUsulan,
    required super.roles,
    required super.createdAt,
    required super.updatedAt,
    required super.createdBy,
    required super.updatedBy,
  }) : super(
    partisipan: partisipanModel,
    biayaKegiatan: biayaKegiatanModel,
    tertibAcara: tertibAcaraModel,
    user: userModel,
    ormawa: ormawaModel,
  );

  factory UsulanKegiatanModel.fromEntity(UsulanKegiatan usulanKegiatan) {
    return UsulanKegiatanModel(
      idUsulan: usulanKegiatan.idUsulan,
      userModel: MipokaUserModel.fromEntity(usulanKegiatan.user),
      ormawaModel: OrmawaModel.fromEntity(usulanKegiatan.ormawa),
      pembiayaan: usulanKegiatan.pembiayaan,
      namaKegiatan: usulanKegiatan.namaKegiatan,
      bentukKegiatan: usulanKegiatan.bentukKegiatan,
      kategoriBentukKegiatan: usulanKegiatan.kategoriBentukKegiatan,
      deskripsiKegiatan: usulanKegiatan.deskripsiKegiatan,
      tanggalMulaiKegiatan: usulanKegiatan.tanggalMulaiKegiatan,
      tanggalSelesaiKegiatan: usulanKegiatan.tanggalSelesaiKegiatan,
      waktuMulaiKegiatan: usulanKegiatan.waktuMulaiKegiatan,
      waktuSelesaiKegiatan: usulanKegiatan.waktuSelesaiKegiatan,
      tempatKegiatan: usulanKegiatan.tempatKegiatan,
      tanggalKeberangkatan: usulanKegiatan.tanggalKeberangkatan,
      tanggalKepulangan: usulanKegiatan.tanggalKepulangan,
      jumlahPartisipan: usulanKegiatan.jumlahPartisipan,
      kategoriJumlahPartisipan: usulanKegiatan.kategoriJumlahPartisipan,
      targetKegiatan: usulanKegiatan.targetKegiatan,
      totalPendanaan: usulanKegiatan.totalPendanaan,
      kategoriTotalPendanaan: usulanKegiatan.kategoriTotalPendanaan,
      keterangan: usulanKegiatan.keterangan,
      tandaTanganOrmawa: usulanKegiatan.tandaTanganOrmawa,
      partisipanModel: usulanKegiatan.partisipan.map((partisipan) =>
          PartisipanModel.fromEntity(partisipan)).toList(),
      biayaKegiatanModel: usulanKegiatan.biayaKegiatan.map((biayaKegiatan) =>
          BiayaKegiatanModel.fromEntity(biayaKegiatan)).toList(),
      totalBiaya: usulanKegiatan.totalBiaya,
      latarBelakang: usulanKegiatan.latarBelakang,
      tujuanKegiatan: usulanKegiatan.tujuanKegiatan,
      manfaatKegiatan: usulanKegiatan.manfaatKegiatan,
      bentukPelaksanaanKegiatan: usulanKegiatan.bentukPelaksanaanKegiatan,
      targetPencapaianKegiatan: usulanKegiatan.targetPencapaianKegiatan,
      waktuDanTempatPelaksanaan: usulanKegiatan.waktuDanTempatPelaksanaan,
      rencanaAnggaranKegiatan: usulanKegiatan.rencanaAnggaranKegiatan,
      tertibAcaraModel: usulanKegiatan.tertibAcara.map((tertibAcara) =>
          TertibAcaraModel.fromEntity(tertibAcara)).toList(),
      perlengkapanDanPeralatan: usulanKegiatan.perlengkapanDanPeralatan,
      penutup: usulanKegiatan.penutup,
      fotoPostinganKegiatan: usulanKegiatan.fotoPostinganKegiatan,
      fotoSuratUndanganKegiatan: usulanKegiatan.fotoSuratUndanganKegiatan,
      fotoLinimasaKegiatan: usulanKegiatan.fotoLinimasaKegiatan,
      fotoTempatKegiatan: usulanKegiatan.fotoTempatKegiatan,
      fileUsulanKegiatan: usulanKegiatan.fileUsulanKegiatan,
      validasiPembina: usulanKegiatan.validasiPembina,
      tandaTanganPembina: usulanKegiatan.tandaTanganPembina,
      statusUsulan: usulanKegiatan.statusUsulan,
      roles: usulanKegiatan.roles,
      createdAt: usulanKegiatan.createdAt,
      updatedAt: usulanKegiatan.updatedAt,
      createdBy: usulanKegiatan.createdBy,
      updatedBy: usulanKegiatan.updatedBy,
    );
  }

  factory UsulanKegiatanModel.fromJson(Map<String, dynamic> json) => UsulanKegiatanModel(
    idUsulan: json["id_usulan"],
    userModel: MipokaUserModel.fromJson(json["user"]),
    ormawaModel: OrmawaModel.fromJson(json["ormawa"]),
    pembiayaan: json["pembiayaan"],
    namaKegiatan: json["nama_kegiatan"],
    bentukKegiatan: json["bentuk_kegiatan"],
    kategoriBentukKegiatan: json["kategori_bentuk_kegiatan"],
    deskripsiKegiatan: json["deskripsi_kegiatan"],
    tanggalMulaiKegiatan: json["tanggal_mulai_kegiatan"],
    tanggalSelesaiKegiatan: json["tanggal_selesai_kegiatan"],
    waktuMulaiKegiatan: json["waktu_mulai_kegiatan"],
    waktuSelesaiKegiatan: json["waktu_selesai_kegiatan"],
    tempatKegiatan: json["tempat_kegiatan"],
    tanggalKeberangkatan: json["tanggal_keberangkatan"],
    tanggalKepulangan: json["tanggal_kepulangan"],
    jumlahPartisipan: json["jumlah_partisipan"],
    kategoriJumlahPartisipan: json["kategori_jumlah_partisipan"],
    targetKegiatan: json["target_kegiatan"],
    totalPendanaan: json["total_pendanaan"],
    kategoriTotalPendanaan: json["kategori_total_pendanaan"],
    keterangan: json["keterangan"],
    tandaTanganOrmawa: json["tanda_tangan_ormawa"],
    partisipanModel: List<PartisipanModel>.from(json["partisipan"].map((x) => PartisipanModel.fromJson(x))),
    biayaKegiatanModel: List<BiayaKegiatanModel>.from(json["biaya_kegiatan"].map((x) => BiayaKegiatanModel.fromJson(x))),
    totalBiaya: json["total_biaya"],
    latarBelakang: json["latar_belakang"],
    tujuanKegiatan: json["tujuan_kegiatan"],
    manfaatKegiatan: json["manfaat_kegiatan"],
    bentukPelaksanaanKegiatan: json["bentuk_pelaksanaan_kegiatan"],
    targetPencapaianKegiatan: json["target_pencapaian_kegiatan"],
    waktuDanTempatPelaksanaan: json["waktu_dan_tempat_pelaksanaan"],
    rencanaAnggaranKegiatan: json["rencana_anggaran_kegiatan"],
    tertibAcaraModel: List<TertibAcaraModel>.from(json["tertib_acara"].map((x) => TertibAcaraModel.fromJson(x))),
    perlengkapanDanPeralatan: json["perlengkapan_dan_peralatan"],
    penutup: json["penutup"],
    fotoPostinganKegiatan: json["foto_postingan_kegiatan"],
    fotoSuratUndanganKegiatan: json["foto_surat_undangan_kegiatan"],
    fotoLinimasaKegiatan: json["foto_linimasa_kegiatan"],
    fotoTempatKegiatan: json["foto_tempat_kegiatan"],
    fileUsulanKegiatan: json["file_usulan_kegiatan"],
    validasiPembina: json["validasi_pembina"],
    tandaTanganPembina: json["tanda_tangan_pembina"],
    statusUsulan: json["status_usulan"],
    roles: json["roles"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_usulan": idUsulan,
    "user": userModel.toJson(),
    "ormawa": ormawaModel.toJson(),
    "pembiayaan": pembiayaan,
    "nama_kegiatan": namaKegiatan,
    "bentuk_kegiatan": bentukKegiatan,
    "kategori_bentuk_kegiatan": kategoriBentukKegiatan,
    "deskripsi_kegiatan": deskripsiKegiatan,
    "tanggal_mulai_kegiatan": tanggalMulaiKegiatan,
    "tanggal_selesai_kegiatan": tanggalSelesaiKegiatan,
    "waktu_mulai_kegiatan": waktuMulaiKegiatan,
    "waktu_selesai_kegiatan": waktuSelesaiKegiatan,
    "tempat_kegiatan": tempatKegiatan,
    "tanggal_keberangkatan": tanggalKeberangkatan,
    "tanggal_kepulangan": tanggalKepulangan,
    "jumlah_partisipan": jumlahPartisipan,
    "kategori_jumlah_partisipan": kategoriJumlahPartisipan,
    "target_kegiatan": targetKegiatan,
    "total_pendanaan": totalPendanaan,
    "kategori_total_pendanaan": kategoriTotalPendanaan,
    "keterangan": keterangan,
    "tanda_tangan_ormawa": tandaTanganOrmawa,
    "partisipan": List<dynamic>.from(partisipanModel.map((x) => x.toJson())),
    "biaya_kegiatan": List<dynamic>.from(biayaKegiatanModel.map((x) => x.toJson())),
    "total_biaya": totalBiaya,
    "latar_belakang": latarBelakang,
    "tujuan_kegiatan": tujuanKegiatan,
    "manfaat_kegiatan": manfaatKegiatan,
    "bentuk_pelaksanaan_kegiatan": bentukPelaksanaanKegiatan,
    "target_pencapaian_kegiatan": targetPencapaianKegiatan,
    "waktu_dan_tempat_pelaksanaan": waktuDanTempatPelaksanaan,
    "rencana_anggaran_kegiatan": rencanaAnggaranKegiatan,
    "tertib_acara": List<dynamic>.from(tertibAcaraModel.map((x) => x.toJson())),
    "perlengkapan_dan_peralatan": perlengkapanDanPeralatan,
    "penutup": penutup,
    "foto_postingan_kegiatan": fotoPostinganKegiatan,
    "foto_surat_undangan_kegiatan": fotoSuratUndanganKegiatan,
    "foto_linimasa_kegiatan": fotoLinimasaKegiatan,
    "foto_tempat_kegiatan": fotoTempatKegiatan,
    "file_usulan_kegiatan": fileUsulanKegiatan,
    "validasi_pembina": validasiPembina,
    "tanda_tangan_pembina": tandaTanganPembina,
    "status_usulan": statusUsulan,
    "roles": roles,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}