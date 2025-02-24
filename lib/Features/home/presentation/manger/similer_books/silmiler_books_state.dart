part of 'silmiler_books_cubit.dart';

sealed class SilmilerBooksState extends Equatable {
  const SilmilerBooksState();

  @override
  List<Object> get props => [];
}

final class SilmilerBooksInitial extends SilmilerBooksState {}
final class SilmilerBooksLoading extends SilmilerBooksState {}
final class SilmilerBooksSuccess extends SilmilerBooksState {
const SilmilerBooksSuccess(this.books);
  final List<BookModel> books;
}
final class SilmilerBooksFailure extends SilmilerBooksState {
 const SilmilerBooksFailure(this.errMessage);
  final String errMessage;
}