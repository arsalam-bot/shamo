import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _dataWishlist = [];

  List<ProductModel> get dataWishlist => _dataWishlist;

  set dataWishlist(List<ProductModel> dataWishlist) {
    _dataWishlist = dataWishlist;
    notifyListeners();
  }

  setProduct(ProductModel dataProduct) {
    if (!isWishlist(dataProduct)) {
      _dataWishlist.add(dataProduct);
      notifyListeners();
    } else {
      _dataWishlist.removeWhere((element) => element.id == dataProduct.id);
      notifyListeners();
    }
  }

  isWishlist(ProductModel dataProduct) {
    if (_dataWishlist.indexWhere((element) => element.id == dataProduct.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
