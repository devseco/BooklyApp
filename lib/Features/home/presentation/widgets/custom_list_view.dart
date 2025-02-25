import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:untitled/core/widgets/custom_error_widget.dart';
import 'package:untitled/core/widgets/custom_loading_indicator.dart';
import 'custom_book_image.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail ,
                  ),
                );
              }),
        );
        }else if (state is FeaturedBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
