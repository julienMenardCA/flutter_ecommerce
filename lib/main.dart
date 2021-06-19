import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/tests/file_read_write_test.dart';
import 'package:flutter_ecommerce/widgets/custom_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-lcool : Le meilleur e-magasin d\'alcool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FlutterDemo(storage: CounterStorage())
      home: const CustomBottomNavigationBar(currentIndex: 0)
    );
  }
}
