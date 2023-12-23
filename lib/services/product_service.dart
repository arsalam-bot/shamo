import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ProductModel>> dataProductsAtService() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> dataProducts = [];

      for (var item in data) {
        dataProducts.add(ProductModel.fromJson(item));
      }
      return dataProducts;
    } else {
      throw Exception("Data product failed to load");
    }
  }
}
