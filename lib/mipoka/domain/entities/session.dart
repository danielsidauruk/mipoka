import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';

class Session extends Equatable {
  final int idSession;
  final int userId;
  final String ruangan;
  final String gedung;
  final int idOrmawa;
  final String startTime;
  final String endTime;
  final DateTime date;
  final String kegiatan;
  final String perlengkapan;
  final String lain;
  final String status;
  final String keterangan;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String updatedBy;
  final MipokaUser user;

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
    required this.user,
  });

  Session copyWith({
    int? idSession,
    int? userId,
    String? ruangan,
    String? gedung,
    int? idOrmawa,
    String? startTime,
    String? endTime,
    DateTime? date,
    String? kegiatan,
    String? perlengkapan,
    String? lain,
    String? status,
    String? keterangan,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? updatedBy,
    MipokaUser? user,
  }) =>
      Session(
        idSession: idSession ?? this.idSession,
        userId: userId ?? this.userId,
        ruangan: ruangan ?? this.ruangan,
        gedung: gedung ?? this.gedung,
        idOrmawa: idOrmawa ?? this.idOrmawa,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        date: date ?? this.date,
        kegiatan: kegiatan ?? this.kegiatan,
        perlengkapan: perlengkapan ?? this.perlengkapan,
        lain: lain ?? this.lain,
        status: status ?? this.status,
        keterangan: keterangan ?? this.keterangan,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedBy: updatedBy ?? this.updatedBy,
        user: user ?? this.user,
      );

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
    user,
  ];
}

