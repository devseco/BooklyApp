import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/home/data/repos/home_repo.dart';
import 'package:untitled/core/errors/failures.dart';
import 'package:untitled/core/utils/api_service.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async{
    try{
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:Programming&Filtering=free-ebook&Sorting=newest'
        );
      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
   try{
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:Programming&Filtering=free-ebook'
        );
      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerBooks({required String category}) async{
     try{
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:Programming&Filtering=free-ebook&Sorting=relevance'
        );
      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}