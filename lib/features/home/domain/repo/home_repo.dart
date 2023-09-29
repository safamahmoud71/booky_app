import 'package:booky_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks({int pageNumber=0}); //use case
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(); //use case
}
