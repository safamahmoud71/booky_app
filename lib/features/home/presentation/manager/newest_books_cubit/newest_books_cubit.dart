import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/domain/usecases/fetch_newest_books.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase newestBooksUseCase;


  Future<void> newestBooks() async {



    var result = await newestBooksUseCase.call();
    result.fold((failure) {
      print(failure.message.toString());
    emit(NewestBooksFailure(failure.message.toString()));
    }, (books) {
      emit(NewestBooksSuccess(books));

    });
  }
}
