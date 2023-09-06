// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// part 'book_repository.g.dart';

// @RestApi()
// abstract class BookRepository {
//   // http://$ip/book/
//   factory BookRepository(Dio dio, {String baseUrl}) = _BookRepository;

//   @GET('/')
//   paginate();

//   @GET('/')
//   getAllBooks();

//   // @GET('/{bookIdx}')
//   // Future getBookById(int bookIdx);
// }

import 'package:whoever/domain/model/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllBooks();
  Future<BookModel?> getBookByIndex();
}
