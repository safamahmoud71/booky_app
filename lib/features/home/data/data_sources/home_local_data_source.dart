import 'package:booky_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  // List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplemenation extends HomeLocalDataSource {
  @override
  // List<BookEntity> fetchFeatureBooks() {
  //  // var box = Hive.box<BookEntity>(kFeaturedBox);
  //  // return box.values.toList();
  //  return ;
  // }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
