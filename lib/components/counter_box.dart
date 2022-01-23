import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

Container counterBox() {
  final puzzleController = Get.find<PuzzleController>();

  return Container(
    padding: const EdgeInsets.all(8.0),
    width: 200.0,
    height: 50,
    color: Colors.blue,
    child: Center(
      child: Obx(() => Text(puzzleController.count.value.toString())),
    ),
  );
}
