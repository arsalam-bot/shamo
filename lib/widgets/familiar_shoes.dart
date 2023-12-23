import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';

class FamiliarShoes extends StatelessWidget {
  final ProductModel dataProducts;
  const FamiliarShoes(this.dataProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(dataProducts)));
      },
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              dataProducts.galleries[0].url.toString(),
            ),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
