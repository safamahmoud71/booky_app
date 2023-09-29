import 'package:booky_app/core/utils/colors.dart';
import 'package:booky_app/core/utils/styles.dart';

import 'package:booky_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_container.dart';
import 'book_detail_button_action.dart';

import 'book_rate.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key,required this.index});
  final int  index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
  builder: (context, state) => state is NewestBooksSuccess?
     Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.14),
          child:  BookContainer(image: state.books[index].image?? ''),
        ),
         Text(
        state.books[index].title??'',
          style: TextStyles.textStyle30,
        ),
        SizedBox(
          height: height * .01,
        ),
        Text(
          state.books[index].authorName??'',
          style: TextStyles.textStyle18.copyWith(color: AppColors.grey),
        ),
        SizedBox(
          height: height * .03,
        ),
         BookRate(index: index,
          horizontal: MainAxisAlignment.center,
        ),
        const BookDetailButtonAction(),
      ],
    ): const Center(child: CircularProgressIndicator()),
);
  }
}
