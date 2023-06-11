import 'package:mipoka/mipoka/domain/entities/ormawa.dart';

class OrmawaModel extends Ormawa {
  const OrmawaModel({
    required int idOrmawa,
    required String namaOrmawa,
    required String pembina,
    required String ketua,
    required String wakil,
    required String bendahara,
    required int jumlahAnggota,
    required String fotoPembina,
    required String fotoKetua,
    required String fotoWakil,
    required String fotoBendahara,
  }) : super(
    idOrmawa: idOrmawa,
    namaOrmawa: namaOrmawa,
    pembina: pembina,
    ketua: ketua,
    wakil: wakil,
    bendahara: bendahara,
    jumlahAnggota: jumlahAnggota,
    fotoPembina: fotoPembina,
    fotoKetua: fotoKetua,
    fotoWakil: fotoWakil,
    fotoBendahara: fotoBendahara,
  );

  factory OrmawaModel.fromJson(Map<String, dynamic> json) {
    return OrmawaModel(
      idOrmawa: json['idOrmawa'],
      namaOrmawa: json['namaOrmawa'],
      pembina: json['pembina'],
      ketua: json['ketua'],
      wakil: json['wakil'],
      bendahara: json['bendahara'],
      jumlahAnggota: json['jumlahAnggota'],
      fotoPembina: json['fotoPembina'],
      fotoKetua: json['fotoKetua'],
      fotoWakil: json['fotoWakil'],
      fotoBendahara: json['fotoBendahara'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idOrmawa': idOrmawa,
      'namaOrmawa': namaOrmawa,
      'pembina': pembina,
      'ketua': ketua,
      'wakil': wakil,
      'bendahara': bendahara,
      'jumlahAnggota': jumlahAnggota,
      'fotoPembina': fotoPembina,
      'fotoKetua': fotoKetua,
      'fotoWakil': fotoWakil,
      'fotoBendahara': fotoBendahara,
    };
  }
}
