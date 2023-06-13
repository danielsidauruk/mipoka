import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/repositories/mipoka_repositories_impl.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';
import 'package:mipoka/mipoka/domain/use_cases/read_berita.dart';
import 'package:mipoka/mipoka/presentation/bloc/read_berita_bloc/read_berita_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // EXTERNAL
  locator.registerLazySingleton<Client>(() => Client());

  // BLOC
  locator.registerFactory(() => ReadBeritaBloc(readBerita: locator()));
  // USE CASE
  locator.registerLazySingleton(() => ReadBerita(mipokaRepositories: locator()));

  // REPOSITORIES
  locator.registerLazySingleton<MipokaRepositories>(() =>
      MipokaRepositoriesImpl(mipokaDataSources: locator()),
  );

  // DATA SOURCES
  locator.registerLazySingleton<MipokaDataSources>(() =>
      MipokaDataSourcesImpl(client: locator()),
  );
}