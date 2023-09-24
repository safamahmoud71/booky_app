import 'package:flutter/material.dart';
import 'book_detail_section.dart';
import 'details_appbar.dart';
import 'similar_book_detail_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                    child: SizedBox(
                  height: 50,
                )),
                SimilarBookDetailSection(),
              ],
            ),
          ),
        )
      ],
      //
    ));
  }
}
