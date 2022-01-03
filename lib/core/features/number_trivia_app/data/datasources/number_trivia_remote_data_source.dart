import 'package:number_trivia_app/core/features/number_trivia_app/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  /// Calls http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}