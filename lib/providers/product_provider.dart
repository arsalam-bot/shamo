import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _dataProducts = [];
  List<ProductModel> get dataProducts => _dataProducts;
  set dataProducts(List<ProductModel> dataProducts) {
    _dataProducts = dataProducts;
    notifyListeners();
  }

  Future<void> dataProductsAtProvider() async {
    try {
      List<ProductModel> dataProducts =
          await ProductService().dataProductsAtService();
      _dataProducts = dataProducts;
    } catch (e) {
      print(e);
    }
  }
}
