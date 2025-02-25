import 'package:flutter/material.dart';
import 'package:izmir_bb_hal_fiyatlari/pages/categoryFullListPage/list_page.dart';
import 'pages/HomePage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
          )),
      home: const HomePage(),
    );
  }
}
