import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hallo, Alam",
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "@alammmmm",
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/image_profile.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget header() {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        // category(),
        // popularProduct(),
        // newArrivals(),
      ],
    );
  }
}
