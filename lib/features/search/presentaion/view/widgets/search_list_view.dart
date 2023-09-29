import 'package:booky_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess)
          {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) =>
                 Padding(
                  padding:const  EdgeInsets.only(bottom: 10.0),
                  child: SearchItem(author: state.books[index].authorName??'', index:index , image: state.books[index].image??'',
                    title: state.books[index].title??'',rate: state.books[index].rate ?? 0,
                  ),
                  // child: BookListViewItem(),
                ));
          }
        else
          {
            return const CircularProgressIndicator();
          }

      },
    );
  }
}
