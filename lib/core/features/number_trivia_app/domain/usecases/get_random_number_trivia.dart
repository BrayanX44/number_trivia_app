import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/core/error/failures.dart';
import 'package:number_trivia_app/core/features/number_trivia_app/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/core/features/number_trivia_app/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia_app/core/usecases/usecase.dart';

abstract class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call (NoParams params) async{
    return await repository.getRandomNumberTrivia();
  }
}

