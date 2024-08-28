import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter/pages/home_page.dart';

void main() async {

  //initial the hive database to store the new tasks
  await Hive.initFlutter();

  //open a box
  var box=await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow, //sets primary color
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          centerTitle: true,
        )
      ),
    );
  }
}

