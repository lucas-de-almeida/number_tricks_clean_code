import 'package:flutter/cupertino.dart';
import 'package:trivial_number/core/paltaform/network_info.dart';
import 'package:trivial_number/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:trivial_number/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:trivial_number/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivial_number/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:trivial_number/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    networkInfo.isConnected;
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
