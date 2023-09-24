import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:booky_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  Future<void> featuredBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure) {
      print(failure.message.toString());
      print(result);
      emit(FeaturedBooksFailure(failure.toString()));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
      print(books.length);
    });
  }
}
