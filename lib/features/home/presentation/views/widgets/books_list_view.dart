import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:booky_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booky_app/features/home/presentation/views/widgets/feature_book_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BooksListView extends StatefulWidget {
  const BooksListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Add a listener to the scroll controller
    _scrollController.addListener(() async {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      // Check if the scroll position is at 70% of its length
      if (currentScroll >= maxScroll * 0.7) {
        // Trigger your request here
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .featuredBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          controller: _scrollController, // Attach the scroll controller
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) =>
              FeatureBookContainer(image: widget.books[index].image ?? 'Image Error', index: index),
        ),
      ),
    );
  }
}
