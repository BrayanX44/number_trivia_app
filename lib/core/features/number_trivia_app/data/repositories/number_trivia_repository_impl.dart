import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/core/error/exceptions.dart';
import 'package:number_trivia_app/core/error/failures.dart';
import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia_app/core/platform/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalData localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
        await remoteDataSource.getConcreteNumberTrivia(number);
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    else{
      try{
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return right(localTrivia);
      } on CacheException{return left(CacheFailure());}
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {

    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
        await remoteDataSource.getRandomNumberTrivia();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    else{
      try{
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return right(localTrivia);
      } on CacheException{return left(CacheFailure());
      }
    }
  }

}