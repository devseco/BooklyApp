import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Features/home/data/repos/home_repo_imp.dart';
import 'package:untitled/Features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:untitled/Features/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/core/utils/app_router.dart';
import 'package:untitled/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(
          get_It.get<HomeRepoImp>(),
           )..fetchFeaturedBooks()
          ),
             BlocProvider(create: (context) => NewestBooksCubit(
            get_It.get<HomeRepoImp>(),
           )..fetchNewsBooks()
          ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
