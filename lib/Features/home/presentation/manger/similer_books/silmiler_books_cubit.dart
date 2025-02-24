import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';
part 'silmiler_books_state.dart';

class SilmilerBooksCubit extends Cubit<SilmilerBooksState> {
  SilmilerBooksCubit(this.homeRepo) : super(SilmilerBooksInitial());
   final HomeRepo homeRepo;
  Future<void> fetchSimilerBooks(String category)async{
  final result = await homeRepo.fetchSimilerBooks(category: category);
  result.fold((failure){
    emit(SilmilerBooksFailure(failure.errMessage));
  }, 
  (books){
    emit(SilmilerBooksSuccess(books));
  }
  );
  }
}
