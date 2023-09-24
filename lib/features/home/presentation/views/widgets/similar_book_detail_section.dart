import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'similar_book_list_view.dart';

class SimilarBookDetailSection extends StatelessWidget {
  const SimilarBookDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style:
                  TextStyles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            )),
        const SizedBox(
          height: 18,
        ),
        const SimilarBookListView()
      ],
    );
  }
}
