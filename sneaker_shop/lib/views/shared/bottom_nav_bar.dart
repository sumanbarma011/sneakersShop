import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sneaker_shop/controllers/mainscreen_provider.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/views/shared/bottom_nav_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavIcon(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 0;
                        },
                        icon: mainScreenNotifier.pageIndex == 0
                            ? Ionicons.home
                            : Ionicons.home_outline),
                    BottomNavIcon(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 1;
                        },
                        icon: Ionicons.search),
                    BottomNavIcon(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 2;
                        },
                        icon: Ionicons.add),
                    BottomNavIcon(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 3;
                        },
                        icon: mainScreenNotifier.pageIndex == 3
                            ? Ionicons.cart
                            : Ionicons.cart_outline),
                    BottomNavIcon(
                        onTap: () {
                          mainScreenNotifier.pageIndex = 4;
                        },
                        icon: mainScreenNotifier.pageIndex == 4
                            ? Ionicons.person
                            : Ionicons.person_outline)
                  ]),
            ),
          ),
        );
      },
    );
  }
}
