import 'package:equatable/equatable.dart';

class RiwayatMpt extends Equatable {
  final int idRiwayatMpt;
  final int idKegiatanMpt;
  final String idUser;
  final String statusMpt;
  final String fileSertifikatMpt;
  final String hash;
  final String keteranganMhs;
  final String keteranganSa;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const RiwayatMpt({
    required this.idRiwayatMpt,
    required this.idKegiatanMpt,
    required this.idUser,
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

  RiwayatMpt copyWith({
    int? idRiwayatMpt,
    int? idKegiatanMpt,
    String? idUser,
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
      RiwayatMpt(
        idRiwayatMpt: idRiwayatMpt ?? this.idRiwayatMpt,
        idKegiatanMpt: idKegiatanMpt ?? this.idKegiatanMpt,
        idUser: idUser ?? this.idUser,
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
    idKegiatanMpt,
    idUser,
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
