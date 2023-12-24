import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan_per_periode_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/mipoka_user.dart';

class RiwayatKegiatanMpt extends Equatable {
  final int idRiwayatKegiatanMpt;
  final KegiatanPerPeriodeMpt kegiatanPerPeriodeMpt;
  final MipokaUser mipokaUser;
  final String statusMpt;
  final String fileSertifikatMpt;
  final String hash;
  final String keteranganMhs;
  final String keteranganSa;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const RiwayatKegiatanMpt({
    required this.idRiwayatKegiatanMpt,
    required this.kegiatanPerPeriodeMpt,
    required this.mipokaUser,
    required this.statusMpt,
    required this.fileSertifikatMpt,
    required this.hash,
    required this.keteranganMhs,
    required this.keteranganSa,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  RiwayatKegiatanMpt copyWith({
    int? idRiwayatKegiatanMpt,
    KegiatanPerPeriodeMpt? kegiatanPerPeriodeMpt,
    MipokaUser? mipokaUser,
    String? statusMpt,
    String? fileSertifikatMpt,
    String? hash,
    String? keteranganMhs,
    String? keteranganSa,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      RiwayatKegiatanMpt(
        idRiwayatKegiatanMpt: idRiwayatKegiatanMpt ?? this.idRiwayatKegiatanMpt,
        kegiatanPerPeriodeMpt: kegiatanPerPeriodeMpt ?? this.kegiatanPerPeriodeMpt,
        mipokaUser: mipokaUser ?? this.mipokaUser,
        statusMpt: statusMpt ?? this.statusMpt,
        fileSertifikatMpt: fileSertifikatMpt ?? this.fileSertifikatMpt,
        hash: hash ?? this.hash,
        keteranganMhs: keteranganMhs ?? this.keteranganMhs,
        keteranganSa: keteranganSa ?? this.keteranganSa,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idRiwayatKegiatanMpt,
    kegiatanPerPeriodeMpt,
    mipokaUser,
    statusMpt,
    fileSertifikatMpt,
    hash,
    keteranganMhs,
    keteranganSa,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
