import 'package:shamo/models/product_model.dart';

class CartModel {
  int id;
  ProductModel dataProduct;
  int quantity;

  CartModel({
    required this.id,
    required this.dataProduct,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      dataProduct: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': dataProduct.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return dataProduct.price * quantity;
  }
}
