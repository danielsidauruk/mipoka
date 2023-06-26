import 'package:mipoka/mipoka/domain/entities/prestasi.dart';

class PrestasiModel extends Prestasi {
  const PrestasiModel({
    required super.idPrestasi,
    required super.idOrmawa,
    required super.idUser,
    required super.namaKegiatan,
    required super.waktuPenyelenggaraan,
    required super.tingkat,
    required super.prestasiDicapai,
    required super.unggahSertifikat,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory PrestasiModel.fromEntity(Prestasi prestasi) {
    return PrestasiModel(
      idPrestasi: prestasi.idPrestasi,
      idOrmawa: prestasi.idOrmawa,
      idUser: prestasi.idUser,
      namaKegiatan: prestasi.namaKegiatan,
      waktuPenyelenggaraan: prestasi.waktuPenyelenggaraan,
      tingkat: prestasi.tingkat,
      prestasiDicapai: prestasi.prestasiDicapai,
      unggahSertifikat: prestasi.unggahSertifikat,
      createdAt: prestasi.createdAt,
      createdBy: prestasi.createdBy,
      updatedAt: prestasi.updatedAt,
      updatedBy: prestasi.updatedBy,
    );
  }

  factory PrestasiModel.fromJson(Map<String, dynamic> json) => PrestasiModel(
    idPrestasi: json["id_prestasi"],
    idOrmawa: json["id_ormawa"],
    idUser: json["id_user"],
    namaKegiatan: json["nama_kegiatan"],
    waktuPenyelenggaraan: json["waktu_penyelenggaraan"],
    tingkat: json["tingkat"],
    prestasiDicapai: json["prestasi_dicapai"],
    unggahSertifikat: json["unggah_sertifikat"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_prestasi": idPrestasi,
    "id_ormawa": idOrmawa,
    "id_user": idUser,
    "nama_kegiatan": namaKegiatan,
    "waktu_penyelenggaraan": waktuPenyelenggaraan,
    "tingkat": tingkat,
    "prestasi_dicapai": prestasiDicapai,
    "unggah_sertifikat": unggahSertifikat,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
