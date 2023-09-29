import 'package:booky_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNumber =0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplemenation extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks({int pageNumber =0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    int length = box.values.length;
    if(startIndex>=length|| endIndex>length)
      {
        return [];
      }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    var box = Hive.box<BookEntity>(kNewestBox);

    return box.values.toList();

  }
}
