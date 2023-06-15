import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mipoka/mipoka/data/data_sources/mipoka_data_sources.dart';
import 'package:mipoka/mipoka/data/repositories/mipoka_repositories_impl.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';
import 'package:mipoka/mipoka/domain/use_cases/berita_use_case.dart';
import 'package:mipoka/mipoka/presentation/bloc/berita_bloc/berita_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // EXTERNAL
  locator.registerLazySingleton<Client>(() => Client());

  // BLOC
  locator.registerFactory(() => BeritaBloc(beritaUseCase: locator()));
  // USE CASE
  locator.registerLazySingleton(() => BeritaUseCase(mipokaRepositories: locator()));

  // REPOSITORIES
  locator.registerLazySingleton<MipokaRepositories>(() =>
      MipokaRepositoriesImpl(mipokaDataSources: locator()),
  );

  // DATA SOURCES
  locator.registerLazySingleton<MipokaDataSources>(() =>
      MipokaDataSourcesImpl(client: locator()),
  );
}