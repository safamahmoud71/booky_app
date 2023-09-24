import 'package:booky_app/core/utils/colors.dart';

import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';
import 'search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: SearchTextField(),
          ),
          Expanded(child: SearchListView())
        ],
      ),
    );
  }
}
