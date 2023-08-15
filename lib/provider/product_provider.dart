import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gprojuktitask/data/datasource/repository/product_repo.dart';
import 'package:gprojuktitask/models/categorymodel.dart';

import '../data/datasource/models/api_response.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  bool isLoading = false;

  //Geting all categories
  List<CategoryModel> categoryList = [];

  getAllCategories() async {
    isLoading = true;
    categoryList.clear();
    notifyListeners();
    ApiResponse response = await productRepo.getAllCategory();
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data['data'].forEach((element) {
        categoryList.add(CategoryModel.fromJson(element));
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }

  //get product by slug

  List<ProductModel> productList = [];

  getProductBySlug(String slug) async {
    isLoading = true;
    productList.clear();
    notifyListeners();
    ApiResponse response = await productRepo.getProductBySlug(slug);
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data['data']['data'].forEach((element) {
        productList.add(ProductModel.fromJson(element));
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }
}
