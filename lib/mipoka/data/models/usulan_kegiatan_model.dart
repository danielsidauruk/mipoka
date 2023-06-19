import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/user_model.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';

class UsulanKegiatanModel extends UsulanKegiatan {
  final UserModel userModel;
  final OrmawaModel ormawaModel;
  final PartisipanModel partisipanModel;
  final RincianBiayaKegiatanModel rincianBiayaKegiatanModel;
  final TertibAcaraModel tertibAcaraModel;

  const UsulanKegiatanModel({
    required super.idUsulan,
    required this.userModel,
    required this.ormawaModel,
    required super.pembiayaan,
    required super.namaKegiatan,
    required super.bentukKegiatan,
    required super.deskripsiKegiatan,
    required super.tanggalMulaiKegiatan,
    required super.tanggalSelesaiKegiatan,
    required super.waktuMulaiKegiatan,
    required super.waktuSelesaiKegiatan,
    required super.tempatKegiatan,
    required super.tanggalKeberangkatan,
    required super.tanggalKepulangan,
    required super.jumlahPartisipan,
    required super.targetKegiatan,
    required super.totalPendana,
    required super.tandaTanganOrmawa,
    required this.partisipanModel,
    required this.rincianBiayaKegiatanModel,
    required super.ketuaOrmawa,
    required super.pembina,
    required super.latarBelakang,
    required super.tujuanKegiatan,
    required super.manfaatKegiatan,
    required super.bentukPelaksanaanKegiatan,
    required super.targetPencapaianKegiatan,
    required super.waktuDanTempatPelaksanaan,
    required super.rencanaAnggaranKegiatan,
    required this.tertibAcaraModel,
    required super.perlengkapan,
    required super.penutup,
    required super.postinganKegiatan,
    required super.dokumentasiKegiatan,
    required super.tabulasiHasil,
    required super.fakturPembayaran,
    required super.status,
    required super.validasiPembina,
    required super.roles,
    required super.file,
    required super.updatedAt,
    required super.createdAt,
  }) : super(
    user: userModel,
    ormawa: ormawaModel,
    partisipan: partisipanModel,
    rincianBiayaKegiatan: rincianBiayaKegiatanModel,
    tertibAcara:  tertibAcaraModel,
  );

  factory UsulanKegiatanModel.fromEntity(UsulanKegiatan usulanKegiatan) {
    return UsulanKegiatanModel(
      idUsulan: usulanKegiatan.idUsulan,
      userModel: UserModel.fromEntity(usulanKegiatan.user),
      ormawaModel: OrmawaModel.fromEntity(usulanKegiatan.ormawa),
      pembiayaan: usulanKegiatan.pembiayaan,
      namaKegiatan: usulanKegiatan.namaKegiatan,
      bentukKegiatan: usulanKegiatan.bentukKegiatan,
      deskripsiKegiatan: usulanKegiatan.deskripsiKegiatan,
      tanggalMulaiKegiatan: usulanKegiatan.tanggalMulaiKegiatan,
      tanggalSelesaiKegiatan: usulanKegiatan.tanggalSelesaiKegiatan,
      waktuMulaiKegiatan: usulanKegiatan.waktuMulaiKegiatan,
      waktuSelesaiKegiatan: usulanKegiatan.waktuSelesaiKegiatan,
      tempatKegiatan: usulanKegiatan.tempatKegiatan,
      tanggalKeberangkatan: usulanKegiatan.tanggalKeberangkatan,
      tanggalKepulangan: usulanKegiatan.tanggalKepulangan,
      jumlahPartisipan: usulanKegiatan.jumlahPartisipan,
      targetKegiatan: usulanKegiatan.targetKegiatan,
      totalPendana: usulanKegiatan.totalPendana,
      tandaTanganOrmawa: usulanKegiatan.tandaTanganOrmawa,
      partisipanModel: PartisipanModel.fromEntity(usulanKegiatan.partisipan),
      rincianBiayaKegiatanModel: RincianBiayaKegiatanModel.fromEntity(usulanKegiatan.rincianBiayaKegiatan),
      ketuaOrmawa: usulanKegiatan.ketuaOrmawa,
      pembina: usulanKegiatan.pembina,
      latarBelakang: usulanKegiatan.latarBelakang,
      tujuanKegiatan: usulanKegiatan.tujuanKegiatan,
      manfaatKegiatan: usulanKegiatan.manfaatKegiatan,
      bentukPelaksanaanKegiatan: usulanKegiatan.bentukPelaksanaanKegiatan,
      targetPencapaianKegiatan: usulanKegiatan.targetPencapaianKegiatan,
      waktuDanTempatPelaksanaan: usulanKegiatan.waktuDanTempatPelaksanaan,
      rencanaAnggaranKegiatan: usulanKegiatan.rencanaAnggaranKegiatan,
      tertibAcaraModel: TertibAcaraModel.fromEntity(usulanKegiatan.tertibAcara),
      perlengkapan: usulanKegiatan.perlengkapan,
      penutup: usulanKegiatan.penutup,
      postinganKegiatan: usulanKegiatan.postinganKegiatan,
      dokumentasiKegiatan: usulanKegiatan.dokumentasiKegiatan,
      tabulasiHasil: usulanKegiatan.tabulasiHasil,
      fakturPembayaran: usulanKegiatan.fakturPembayaran,
      status: usulanKegiatan.status,
      validasiPembina: usulanKegiatan.validasiPembina,
      roles: usulanKegiatan.roles,
      file: usulanKegiatan.file,
      updatedAt: usulanKegiatan.updatedAt,
      createdAt: usulanKegiatan.createdAt,
    );
  }


  factory UsulanKegiatanModel.fromJson(Map<String, dynamic> json) => UsulanKegiatanModel(
    idUsulan: json["idUsulan"],
    userModel: UserModel.fromJson(json["user"]),
    ormawaModel: OrmawaModel.fromJson(json["ormawa"]),
    pembiayaan: json["pembiayaan"],
    namaKegiatan: json["namaKegiatan"],
    bentukKegiatan: json["bentukKegiatan"],
    deskripsiKegiatan: json["deskripsiKegiatan"],
    tanggalMulaiKegiatan: DateTime.parse(json["tanggalMulaiKegiatan"]),
    tanggalSelesaiKegiatan: DateTime.parse(json["tanggalSelesaiKegiatan"]),
    waktuMulaiKegiatan: json["waktuMulaiKegiatan"],
    waktuSelesaiKegiatan: json["waktuSelesaiKegiatan"],
    tempatKegiatan: json["tempatKegiatan"],
    tanggalKeberangkatan: DateTime.parse(json["tanggalKeberangkatan"]),
    tanggalKepulangan: DateTime.parse(json["tanggalKepulangan"]),
    jumlahPartisipan: json["jumlahPartisipan"],
    targetKegiatan: json["targetKegiatan"],
    totalPendana: json["totalPendana"],
    tandaTanganOrmawa: json["tandaTanganOrmawa"],
    partisipanModel: PartisipanModel.fromJson(json["partisipan"]),
    rincianBiayaKegiatanModel: RincianBiayaKegiatanModel.fromJson(json["RincianBiayaKegiatan"]),
    ketuaOrmawa: json["ketuaOrmawa"],
    pembina: json["pembina"],
    latarBelakang: json["latarBelakang"],
    tujuanKegiatan: json["tujuanKegiatan"],
    manfaatKegiatan: json["manfaatKegiatan"],
    bentukPelaksanaanKegiatan: json["bentukPelaksanaanKegiatan"],
    targetPencapaianKegiatan: json["targetPencapaianKegiatan"],
    waktuDanTempatPelaksanaan: json["waktuDanTempatPelaksanaan"],
    rencanaAnggaranKegiatan: json["rencanaAnggaranKegiatan"],
    tertibAcaraModel: TertibAcaraModel.fromJson(json["TertibAcara"]),
    perlengkapan: json["perlengkapan"],
    penutup: json["penutup"],
    postinganKegiatan: json["postinganKegiatan"],
    dokumentasiKegiatan: json["dokumentasiKegiatan"],
    tabulasiHasil: json["tabulasiHasil"],
    fakturPembayaran: json["fakturPembayaran"],
    status: json["status"],
    validasiPembina: json["validasiPembina"],
    roles: json["roles"],
    file: json["file"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "idUsulan": idUsulan,
    "user": userModel.toJson(),
    "ormawa": ormawaModel.toJson(),
    "pembiayaan": pembiayaan,
    "namaKegiatan": namaKegiatan,
    "bentukKegiatan": bentukKegiatan,
    "deskripsiKegiatan": deskripsiKegiatan,
    "tanggalMulaiKegiatan": "${tanggalMulaiKegiatan.year.toString().padLeft(4, '0')}-${tanggalMulaiKegiatan.month.toString().padLeft(2, '0')}-${tanggalMulaiKegiatan.day.toString().padLeft(2, '0')}",
    "tanggalSelesaiKegiatan": "${tanggalSelesaiKegiatan.year.toString().padLeft(4, '0')}-${tanggalSelesaiKegiatan.month.toString().padLeft(2, '0')}-${tanggalSelesaiKegiatan.day.toString().padLeft(2, '0')}",
    "waktuMulaiKegiatan": waktuMulaiKegiatan,
    "waktuSelesaiKegiatan": waktuSelesaiKegiatan,
    "tempatKegiatan": tempatKegiatan,
    "tanggalKeberangkatan": "${tanggalKeberangkatan.year.toString().padLeft(4, '0')}-${tanggalKeberangkatan.month.toString().padLeft(2, '0')}-${tanggalKeberangkatan.day.toString().padLeft(2, '0')}",
    "tanggalKepulangan": "${tanggalKepulangan.year.toString().padLeft(4, '0')}-${tanggalKepulangan.month.toString().padLeft(2, '0')}-${tanggalKepulangan.day.toString().padLeft(2, '0')}",
    "jumlahPartisipan": jumlahPartisipan,
    "targetKegiatan": targetKegiatan,
    "totalPendana": totalPendana,
    "tandaTanganOrmawa": tandaTanganOrmawa,
    "partisipan": partisipanModel.toJson(),
    "RincianBiayaKegiatan": rincianBiayaKegiatanModel.toJson(),
    "ketuaOrmawa": ketuaOrmawa,
    "pembina": pembina,
    "latarBelakang": latarBelakang,
    "tujuanKegiatan": tujuanKegiatan,
    "manfaatKegiatan": manfaatKegiatan,
    "bentukPelaksanaanKegiatan": bentukPelaksanaanKegiatan,
    "targetPencapaianKegiatan": targetPencapaianKegiatan,
    "waktuDanTempatPelaksanaan": waktuDanTempatPelaksanaan,
    "rencanaAnggaranKegiatan": rencanaAnggaranKegiatan,
    "TertibAcara": tertibAcaraModel.toJson(),
    "perlengkapan": perlengkapan,
    "penutup": penutup,
    "postinganKegiatan": postinganKegiatan,
    "dokumentasiKegiatan": dokumentasiKegiatan,
    "tabulasiHasil": tabulasiHasil,
    "fakturPembayaran": fakturPembayaran,
    "status": status,
    "validasiPembina": validasiPembina,
    "roles": roles,
    "file": file,
    "updatedAt": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "createdAt": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}
