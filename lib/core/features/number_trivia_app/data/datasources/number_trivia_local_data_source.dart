import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalData {
  /// Gets the cached [numberTriviaModel] which was gotten the last time the
  /// user had an internet connection.
  ///
  /// Throws [noLocalDataException] if no cached data is present.
  Future <NumberTriviaModel> getLastNumberTrivia();

  Future <void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}