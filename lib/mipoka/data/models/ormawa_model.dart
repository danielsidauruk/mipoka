import 'package:mipoka/mipoka/domain/entities/ormawa.dart';

class OrmawaModel extends Ormawa {
  const OrmawaModel({
    required super.idOrmawa,
    required super.namaOrmawa,
    required super.pembina,
    required super.ketua,
    required super.wakil,
    required super.sekretaris,
    required super.bendahara,
    required super.jumlahAnggota,
    required super.fotoPembina,
    required super.fotoKetua,
    required super.fotoWakil,
    required super.fotoSekretaris,
    required super.fotoBendahara,
    required super.createdAt,
    required super.createdBy,
    required super.updatedBy,
    required super.updatedAt,
  });

  factory OrmawaModel.fromEntity(Ormawa ormawa) {
    return OrmawaModel(
      idOrmawa: ormawa.idOrmawa,
      namaOrmawa: ormawa.namaOrmawa,
      pembina: ormawa.pembina,
      ketua: ormawa.ketua,
      wakil: ormawa.wakil,
      sekretaris: ormawa.sekretaris,
      bendahara: ormawa.bendahara,
      jumlahAnggota: ormawa.jumlahAnggota,
      fotoPembina: ormawa.fotoPembina,
      fotoKetua: ormawa.fotoKetua,
      fotoWakil: ormawa.fotoWakil,
      fotoSekretaris: ormawa.fotoSekretaris,
      fotoBendahara: ormawa.fotoBendahara,
      createdAt: ormawa.createdAt,
      createdBy: ormawa.createdBy,
      updatedAt: ormawa.updatedAt,
      updatedBy: ormawa.updatedBy,
    );
  }

  factory OrmawaModel.fromJson(Map<String, dynamic> json) => OrmawaModel(
    idOrmawa: json["id_ormawa"],
    namaOrmawa: json["nama_ormawa"],
    pembina: json["pembina"],
    ketua: json["ketua"],
    wakil: json["wakil"],
    sekretaris: json["sekretaris"],
    bendahara: json["bendahara"],
    jumlahAnggota: json["jumlah_anggota"],
    fotoPembina: json["foto_pembina"],
    fotoKetua: json["foto_ketua"],
    fotoWakil: json["foto_wakil"],
    fotoSekretaris: json["foto_sekretaris"],
    fotoBendahara: json["foto_bendahara"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id_ormawa": idOrmawa,
    "nama_ormawa": namaOrmawa,
    "pembina": pembina,
    "ketua": ketua,
    "wakil": wakil,
    "sekretaris": sekretaris,
    "bendahara": bendahara,
    "jumlah_anggota": jumlahAnggota,
    "foto_pembina": fotoPembina,
    "foto_ketua": fotoKetua,
    "foto_wakil": fotoWakil,
    "foto_sekretaris": fotoSekretaris,
    "foto_bendahara": fotoBendahara,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "updated_at": updatedAt,
  };
}
