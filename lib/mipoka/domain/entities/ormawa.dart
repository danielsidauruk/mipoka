import 'package:equatable/equatable.dart';

// Just updated
class Ormawa extends Equatable{
  final int idOrmawa;
  final String namaOrmawa;
  final String pembina;
  final String ketua;
  final String wakil;
  final String bendahara;
  final int jumlahAnggota;
  final String fotoPembina;
  final String fotoKetua;
  final String fotoWakil;
  final String fotoBendahara;

  Ormawa({
    required this.idOrmawa,
    required this.namaOrmawa,
    required this.pembina,
    required this.ketua,
    required this.wakil,
    required this.bendahara,
    required this.jumlahAnggota,
    required this.fotoPembina,
    required this.fotoKetua,
    required this.fotoWakil,
    required this.fotoBendahara,
  });

  Ormawa copyWith({
    int? idOrmawa,
    String? namaOrmawa,
    String? pembina,
    String? ketua,
    String? wakil,
    String? bendahara,
    int? jumlahAnggota,
    String? fotoPembina,
    String? fotoKetua,
    String? fotoWakil,
    String? fotoBendahara,
  }) =>
      Ormawa(
        idOrmawa: idOrmawa ?? this.idOrmawa,
        namaOrmawa: namaOrmawa ?? this.namaOrmawa,
        pembina: pembina ?? this.pembina,
        ketua: ketua ?? this.ketua,
        wakil: wakil ?? this.wakil,
        bendahara: bendahara ?? this.bendahara,
        jumlahAnggota: jumlahAnggota ?? this.jumlahAnggota,
        fotoPembina: fotoPembina ?? this.fotoPembina,
        fotoKetua: fotoKetua ?? this.fotoKetua,
        fotoWakil: fotoWakil ?? this.fotoWakil,
        fotoBendahara: fotoBendahara ?? this.fotoBendahara,
      );

  @override
  List<Object?> get props => [
    idOrmawa,
    namaOrmawa,
    pembina,
    ketua,
    wakil,
    bendahara,
    jumlahAnggota,
    fotoPembina,
    fotoKetua,
    fotoWakil,
    fotoBendahara,
  ];
}