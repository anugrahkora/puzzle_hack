import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/bindings/puzzle_controller_binding.dart';
import 'package:puzzle_hack/views/puzzle_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: PuzzleControllerBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      home: const PuzzleViewScreen(),
    );
  }
}
