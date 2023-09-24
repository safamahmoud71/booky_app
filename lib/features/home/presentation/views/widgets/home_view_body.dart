import 'package:booky_app/core/utils/styles.dart';
import 'package:booky_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bestseller_list_view.dart';
import 'books_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CustomAppBar(),
              FeaturedBooksListViewBlocBuilder(),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 15),
                child: Text(
                  "Best Seller",
                  style: TextStyles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return const BooksListView();
        }
        if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.message.toString()));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
