import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';

class FamiliarShoes extends StatelessWidget {
  final ProductModel dataProducts;
  const FamiliarShoes(this.dataProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      // margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            dataProducts.galleries[0].url.toString(),
          ),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
