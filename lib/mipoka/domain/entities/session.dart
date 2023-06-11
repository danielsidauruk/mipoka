import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final int idSession;
  final int userId;
  final String ruangan;
  final String gedung;
  final String idOrmawa;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final String kegiatan;
  final String perlengkapan;
  final String lain;
  final String status;
  final String keterangan;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String updatedBy;

  const Session({
    required this.idSession,
    required this.userId,
    required this.ruangan,
    required this.gedung,
    required this.idOrmawa,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.kegiatan,
    required this.perlengkapan,
    required this.lain,
    required this.status,
    required this.keterangan,
    required this.updatedAt,
    required this.createdAt,
    required this.updatedBy,
  });

  @override
  List<Object?> get props => [
    idSession,
    userId,
    ruangan,
    gedung,
    idOrmawa,
    startTime,
    endTime,
    date,
    kegiatan,
    perlengkapan,
    lain,
    status,
    keterangan,
    updatedAt,
    createdAt,
    updatedBy,
  ];
}
