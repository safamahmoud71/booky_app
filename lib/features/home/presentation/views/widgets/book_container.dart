import 'package:booky_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsImages.listViewCard))),
      ),
    );
  }
}
