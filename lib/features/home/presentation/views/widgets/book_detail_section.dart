import 'package:booky_app/core/utils/colors.dart';
import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'book_container.dart';
import 'book_detail_button_action.dart';

import 'book_rate.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.14),
          child: const BookContainer(),
        ),
        const Text(
          'The Jungle Book',
          style: TextStyles.textStyle30,
        ),
        SizedBox(
          height: height * .01,
        ),
        Text(
          'Rudyard Kipling',
          style: TextStyles.textStyle18.copyWith(color: AppColors.grey),
        ),
        SizedBox(
          height: height * .03,
        ),
        const BookRate(
          horizontal: MainAxisAlignment.center,
        ),
        const BookDetailButtonAction(),
      ],
    );
  }
}
