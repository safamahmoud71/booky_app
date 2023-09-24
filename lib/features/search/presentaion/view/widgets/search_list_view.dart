import 'package:booky_app/features/home/presentation/views/widgets/bestseller_list_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: BookListViewItem(),
            ));
  }
}
