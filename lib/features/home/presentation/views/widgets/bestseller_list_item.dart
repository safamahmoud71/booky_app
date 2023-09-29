
import 'package:booky_app/core/utils/routes.dart';
import 'package:booky_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'book_rate.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.image , required this.title,
  required this.rate, required this.price, required this.author, required this.index});

  final String image;
  final String title;
  final String author;
  final num price;
  final num rate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetails);
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
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage( imageUrl: image, fit: BoxFit.fill,),
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
                    child:  Text(
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
                      Text(
                        '$price €',
                        style: TextStyles.textStyle20,
                      ),
                    const  SizedBox(
                        width: 40,
                      ),
                      BookRate(horizontal: MainAxisAlignment.start, rate: rate),
                    ],
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
