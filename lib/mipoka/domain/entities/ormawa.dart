import 'package:equatable/equatable.dart';

class Ormawa extends Equatable{
  final int idOrmawa;
  final String namaOrmawa;
  final String namaSingkatanOrmawa;
  final String logoOrmawa;
  final List<String> listAnggota;
  final String pembina;
  final String ketua;
  final String wakil;
  final String sekretaris;
  final String bendahara;
  final int jumlahAnggota;
  final String fotoPembina;
  final String fotoKetua;
  final String fotoWakil;
  final String fotoSekretaris;
  final String fotoBendahara;
  final String createdAt;
  final String createdBy;
  final String updatedBy;
  final String updatedAt;

  const Ormawa({
    required this.idOrmawa,
    required this.namaOrmawa,
    required this.namaSingkatanOrmawa,
    required this.logoOrmawa,
    required this.listAnggota,
    required this.pembina,
    required this.ketua,
    required this.wakil,
    required this.sekretaris,
    required this.bendahara,
    required this.jumlahAnggota,
    required this.fotoPembina,
    required this.fotoKetua,
    required this.fotoWakil,
    required this.fotoSekretaris,
    required this.fotoBendahara,
    required this.createdAt,
    required this.createdBy,
    required this.updatedBy,
    required this.updatedAt,
  });

  Ormawa copyWith({
    int? idOrmawa,
    String? namaOrmawa,
    String? namaSingkatanOrmawa,
    String? logoOrmawa,
    List<String>? listAnggota,
    String? pembina,
    String? ketua,
    String? wakil,
    String? sekretaris,
    String? bendahara,
    int? jumlahAnggota,
    String? fotoPembina,
    String? fotoKetua,
    String? fotoWakil,
    String? fotoSekretaris,
    String? fotoBendahara,
    String? createdAt,
    String? createdBy,
    String? updatedBy,
    String? updatedAt,
  }) =>
      Ormawa(
        idOrmawa: idOrmawa ?? this.idOrmawa,
        namaOrmawa: namaOrmawa ?? this.namaOrmawa,
        namaSingkatanOrmawa: namaSingkatanOrmawa ?? this.namaSingkatanOrmawa,
        logoOrmawa: logoOrmawa ?? this.logoOrmawa,
        listAnggota: listAnggota ?? this.listAnggota,
        pembina: pembina ?? this.pembina,
        ketua: ketua ?? this.ketua,
        wakil: wakil ?? this.wakil,
        sekretaris: sekretaris ?? this.sekretaris,
        bendahara: bendahara ?? this.bendahara,
        jumlahAnggota: jumlahAnggota ?? this.jumlahAnggota,
        fotoPembina: fotoPembina ?? this.fotoPembina,
        fotoKetua: fotoKetua ?? this.fotoKetua,
        fotoWakil: fotoWakil ?? this.fotoWakil,
        fotoSekretaris: fotoSekretaris ?? this.fotoSekretaris,
        fotoBendahara: fotoBendahara ?? this.fotoBendahara,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
    idOrmawa,
    namaOrmawa,
    logoOrmawa,
    pembina,
    ketua,
    wakil,
    sekretaris,
    bendahara,
    jumlahAnggota,
    fotoPembina,
    fotoKetua,
    fotoWakil,
    fotoSekretaris,
    fotoBendahara,
    createdAt,
    createdBy,
    updatedBy,
    updatedAt,
  ];
}
