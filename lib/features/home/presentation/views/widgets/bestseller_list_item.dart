import 'package:booky_app/core/utils/assets.dart';
import 'package:booky_app/core/utils/routes.dart';
import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'book_rate.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

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
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsImages.listViewCard))),
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
                    child: const Text(
                      'Harry Potter and the Goblet of Fire',
                      style: TextStyles.textStyle20,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'J.K. Rowling',
                    style:
                        TextStyles.textStyle14.copyWith(color: Colors.white70),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Text(
                        '19.99 €',
                        style: TextStyles.textStyle20,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      BookRate(horizontal: MainAxisAlignment.start),
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
