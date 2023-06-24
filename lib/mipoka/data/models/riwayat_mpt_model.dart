import 'package:mipoka/mipoka/data/models/kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/user_model.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';

// => Just Updated
class RiwayatMptModel extends RiwayatMpt {
  final KegiatanModel kegiatanModel;
  final MipokaUserModel userModel;

  const RiwayatMptModel({
    required super.idRiwayatMpt,
    required this.kegiatanModel,
    required this.userModel,
    required super.status,
    required super.file,
    required super.hash,
    required super.keteranganA,
    required super.keteranganB,
    required super.mulai,
    required super.akhir,
    required super.updatedAt,
    required super.createdAt,
  }) : super(
    kegiatan: kegiatanModel,
    user: userModel,
  );

  factory RiwayatMptModel.fromEntity(RiwayatMpt riwayatMpt) {
    return RiwayatMptModel(
      idRiwayatMpt: riwayatMpt.idRiwayatMpt,
      kegiatanModel: KegiatanModel.fromEntity(riwayatMpt.kegiatan),
      userModel: MipokaUserModel.fromEntity(riwayatMpt.user),
      status: riwayatMpt.status,
      file: riwayatMpt.file,
      hash: riwayatMpt.hash,
      keteranganA: riwayatMpt.keteranganA,
      keteranganB: riwayatMpt.keteranganB,
      mulai: riwayatMpt.mulai,
      akhir: riwayatMpt.akhir,
      updatedAt: riwayatMpt.updatedAt,
      createdAt: riwayatMpt.createdAt,
    );
  }

  factory RiwayatMptModel.fromJson(Map<String, dynamic> json) {
    return RiwayatMptModel(
      idRiwayatMpt: json['idRiwayatMpt'],
      kegiatanModel: KegiatanModel.fromJson(json['kegiatan']),
      userModel: MipokaUserModel.fromJson(json['user']),
      status: json['status'],
      file: json['file'],
      hash: json['hash'],
      keteranganA: json['keteranganA'],
      keteranganB: json['keteranganB'],
      mulai: json['mulai'],
      akhir: json['akhir'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRiwayatMpt': idRiwayatMpt,
      'kegiatan': kegiatanModel.toJson(),
      'user': userModel.toJson(),
      'status': status,
      'file': file,
      'hash': hash,
      'keteranganA': keteranganA,
      'keteranganB': keteranganB,
      'mulai': mulai,
      'akhir': akhir,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }
}
