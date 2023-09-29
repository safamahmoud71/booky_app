import 'package:booky_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_container.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context , state){
        if(state is NewestBooksSuccess)
          {
            return SizedBox(
              height: height * .18,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: BookContainer(image: state.books[index].image??''),
                  )),
            );
          }
        else
          {
            return const CircularProgressIndicator();
          }
      }

    );
  }
}
