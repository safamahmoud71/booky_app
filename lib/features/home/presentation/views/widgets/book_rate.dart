import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, required this.horizontal, required this.rate});
  final MainAxisAlignment horizontal;
  final num rate ;
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
         Text(
          '$rate',
          style: TextStyles.textStyle16,
        ),


      ],
    );
  }
}
