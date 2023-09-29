
import 'package:booky_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_detail_section.dart';
import 'details_appbar.dart';
import 'similar_book_detail_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key,required  this.index});
 final int   index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context , state){
        if(state is FeaturedBooksSuccess)
          {

            return  SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           const DetailsAppBar(),
                            BookDetailsSection(index: index),
                           const Expanded(
                                child: SizedBox(
                                  height: 50,
                                )),
                            const SimilarBookDetailSection(),
                          ],
                        ),
                      ),
                    )
                  ],
                  //
                ));
          }
        else
          {
            return const CircularProgressIndicator();
          }

      }

    );
  }
}
