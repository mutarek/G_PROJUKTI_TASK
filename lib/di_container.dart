import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gprojuktitask/data/datasource/repository/product_repo.dart';
import 'package:gprojuktitask/provider/product_provider.dart';
import 'package:gprojuktitask/utills/app_contant.dart';
import 'data/datasource/dio/dio_client.dart';
import 'data/datasource/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(Appconstants.baseUrl, sl(), loggingInterceptor: sl()));

  //new Repo
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => ProductProvider(productRepo: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
