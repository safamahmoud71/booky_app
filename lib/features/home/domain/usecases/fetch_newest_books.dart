import 'package:booky_app/core/errors/failure.dart';
import 'package:booky_app/core/use_cases/use_cases.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../repo/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParameter> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParameter ?p]) async {
    // TODO: implement call

    return await homeRepo.fetchNewestBooks();
  }
}
