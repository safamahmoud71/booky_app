part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
class NewestBooksPaginationFailure extends NewestBooksState{
  final String message;

  NewestBooksPaginationFailure(this.message);
}
class NewestBooksPaginationLoading extends NewestBooksState{}
class NewestBooksFailure extends NewestBooksState {
  final String message;

  NewestBooksFailure(this.message);
}
