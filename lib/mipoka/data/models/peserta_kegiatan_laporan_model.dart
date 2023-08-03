import 'package:mipoka/mipoka/domain/entities/peserta_kegiatan_laporan.dart';

class PesertaKegiatanLaporanModel extends PesertaKegiatanLaporan {
  const PesertaKegiatanLaporanModel({
    required super.idPesertaKegiatanLaporan,
    required super.nim,
    required super.namaLengkap,
    required super.peran,
    required super.laporan,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory PesertaKegiatanLaporanModel.fromEntity(PesertaKegiatanLaporan pesertaKegiatanLaporan) {
    return PesertaKegiatanLaporanModel(
      idPesertaKegiatanLaporan: pesertaKegiatanLaporan.idPesertaKegiatanLaporan,
      nim: pesertaKegiatanLaporan.nim,
      namaLengkap: pesertaKegiatanLaporan.namaLengkap,
      peran: pesertaKegiatanLaporan.peran,
      laporan: pesertaKegiatanLaporan.laporan,
      createdAt: pesertaKegiatanLaporan.createdAt,
      createdBy: pesertaKegiatanLaporan.createdBy,
      updatedAt: pesertaKegiatanLaporan.updatedAt,
      updatedBy: pesertaKegiatanLaporan.updatedBy,
    );
  }

  factory PesertaKegiatanLaporanModel.fromJson(Map<String, dynamic> json) => PesertaKegiatanLaporanModel(
    idPesertaKegiatanLaporan: json["id_peserta_kegiatan_laporan"],
    nim: json["nim"],
    namaLengkap: json["nama_lengkap"],
    peran: json["peran"],
    laporan: json["laporan"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_peserta_kegiatan_laporan": idPesertaKegiatanLaporan,
    "nim": nim,
    "nama_lengkap": namaLengkap,
    "peran": peran,
    "laporan": laporan,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
