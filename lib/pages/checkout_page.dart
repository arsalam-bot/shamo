import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Details",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        iconTheme: IconThemeData(color: primaryTextColor),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // Note: List Item
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List Items",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                CheckoutCard()
              ],
            ),
          ),
          // Note: Address detail
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/icon_store_location.png",
                          width: 40,
                        ),
                        Image.asset(
                          "assets/icon_line.png",
                          height: 30,
                        ),
                        Image.asset(
                          "assets/icon_your_address.png",
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Adidas Core",
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        SizedBox(height: defaultMargin),
                        Text(
                          "Your Address",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Marsemoon",
                          style: primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
