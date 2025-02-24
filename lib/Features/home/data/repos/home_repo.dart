import 'package:dartz/dartz.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/core/errors/failures.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<BookModel>>> fetchNewsBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BookModel>>> fetchSimilerBooks({required String category});
}