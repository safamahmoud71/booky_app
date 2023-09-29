import 'package:booky_app/core/utils/styles.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
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
          child: ListViewBestSellerBloc(),
        )
      ],
    );
  }
}

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity>books=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) => {
        if(state is FeaturedBooksSuccess)
        {
          books.addAll(state.books)
        },
         if(state is FeaturedBooksPaginationFailure)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ))
          }

      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess|| state is FeaturedBooksPaginationLoading ||state is FeaturedBooksPaginationFailure) {
          return  BooksListView(
            books:books,
          );
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
