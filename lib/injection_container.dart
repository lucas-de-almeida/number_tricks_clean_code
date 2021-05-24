import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivial_number/core/network/network_info.dart';
import 'package:trivial_number/core/util/input_converter.dart';
import 'package:trivial_number/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:trivial_number/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:trivial_number/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:trivial_number/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivial_number/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:trivial_number/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:trivial_number/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      random: sl(),
      inputConverter: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  final sharedPreferenfces = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => SharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
