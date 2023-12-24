import 'package:mipoka/mipoka/domain/entities/periode_mpt.dart';

class PeriodeMptModel extends PeriodeMpt {
  const PeriodeMptModel({
    required super.idPeriodeMpt,
    required super.tahunPeriodeMpt,
    required super.periodeMengulangMpt,
    required super.tanggalMulaiPeriodeMpt,
    required super.tanggalBerakhirPeriodeMpt,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory PeriodeMptModel.fromEntity(PeriodeMpt periodeMpt) {
    return PeriodeMptModel(
      idPeriodeMpt: periodeMpt.idPeriodeMpt,
      tahunPeriodeMpt: periodeMpt.tahunPeriodeMpt,
      periodeMengulangMpt: periodeMpt.periodeMengulangMpt,
      tanggalMulaiPeriodeMpt: periodeMpt.tanggalMulaiPeriodeMpt,
      tanggalBerakhirPeriodeMpt: periodeMpt.tanggalBerakhirPeriodeMpt,
      createdAt: periodeMpt.createdAt,
      createdBy: periodeMpt.createdBy,
      updatedAt: periodeMpt.updatedAt,
      updatedBy: periodeMpt.updatedBy,
    );
  }

  factory PeriodeMptModel.fromJson(Map<String, dynamic> json) => PeriodeMptModel(
    idPeriodeMpt: json["id_periode_mpt"],
    tahunPeriodeMpt: json["tahun_periode_mpt"],
    periodeMengulangMpt: json["periode_mengulang_mpt"],
    tanggalMulaiPeriodeMpt: json["tanggal_mulai_periode_mpt"],
    tanggalBerakhirPeriodeMpt: json["tanggal_berakhir_periode_mpt"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_periode_mpt": idPeriodeMpt,
    "tahun_periode_mpt": tahunPeriodeMpt,
    "periode_mengulang_mpt": periodeMengulangMpt,
    "tanggal_mulai_periode_mpt": tanggalMulaiPeriodeMpt,
    "tanggal_berakhir_periode_mpt": tanggalBerakhirPeriodeMpt,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
