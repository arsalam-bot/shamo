import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/shared/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel dataCart;
  const CartCard(this.dataCart, {super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        dataCart.dataProduct.galleries[0].url.toString()),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataCart.dataProduct.name,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      "\$${dataCart.dataProduct.price}",
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(dataCart.id);
                    },
                    child: Image.asset(
                      "assets/button_add.png",
                      width: 16,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    dataCart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(dataCart.id);
                    },
                    child: Image.asset(
                      "assets/button_min.png",
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeDataCart(dataCart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icon_trash.png",
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Remove",
                  style:
                      alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
