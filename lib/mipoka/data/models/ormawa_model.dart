import 'package:mipoka/mipoka/domain/entities/ormawa.dart';

// => Just Updated
class OrmawaModel extends Ormawa {
  OrmawaModel({
    required super.idOrmawa,
    required super.namaOrmawa,
    required super.pembina,
    required super.ketua,
    required super.wakil,
    required super.bendahara,
    required super.jumlahAnggota,
    required super.fotoPembina,
    required super.fotoKetua,
    required super.fotoWakil,
    required super.fotoBendahara,
  });

  factory OrmawaModel.fromEntity(Ormawa ormawa) {
    return OrmawaModel(
      idOrmawa: ormawa.idOrmawa,
      namaOrmawa: ormawa.namaOrmawa,
      pembina: ormawa.pembina,
      ketua: ormawa.ketua,
      wakil: ormawa.wakil,
      bendahara: ormawa.bendahara,
      jumlahAnggota: ormawa.jumlahAnggota,
      fotoPembina: ormawa.fotoPembina,
      fotoKetua: ormawa.fotoKetua,
      fotoWakil: ormawa.fotoWakil,
      fotoBendahara: ormawa.fotoBendahara,
    );
  }

  factory OrmawaModel.fromJson(Map<String, dynamic> json) => OrmawaModel(
    idOrmawa: json["idOrmawa"],
    namaOrmawa: json["namaOrmawa"],
    pembina: json["pembina"],
    ketua: json["ketua"],
    wakil: json["wakil"],
    bendahara: json["bendahara"],
    jumlahAnggota: json["jumlahAnggota"],
    fotoPembina: json["fotoPembina"],
    fotoKetua: json["fotoKetua"],
    fotoWakil: json["fotoWakil"],
    fotoBendahara: json["fotoBendahara"],
  );

  Map<String, dynamic> toJson() => {
    "idOrmawa": idOrmawa,
    "namaOrmawa": namaOrmawa,
    "pembina": pembina,
    "ketua": ketua,
    "wakil": wakil,
    "bendahara": bendahara,
    "jumlahAnggota": jumlahAnggota,
    "fotoPembina": fotoPembina,
    "fotoKetua": fotoKetua,
    "fotoWakil": fotoWakil,
    "fotoBendahara": fotoBendahara,
  };
}
