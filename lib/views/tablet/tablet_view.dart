import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/components/puzzle_box.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  _TabletViewState createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  final padding = 16.0;
  final puzzleController = Get.find<PuzzleController>();

  @override
  void initState() {
    super.initState();
  }

  double calculateWidth(Size size) {
    return 500.0;
  }

  List<Widget> generatePuzzleContainers(double maxWidth, Size size) {
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
            puzzleController.getXPosition(index, div),
            puzzleController.getYPosition(index, div),
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
          onHorizontalDragUpdate: (DragUpdateDetails details) =>
              puzzleController.onHorizontalDragUpdate(details),
          onHorizontalDragStart: (DragStartDetails details) =>
              puzzleController.onHorizontalDragStart(details),
          onHorizontalDragDown: (DragDownDetails details) =>
              puzzleController.onHorizontalDragDown(details),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: EdgeInsets.all(padding / 2),
        width: calculateWidth(size),
        height: calculateWidth(size),
        color: Colors.red,
        child: Stack(
          children: generatePuzzleContainers(calculateWidth(size), size),
        ),
      ),
    );
  }
}
