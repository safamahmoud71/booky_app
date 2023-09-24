import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, required this.horizontal});
  final MainAxisAlignment horizontal;
  @override
  Widget build(BuildContext context) {
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
        const Text(
          "4.8",
          style: TextStyles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "(2390)",
          style: TextStyles.textStyle14.copyWith(
            color: const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
