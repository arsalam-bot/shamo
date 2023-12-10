import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
        backgroundColor: secondaryColor,
      );
    }

    // Widget customBottomNav() {
    //   return BottomNavigationBar(
    //     backgroundColor: backgroundColor4,
    //     type: BottomNavigationBarType.fixed,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Image.asset("assets/icon_home.png", width: 21),
    //         label: "",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset("assets/icon_chat.png", width: 20),
    //         label: "",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset("assets/icon_wishlist.png", width: 20),
    //         label: "",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Image.asset("assets/icon_profile.png", width: 18),
    //         label: "",
    //       ),
    //     ],
    //   );
    // }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          padding: EdgeInsets.all(0),
          color: backgroundColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_home.png",
                  width: 21,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_chat.png",
                  width: 20,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_wishlist.png",
                  width: 20,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_profile.png",
                  width: 18,
                ),
                label: "",
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: Center(
        child: Text('Main Page'),
      ),
    );
  }
}
