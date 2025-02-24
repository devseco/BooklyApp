import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/Features/home/data/repos/home_repo_imp.dart';
import 'package:untitled/core/utils/api_service.dart';

final get_It = GetIt.instance;

void setupServiceLocator() {
  get_It.registerSingleton<ApiService>(ApiService(Dio()));
  get_It.registerSingleton<HomeRepoImp>(HomeRepoImp(
    get_It.get<ApiService>(),
  ));
}
