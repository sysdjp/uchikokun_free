import 'package:flutter/material.dart';
import 'package:uchikokun_free/toppage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(), //← これでダークテーマ固定
      home: const TopPage(),
    );
  }
}
