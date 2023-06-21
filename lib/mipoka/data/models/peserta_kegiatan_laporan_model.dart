import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';

// => Just Updated
class PesertaKegiatanLaporanModel extends PesertaKegiatanLaporan {
  PesertaKegiatanLaporanModel({
    required super.idPesertaKegiatanLaporan,
    required super.nim,
    required super.namaLengkap,
    required super.peran,
  });

  factory PesertaKegiatanLaporanModel.fromEntity(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    return PesertaKegiatanLaporanModel(
      idPesertaKegiatanLaporan: pesertaKegiatanLaporan.idPesertaKegiatanLaporan,
      nim: pesertaKegiatanLaporan.nim,
      namaLengkap: pesertaKegiatanLaporan.namaLengkap,
      peran: pesertaKegiatanLaporan.peran,
    );
  }

  factory PesertaKegiatanLaporanModel.fromJson(Map<String, dynamic> json) => PesertaKegiatanLaporanModel(
    idPesertaKegiatanLaporan: json["idPesertaKegiatanLaporan"],
    nim: json["nim"],
    namaLengkap: json["namaLengkap"],
    peran: json["peran"],
  );

  Map<String, dynamic> toJson() => {
    "idPesertaKegiatanLaporan": idPesertaKegiatanLaporan,
    "nim": nim,
    "namaLengkap": namaLengkap,
    "peran": peran,
  };
}