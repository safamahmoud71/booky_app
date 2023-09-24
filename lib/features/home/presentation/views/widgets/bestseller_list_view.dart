import 'package:flutter/material.dart';

import 'bestseller_list_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: BookListViewItem(),
            ));
  }
}
