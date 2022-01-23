import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/components/puzzle_box.dart';
import 'package:puzzle_hack/constants.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

List<Widget> generatePuzzleContainers(double maxWidth, Size size) {
  final puzzleController = Get.find<PuzzleController>();
  final length = puzzleController.data.length;
  var rows = sqrt(length).ceil();
  var div = (maxWidth - padding) / rows;
  return List.generate(length, (index) {
    puzzleController.setOffset(index);
    return Obx(
      () => PuzzleBox(
        number: puzzleController.data[index],
        offset: puzzleController.offsets[index],
        positon: Offset(
          puzzleController.getXPosition(
              puzzleController.offsets[index].dx, div),
          puzzleController.getYPosition(
              puzzleController.offsets[index].dy, div),
        ),
        maxWidth: maxWidth,
        onTapUp: (TapUpDetails details) => puzzleController.onTapUp(
            details, puzzleController.offsets[index], index),
        onTapDown: (TapDownDetails details) =>
            puzzleController.onTapDown(details),
        onVerticalDragUpdate: (DragUpdateDetails details) =>
            puzzleController.onVerticalDragUpdate(
                details, puzzleController.offsets[index], index),
        onVerticalDragStart: (DragStartDetails details) =>
            puzzleController.onVerticalDragStart(
                details, puzzleController.offsets[index], index),
        onVerticalDragDown: (DragDownDetails details) =>
            puzzleController.onVerticalDragDown(details),
        onVerticalDragEnd: (DragEndDetails details) =>
            puzzleController.onVerticalDragEnd(
          details,
        ),
        onHorizontalDragUpdate: (DragUpdateDetails details) =>
            puzzleController.onHorizontalDragUpdate(
                details, puzzleController.offsets[index], index),
        onHorizontalDragStart: (DragStartDetails details) =>
            puzzleController.onHorizontalDragStart(details),
        onHorizontalDragDown: (DragDownDetails details) =>
            puzzleController.onHorizontalDragDown(details),
        onHorizontalDragEnd: (DragEndDetails details) =>
            puzzleController.onHorizontalDragEnd(
          details,
        ),
      ),
    );
  });
}
