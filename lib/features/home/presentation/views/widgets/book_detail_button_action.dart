import 'package:booky_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class BookDetailButtonAction extends StatelessWidget {
  const BookDetailButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomButton(
            backgroundColor: AppColors.white,
            textColor: AppColors.black,
            text: '19.99€',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))),
        CustomButton(
            backgroundColor: AppColors.orange,
            textColor: AppColors.white,
            text: 'Free preview',
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
      ],
    );
  }
}
