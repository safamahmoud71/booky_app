import 'package:flutter/material.dart';
import 'book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key  ,required  this.index});
 final int index ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(index: index),
    );
  }
}
