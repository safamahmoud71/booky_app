import 'package:booky_app/core/errors/failure.dart';
import 'package:booky_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booky_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:booky_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      List<BookEntity> books;
      // //books = homeLocalDataSource.fetchFeatureBooks();
      // if (books.isNotEmpty) {
      //   return right(books);
      // }
      books = await homeRemoteDataSource.fetchFeatureBooks();
      print(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
