import 'package:hive/hive.dart';
part 'book_entity.g.dart';

//@HiveType(typeId: 0)
class BookEntity {
  // @HiveField(0)
  final String? bookID;
//  @HiveField(1)
  final String? image;
  // @HiveField(2)
  final String? title;
  //@HiveField(3)
  final num? price;
  //@HiveField(4)
  final int? rate;
  // @HiveField(5)
  final String? authorName;

  BookEntity(
      {required this.title,
      required this.bookID,
      required this.price,
      required this.image,
      required this.authorName,
      required this.rate});
}
