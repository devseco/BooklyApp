import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/home/data/repos/home_repo.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsBooks()async{
  final result = await homeRepo.fetchNewsBooks();
  result.fold((failure){
    emit(NewestBooksFailure(failure.errMessage));
  }, 
  (books){
    emit(NewestBooksSuccess(books));
  }
  );
  }
}
