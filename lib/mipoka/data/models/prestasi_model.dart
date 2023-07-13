import 'package:mipoka/mipoka/data/models/mipoka_user_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';

class PrestasiModel extends Prestasi {
  final MipokaUserModel mipokaUserModel;
  final OrmawaModel ormawaModel;

  const PrestasiModel({
    required super.idPrestasi,
    required this.mipokaUserModel,
    required this.ormawaModel,
    required super.namaKegiatan,
    required super.waktuPenyelenggaraan,
    required super.tingkat,
    required super.prestasiDicapai,
    required super.unggahSertifikat,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  }) : super(
    mipokaUser: mipokaUserModel,
    ormawa: ormawaModel,
  );

  factory PrestasiModel.fromEntity(Prestasi prestasi) {
    return PrestasiModel(
      idPrestasi: prestasi.idPrestasi,
      mipokaUserModel: MipokaUserModel.fromEntity(prestasi.mipokaUser),
      ormawaModel: OrmawaModel.fromEntity(prestasi.ormawa),
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
    mipokaUserModel: MipokaUserModel.fromJson(json["user"]),
    ormawaModel: OrmawaModel.fromJson(json["ormawa"]),
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
    "user": mipokaUserModel.toJson(),
    "ormawa": ormawaModel.toJson(),
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
