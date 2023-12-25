import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _dataCarts = [];
  List<CartModel> get dataCarts => _dataCarts;

  set dataCarts(List<CartModel> dataCarts) {
    _dataCarts = dataCarts;
    notifyListeners();
  }

  addCart(ProductModel dataProduct) {
    if (dataProductExist(dataProduct)) {
      int index = _dataCarts
          .indexWhere((element) => element.dataProduct.id == dataProduct.id);
      _dataCarts[index].quantity++;
    } else {
      _dataCarts.add(CartModel(
          id: _dataCarts.length, dataProduct: dataProduct, quantity: 1));
    }

    notifyListeners();
  }

  removeDataCart(int id) {
    _dataCarts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _dataCarts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _dataCarts[id].quantity--;
    if (_dataCarts[id].quantity == 0) {
      _dataCarts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _dataCarts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _dataCarts) {
      total += (item.quantity * item.dataProduct.price);
    }
    return total;
  }

  dataProductExist(ProductModel dataProduct) {
    if (_dataCarts.indexWhere(
            (element) => element.dataProduct.id == dataProduct.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
