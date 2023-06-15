import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';

class Ormawa extends Equatable {
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

  const Ormawa({
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

  OrmawaModel toOrmawaModel() {
    return OrmawaModel(
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
  }

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
