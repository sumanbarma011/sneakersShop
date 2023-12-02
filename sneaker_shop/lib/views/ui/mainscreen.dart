import 'package:flutter/material.dart';
import 'package:sneaker_shop/controllers/mainscreen_provider.dart';
import 'package:sneaker_shop/views/shared/bottom_nav_bar.dart';
import 'package:sneaker_shop/views/ui/cart_page.dart';
import 'package:sneaker_shop/views/ui/home_page.dart';
import 'package:sneaker_shop/views/ui/profile_page.dart';
import 'package:sneaker_shop/views/ui/search_page.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    const CartPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
