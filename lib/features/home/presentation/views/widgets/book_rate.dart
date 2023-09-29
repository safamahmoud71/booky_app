import 'package:booky_app/core/utils/styles.dart';
import 'package:booky_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, required this.horizontal, required this.index});

  final MainAxisAlignment horizontal;

  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
      if(state is NewestBooksSuccess)
        {
          return Row(
            mainAxisAlignment: horizontal,
            children: [
              const Icon(
                Icons.star,
                color: Color(0xffffdd4f),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '${state.books[index].averageRate}' ,
                style: TextStyles.textStyle16,
              ),


            ],
          );
        }
      else
        {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
