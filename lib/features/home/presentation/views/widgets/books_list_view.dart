import 'package:flutter/material.dart';

import 'book_container.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * .3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const BookContainer()),
      ),
    );
  }
}
