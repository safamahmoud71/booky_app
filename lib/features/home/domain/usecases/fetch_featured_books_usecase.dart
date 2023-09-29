import 'package:booky_app/core/errors/failure.dart';
import 'package:booky_app/core/use_cases/use_cases.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../repo/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber =0]) async {
    // TODO: implement call

    return await homeRepo.fetchFeatureBooks(pageNumber: pageNumber);
  }

}
