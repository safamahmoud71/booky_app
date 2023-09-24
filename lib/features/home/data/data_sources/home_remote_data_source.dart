import 'package:booky_app/constants.dart';
import 'package:booky_app/core/utils/api_services.dart';
import 'package:booky_app/features/home/data/model/book_model/book_model.dart';
import 'package:booky_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooks(data);
    print(books.length);
    print(data.length);
    // saveDataToBox(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&sorting=newest&q=programming');
    List<BookEntity> books = getBooks(data);
    // saveDataToBox(books, kNewestBox);
    print(books.length);
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }

    return books;
  }
}
// void saveDataToBox(List<BookEntity> books, String boxName) {
//   var box = Hive.box(boxName);
//   box.addAll(books);
// }
