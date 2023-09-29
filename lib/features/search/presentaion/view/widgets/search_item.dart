import 'package:booky_app/core/utils/colors.dart';
import 'package:booky_app/features/home/presentation/views/widgets/book_details_view.dart';
import 'package:booky_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key,
        required this.image,
        required this.title,
        required this.rate,
        required this.author,
        required this.index});

  final String image;
  final String title;
  final String author;

  final num rate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailsView(index: index)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 113,
              width: 71,
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Text(
                      title,
                      style: TextStyles.textStyle20,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    author,
                    style:
                    TextStyles.textStyle14.copyWith(color: Colors.white70),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Free', style: TextStyles.textStyle20),
                      const SizedBox(
                        width: 40,
                      ),
                      BookRate(
                          horizontal: MainAxisAlignment.start, index: index),
                    ],
                  ),
                  const Divider(
                    color: AppColors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
