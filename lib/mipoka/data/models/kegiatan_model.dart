import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';

class KegiatanModel extends Kegiatan {
  const KegiatanModel({
    required int idKegiatan,
    required String jenisKegiatan,
    required String namaKegiatan,
    required String idPeriode,
    required int pointMpt,
    required int idOrmawa,
    required String keterangan,
  }) : super(
    idKegiatan: idKegiatan,
    jenisKegiatan: jenisKegiatan,
    namaKegiatan: namaKegiatan,
    idPeriode: idPeriode,
    pointMpt: pointMpt,
    idOrmawa: idOrmawa,
    keterangan: keterangan,
  );

  factory KegiatanModel.fromEntity(Kegiatan kegiatan) {
    return KegiatanModel(
      idKegiatan: kegiatan.idKegiatan,
      jenisKegiatan: kegiatan.keterangan,
      namaKegiatan: kegiatan.namaKegiatan,
      idPeriode: kegiatan.idPeriode,
      pointMpt: kegiatan.pointMpt,
      idOrmawa: kegiatan.idOrmawa,
      keterangan: kegiatan.keterangan,
    );
  }

  factory KegiatanModel.fromJson(Map<String, dynamic> json) {
    return KegiatanModel(
      idKegiatan: json['idKegiatan'],
      jenisKegiatan: json['jenisKegiatan'],
      namaKegiatan: json['namaKegiatan'],
      idPeriode: json['idPeriode'],
      pointMpt: json['pointMpt'],
      idOrmawa: json['idOrmawa'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idKegiatan': idKegiatan,
      'jenisKegiatan': jenisKegiatan,
      'namaKegiatan': namaKegiatan,
      'idPeriode': idPeriode,
      'pointMpt': pointMpt,
      'idOrmawa': idOrmawa,
      'keterangan': keterangan,
    };
  }
}
