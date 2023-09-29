import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'book_details_view.dart';
class FeatureBookContainer extends StatelessWidget {
  const FeatureBookContainer({super.key, required this.image, required this.index});
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => BookDetailsView(index: index))
        );},
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}