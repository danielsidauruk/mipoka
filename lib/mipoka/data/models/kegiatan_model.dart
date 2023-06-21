import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/periode_model.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';

// ==> Just Updated
class KegiatanModel extends Kegiatan {
  final PeriodeModel periodeModel;
  final OrmawaModel ormawaModel;

  const KegiatanModel({
    required super.idKegiatan,
    required super.jenisKegiatan,
    required super.namaKegiatan,
    required this.periodeModel,
    required super.pointMpt,
    required this.ormawaModel,
    required super.keterangan,
  }) : super(
    periode: periodeModel,
    ormawa: ormawaModel,
  );

  factory KegiatanModel.fromEntity(Kegiatan kegiatan) {
    return KegiatanModel(
      idKegiatan: kegiatan.idKegiatan,
      jenisKegiatan: kegiatan.jenisKegiatan,
      namaKegiatan: kegiatan.namaKegiatan,
      periodeModel: PeriodeModel.fromEntity(kegiatan.periode),
      pointMpt: kegiatan.pointMpt,
      ormawaModel: OrmawaModel.fromEntity(kegiatan.ormawa),
      keterangan: kegiatan.keterangan,
    );
  }

  factory KegiatanModel.fromJson(Map<String, dynamic> json) => KegiatanModel(
    idKegiatan: json["idKegiatan"],
    jenisKegiatan: json["jenisKegiatan"],
    namaKegiatan: json["namaKegiatan"],
    periodeModel: PeriodeModel.fromJson(json["idPeriode"]),
    pointMpt: json["pointMpt"],
    ormawaModel: OrmawaModel.fromJson(json["ormawa"]),
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "idKegiatan": idKegiatan,
    "jenisKegiatan": jenisKegiatan,
    "namaKegiatan": namaKegiatan,
    "idPeriode": periodeModel.toJson(),
    "pointMpt": pointMpt,
    "ormawa": ormawaModel.toJson(),
    "keterangan": keterangan,
  };
}
