import 'package:dio/dio.dart';
import 'package:gprojuktitask/utills/app_contant.dart';

import '../dio/api_error_handeler.dart';
import '../dio/dio_client.dart';
import '../models/api_response.dart';

class ProductRepo {
  final DioClient dioClient;

  ProductRepo({required this.dioClient});

  Future<ApiResponse> getAllCategory() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(Appconstants.getAllCategory);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getProductBySlug(String slug) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(Appconstants.getProductBySlug+slug);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
