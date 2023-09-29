import 'package:bloc/bloc.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:booky_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  Future<void> featuredBooks({int pageNumber =0}) async {

   if(pageNumber==0)
     {
       emit(FeaturedBooksLoading());
     }
   else{
     emit(FeaturedBooksPaginationLoading());
   }

    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failure) {
     if(pageNumber==0 ){
       emit(FeaturedBooksFailure(failure.message));
     }else
       {
         emit(FeaturedBooksPaginationFailure(failure.message));
       }

    }, (books) {
      emit(FeaturedBooksSuccess(books));

    });
  }
}
