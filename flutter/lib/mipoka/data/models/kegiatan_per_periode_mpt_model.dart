import 'package:mipoka/mipoka/data/models/nama_kegiatan_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/periode_mpt_model.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';

class KegiatanPerPeriodeMptModel extends KegiatanPerPeriodeMpt{
  final NamaKegiatanMptModel namaKegiatanMptModel;
  final PeriodeMptModel periodeMptModel;

  const KegiatanPerPeriodeMptModel({
    required super.idKegiatanPerPeriodeMpt,
    required this.namaKegiatanMptModel,
    required this.periodeMptModel,
    required super.tanggalMulaiKegiatanPerPeriodeMpt,
    required super.tanggalSelesaiKegiatanPerPeriodeMpt,
    required super.pointMptDiperoleh,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  }) : super(
    namaKegiatanMpt: namaKegiatanMptModel,
    periodeMpt: periodeMptModel,
  );

  factory KegiatanPerPeriodeMptModel.fromEntity(KegiatanPerPeriodeMpt kegiatanMpt) {
    return KegiatanPerPeriodeMptModel(
      idKegiatanPerPeriodeMpt: kegiatanMpt.idKegiatanPerPeriodeMpt,
      namaKegiatanMptModel: NamaKegiatanMptModel.fromEntity(kegiatanMpt.namaKegiatanMpt),
      periodeMptModel: PeriodeMptModel.fromEntity(kegiatanMpt.periodeMpt),
      tanggalMulaiKegiatanPerPeriodeMpt: kegiatanMpt.tanggalMulaiKegiatanPerPeriodeMpt,
      tanggalSelesaiKegiatanPerPeriodeMpt: kegiatanMpt.tanggalSelesaiKegiatanPerPeriodeMpt,
      pointMptDiperoleh: kegiatanMpt.pointMptDiperoleh,
      createdAt: kegiatanMpt.createdAt,
      createdBy: kegiatanMpt.createdBy,
      updatedAt: kegiatanMpt.updatedAt,
      updatedBy: kegiatanMpt.updatedBy,
    );
  }

  factory KegiatanPerPeriodeMptModel.fromJson(Map<String, dynamic> json) => KegiatanPerPeriodeMptModel(
    idKegiatanPerPeriodeMpt: json["id_kegiatan_per_periode_mpt"],
    periodeMptModel: PeriodeMptModel.fromJson(json["periode_mpt"]),
    namaKegiatanMptModel: NamaKegiatanMptModel.fromJson(json["nama_kegiatan_mpt"]),
    tanggalMulaiKegiatanPerPeriodeMpt: json["tanggal_mulai_kegiatan_per_periode_mpt"],
    tanggalSelesaiKegiatanPerPeriodeMpt: json["tanggal_selesai_kegiatan_per_periode_mpt"],
    pointMptDiperoleh: json["point_mpt_diperoleh"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_kegiatan_per_periode_mpt": idKegiatanPerPeriodeMpt,
    "periode_mpt": periodeMptModel.toJson(),
    "nama_kegiatan_mpt": namaKegiatanMptModel.toJson(),
    "tanggal_mulai_kegiatan_per_periode_mpt": tanggalMulaiKegiatanPerPeriodeMpt,
    "tanggal_selesai_kegiatan_per_periode_mpt": tanggalSelesaiKegiatanPerPeriodeMpt,
    "point_mpt_diperoleh": pointMptDiperoleh,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
