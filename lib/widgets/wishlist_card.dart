import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/shared/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel dataProduct;
  const WishlistCard(this.dataProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              dataProduct.galleries[0].url.toString(),
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataProduct.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text("\$${dataProduct.price}", style: priceTextStyle),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                wishlistProvider.setProduct(dataProduct);
              },
              child: Image.asset("assets/button_wishlist_blue.png", width: 34)),
        ],
      ),
    );
  }
}
