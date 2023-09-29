import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:booky_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bestseller_list_item.dart';

class ListViewBestSellerBloc extends StatelessWidget {
  const ListViewBestSellerBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>
      (
        builder:(context , state)
        {
            if(state is NewestBooksSuccess){
              return ListViewBestSeller(books:state.books);
            }
            if(state is NewestBooksFailure)
              {
                return Text(state.message.toString());
              }
            else
              {
                return const Center(child: CircularProgressIndicator());
              }

        }

    );
  }
}

class ListViewBestSeller extends StatelessWidget {
  const ListViewBestSeller({
    super.key,
    required this.books
  });
  final List<BookEntity>books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) =>  Padding(
          padding:const EdgeInsets.only(bottom: 10.0),
          child: BookListViewItem( image:books[index].image??'' ,author: books[index].authorName??'',
          title: books[index].title??'',rate: books[index].averageRate?? 6, index: index,
          ),
        ));
  }
}
