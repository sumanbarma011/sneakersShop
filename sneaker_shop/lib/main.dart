import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/controllers/mainscreen_provider.dart';
import 'package:sneaker_shop/views/ui/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenNotifier(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MainScreen(),
      ),
    );
  }
}
