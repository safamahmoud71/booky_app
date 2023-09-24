import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/domain/usecases/fetch_newest_books.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooks) : super(NewestBooksInitial());
  final FetchNewestBooks fetchNewestBooks;
  Future<void> newestBooks() async {
    var result = await fetchNewestBooks.call();
    result.fold((l) {
      print(result);
      emit(NewestBooksFailure(l.toString()));
    }, (books) {
      emit(NewestBooksSuccess(books));
      print('book==> $books');
    });
  }
}
