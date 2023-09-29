
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill,)),
      ),
    );
  }
}
