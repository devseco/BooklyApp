import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Features/home/data/models/book_model/book_model.dart';
import 'package:untitled/Features/home/data/repos/home_repo.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async {
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, 
    (books){
      emit(FeaturedBooksSuccess(books));
    }
    );
  }
}
