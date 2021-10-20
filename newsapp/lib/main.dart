import 'package:flutter/material.dart';
import 'package:newsapp/binding/news_binding.dart';
import 'package:newsapp/view/home_view.dart';

void main() {
  runApp(const MyApp());
  NewsBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView());
  }
}
