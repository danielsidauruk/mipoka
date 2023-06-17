import 'package:dartz/dartz.dart';
import 'package:mipoka/core/exception.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/models/admin_model.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';
import 'package:mipoka/mipoka/data/models/biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/lampiran_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/lampiran_model.dart';
import 'package:mipoka/mipoka/data/models/laporan_model.dart';
import 'package:mipoka/mipoka/data/models/ormawa_model.dart';
import 'package:mipoka/mipoka/data/models/panitia_peserta_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/partisipan_model.dart';
import 'package:mipoka/mipoka/data/models/periode_model.dart';
import 'package:mipoka/mipoka/data/models/peserta_model.dart';
import 'package:mipoka/mipoka/data/models/prestasi_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_biaya_kegiatan_model.dart';
import 'package:mipoka/mipoka/data/models/rincian_laporan_model.dart';
import 'package:mipoka/mipoka/data/models/riwayat_mpt_model.dart';
import 'package:mipoka/mipoka/data/models/session_model.dart';
import 'package:mipoka/mipoka/data/models/tertib_acara_model.dart';
import 'package:mipoka/mipoka/data/models/user_model.dart';
import 'package:mipoka/mipoka/data/models/usulan_kegiatan_model.dart';
import 'package:mipoka/mipoka/domain/entities/admin.dart';
import 'package:mipoka/mipoka/domain/entities/berita.dart';
import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran.dart';
import 'package:mipoka/mipoka/domain/entities/lampiran_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/laporan.dart';
import 'package:mipoka/mipoka/domain/entities/ormawa.dart';
import 'package:mipoka/mipoka/domain/entities/panitia_peserta_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/periode.dart';
import 'package:mipoka/mipoka/domain/entities/peserta.dart';
import 'package:mipoka/mipoka/domain/entities/prestasi.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/rincian_laporan.dart';
import 'package:mipoka/mipoka/domain/entities/riwayat_mpt.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';
import 'package:mipoka/mipoka/domain/entities/user.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class MipokaRepositoriesImpl implements MipokaRepositories {
  final MipokaDataSources mipokaDataSources;

  MipokaRepositoriesImpl({required this.mipokaDataSources});

  // => Berita Repositories
  @override
  Future<Either<Failure, String>> createBerita(Berita berita) async {
    try {
      return Right(
          await mipokaDataSources.createBerita(BeritaModel.fromEntity(berita)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Berita>>> readBerita() async {
    try {
      return Right(await mipokaDataSources.readBerita());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateBerita(Berita berita) async {
    try {
      return Right(
          await mipokaDataSources.updateBerita(BeritaModel.fromEntity(berita)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteBerita(int beritaId) async {
    try {
      return Right(await mipokaDataSources.deleteBerita(beritaId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Admin Repositories
  @override
  Future<Either<Failure, String>> createAdmin(Admin admin) async {
    try {
      return Right(
        await mipokaDataSources.createAdmin(AdminModel.fromEntity(admin)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Admin>>> readAdmin() async {
    try {
      return Right(await mipokaDataSources.readAdmin());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateAdmin(Admin admin) async {
    try {
      return Right(await mipokaDataSources.updateAdmin(AdminModel.fromEntity(admin)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteAdmin(int adminId) async {
    try {
      return Right(await mipokaDataSources.deleteAdmin(adminId));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // => Biaya Kegiatan
  @override
  Future<Either<Failure, String>> createBiayaKegiatan(BiayaKegiatan biayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.createBiayaKegiatan(BiayaKegiatanModel.fromEntity(biayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BiayaKegiatan>>> readBiayaKegiatan() async {
    try {
      return Right(await mipokaDataSources.readBiayaKegiatan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateBiayaKegiatan(BiayaKegiatan biayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateBiayaKegiatan(BiayaKegiatanModel.fromEntity(biayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteBiayaKegiatan(int idNamaBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteBiayaKegiatan(idNamaBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Kegiatan
  @override
  Future<Either<Failure, String>> createKegiatan(Kegiatan kegiatan) async {
    try {
      return Right(await mipokaDataSources.createKegiatan(KegiatanModel.fromEntity(kegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Kegiatan>>> readKegiatan() async {
    try {
      return Right(await mipokaDataSources.readKegiatan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateKegiatan(Kegiatan kegiatan) async {
    try {
      return Right(await mipokaDataSources.updateKegiatan(KegiatanModel.fromEntity(kegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteKegiatan(int idKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteKegiatan(idKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Lampiran Laporan
  @override
  Future<Either<Failure, String>> createLampiranLaporan(LampiranLaporan lampiranLaporan) async {
    try {
      return Right(await mipokaDataSources.createLampiranLaporan(LampiranLaporanModel.fromEntity(lampiranLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<LampiranLaporan>>> readLampiranLaporan() async {
    try {
      return Right(await mipokaDataSources.readLampiranLaporan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateLampiranLaporan(LampiranLaporan lampiranLaporan) async {
    try {
      return Right(await mipokaDataSources.updateLampiranLaporan(LampiranLaporanModel.fromEntity(lampiranLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteLampiranLaporan(int idLampiranLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteLampiranLaporan(idLampiranLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Lampiran
  @override
  Future<Either<Failure, String>> createLampiran(Lampiran lampiran) async {
    try {
      return Right(await mipokaDataSources.createLampiran(LampiranModel.fromEntity(lampiran)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Lampiran>>> readLampiran() async {
    try {
      return Right(await mipokaDataSources.readLampiran());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateLampiran(Lampiran lampiran) async {
    try {
      return Right(await mipokaDataSources.updateLampiran(LampiranModel.fromEntity(lampiran)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteLampiran(int idLampiran) async {
    try {
      return Right(await mipokaDataSources.deleteLampiran(idLampiran));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Laporan
  @override
  Future<Either<Failure, String>> createLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources.createLaporan(LaporanModel.fromEntity(laporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, List<Laporan>>> readLaporan() async {
    try {
      return Right(await mipokaDataSources.readLaporan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateLaporan(Laporan laporan) async {
    try {
      return Right(await mipokaDataSources.updateLaporan(LaporanModel.fromEntity(laporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, String>> deleteLaporan(int idLaporan) async {
    try {
      return Right(await mipokaDataSources.deleteLaporan(idLaporan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Ormawa
  @override
  Future<Either<Failure, String>> createOrmawa(Ormawa ormawa) async {
    try {
      return Right(await mipokaDataSources.createOrmawa(OrmawaModel.fromEntity(ormawa)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Ormawa>>> readOrmawa() async {
    try {
      return Right(await mipokaDataSources.readOrmawa());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateOrmawa(Ormawa ormawa) async {
    try {
      return Right(await mipokaDataSources.updateOrmawa(OrmawaModel.fromEntity(ormawa)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteOrmawa(int idOrmawa) async {
    try {
      return Right(await mipokaDataSources.deleteOrmawa(idOrmawa));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Panitia Peserta Laporan
  @override
  Future<Either<Failure, String>> createPanitiaPesertaLaporan(PanitiaPesertaLaporan panitiaPesertaL) async {
    try {
      return Right(await mipokaDataSources.createPanitiaPesertaL(PanitiaPesertaLaporanModel.fromEntity(panitiaPesertaL)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PanitiaPesertaLaporan>>> readPanitiaPesertaLaporan() async {
    try {
      return Right(await mipokaDataSources.readPanitiaPesertaL());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePanitiaPesertaLaporan(PanitiaPesertaLaporan panitiaPesertaL) async {
    try {
      return Right(await mipokaDataSources.updatePanitiaPesertaL(PanitiaPesertaLaporanModel.fromEntity(panitiaPesertaL)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePanitiaPesertaLaporan(int idPanitiaPesertaL) async {
    try {
      return Right(await mipokaDataSources.deletePanitiaPesertaL(idPanitiaPesertaL));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Partisipan
  @override
  Future<Either<Failure, String>> createPartisipan(Partisipan partisipan) async {
    try {
      return Right(await mipokaDataSources.createPartisipan(PartisipanModel.fromEntity(partisipan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Partisipan>>> readPartisipan() async {
    try {
      return Right(await mipokaDataSources.readPartisipan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePartisipan(Partisipan partisipan) async {
    try {
      return Right(await mipokaDataSources.updatePartisipan(PartisipanModel.fromEntity(partisipan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePartisipan(int idPartisipan) async {
    try {
      return Right(await mipokaDataSources.deletePartisipan(idPartisipan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }



  // => Periode
  @override
  Future<Either<Failure, String>> createPeriode(Periode periode) async {
    try {
      return Right(await mipokaDataSources.createPeriode(PeriodeModel.fromEntity(periode)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Periode>>> readPeriode() async {
    try {
      return Right(await mipokaDataSources.readPeriode());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePeriode(Periode periode) async {
    try {
      return Right(await mipokaDataSources.updatePeriode(PeriodeModel.fromEntity(periode)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePeriode(int idPeriode) async {
    try {
      return Right(await mipokaDataSources.deletePeriode(idPeriode));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Peserta
  @override
  Future<Either<Failure, String>> createPeserta(Peserta peserta) async {
    try {
      return Right(await mipokaDataSources.createPeserta(PesertaModel.fromEntity(peserta)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Peserta>>> readPeserta() async {
    try {
      return Right(await mipokaDataSources.readPeserta());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePeserta(Peserta peserta) async {
    try {
      return Right(await mipokaDataSources.updatePeserta(PesertaModel.fromEntity(peserta)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePeserta(int idPeserta) async {
    try {
      return Right(await mipokaDataSources.deletePeserta(idPeserta));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Prestasi
  @override
  Future<Either<Failure, String>> createPrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources.createPrestasi(PrestasiModel.fromEntity(prestasi)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Prestasi>>> readPrestasi() async {
    try {
      return Right(await mipokaDataSources.readPrestasi());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updatePrestasi(Prestasi prestasi) async {
    try {
      return Right(await mipokaDataSources.updatePrestasi(PrestasiModel.fromEntity(prestasi)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deletePrestasi(int idPrestasi) async {
    try {
      return Right(await mipokaDataSources.deletePrestasi(idPrestasi));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Rincian Biaya Kegiatan
  @override
  Future<Either<Failure, String>> createRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.createRincianBiayaKegiatan(RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RincianBiayaKegiatan>>> readRincianBiayaKegiatan() async {
    try {
      return Right(await mipokaDataSources.readRincianBiayaKegiatan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateRincianBiayaKegiatan(
      RincianBiayaKegiatan rincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateRincianBiayaKegiatan(RincianBiayaKegiatanModel.fromEntity(rincianBiayaKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteRincianBiayaKegiatan(
      int idRincianBiayaKegiatan) async {
    try {
      return Right(await mipokaDataSources.deleteRincianBiayaKegiatan(idRincianBiayaKegiatan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Rincian Laporan
  @override
  Future<Either<Failure, String>> createRincianLaporan(
      RincianLaporan rincianLaporan) async {
    try {
      return Right(await mipokaDataSources.createRincianLaporan(RincianLaporanModel.fromEntity(rincianLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RincianLaporan>>> readRincianLaporan() async {
    try {
      return Right(await mipokaDataSources.readRincianLaporan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateRincianLaporan(
      RincianLaporan rincianLaporan) async {
    try {
      return Right(await mipokaDataSources.updateRincianLaporan(RincianLaporanModel.fromEntity(rincianLaporan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteRincianLaporan(int idRincianL) async {
    try {
      return Right(await mipokaDataSources.deleteRincianLaporan(idRincianL));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Riwayat MPT
  @override
  Future<Either<Failure, String>> createRiwayatMpt(RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources.createRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<RiwayatMpt>>> readRiwayatMpt() async {
    try {
      return Right(await mipokaDataSources.readRiwayatMpt());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateRiwayatMpt(RiwayatMpt riwayatMpt) async {
    try {
      return Right(await mipokaDataSources.updateRiwayatMpt(RiwayatMptModel.fromEntity(riwayatMpt)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteRiwayatMpt(int idRiwayatMpt) async {
    try {
      return Right(await mipokaDataSources.deleteRiwayatMpt(idRiwayatMpt));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Session
  @override
  Future<Either<Failure, String>> createSession(Session session) async {
    try {
      return Right(await mipokaDataSources.createSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Session>>> readSession() async {
    try {
      return Right(await mipokaDataSources.readSession());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateSession(Session session) async {
    try {
      return Right(await mipokaDataSources.updateSession(SessionModel.fromEntity(session)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteSession(int idSession) async {
    try {
      return Right(await mipokaDataSources.deleteSession(idSession));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Tertib Acara
  @override
  Future<Either<Failure, String>> createTertibAcara(TertibAcara tertibAcara) async {
    try {
      return Right(await mipokaDataSources.createTertibAcara(TertibAcaraModel.fromEntity(tertibAcara)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TertibAcara>>> readTertibAcara() async {
    try {
      return Right(await mipokaDataSources.readTertibAcara());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateTertibAcara(TertibAcara tertibAcara) async {
    try {
      return Right(await mipokaDataSources.updateTertibAcara(TertibAcaraModel.fromEntity(tertibAcara)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteTertibAcara(int idTertibAcara) async {
    try {
      return Right(await mipokaDataSources.deleteTertibAcara(idTertibAcara));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => User
  @override
  Future<Either<Failure, String>> createUser(User user) async {
    try {
      return Right(await mipokaDataSources.createUser(UserModel.fromEntity(user)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> readUser() async {
    try {
      return Right(await mipokaDataSources.readUser());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateUser(User user) async {
    try {
      return Right(await mipokaDataSources.updateUser(UserModel.fromEntity(user)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser(int idUser) async {
    try {
      return Right(await mipokaDataSources.deleteUser(idUser));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }


  // => Usulan

  @override
  Future<Either<Failure, String>> createUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.createUsulanKegiatan(UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UsulanKegiatan>>> readUsulanKegiatan() async {
    try {
      return Right(await mipokaDataSources.readUsulanKegiatan());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteUsulanKegiatan(int idUsulan) async {
    try {
      return Right(await mipokaDataSources.deleteUsulanKegiatan(idUsulan));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateUsulanKegiatan(
      UsulanKegiatan usulanKegiatan) async {
    try {
      return Right(await mipokaDataSources.updateUsulanKegiatan(UsulanKegiatanModel.fromEntity(usulanKegiatan)));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
