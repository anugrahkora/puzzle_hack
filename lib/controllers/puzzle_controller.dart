// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PuzzleController extends GetxController {
  RxList<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
  ].obs;
  RxList offsets = [].obs;
  var freePos = Offset(3, 3).obs;
  var initialPos = 0.0.obs;
  final row = 4;
  @override
  void onInit() {
    data.shuffle();
    super.onInit();
  }

  void setOffset(int index) {
    offsets.add(
      Offset(
          getXCoordinate(index),
          getYCoordinate(
            index,
          )),
    );
  }

  double getXPosition(int index, double div) {
    return getXCoordinate(index) * div;
  }

  double getYPosition(int index, double div) {
    return getYCoordinate(index) * div;
  }

  double getXCoordinate(int index) {
    if (index > 3 && index < 8) {
      return (index - 4);
    }
    if (index > 7 && index < 12) {
      return (index - 8);
    }
    if (index > 11) {
      return (index - 12);
    }

    return index.toDouble();
  }

  double getYCoordinate(int index) {
    if (index > 3 && index < 8) {
      return 1;
    } else if (index > 7 && index < 12) {
      return 2;
    } else if (index > 11 && index < 16) {
      return 3;
    }
    return 0;
  }

  updateFreePos(Offset offset) {
    freePos.value = offset;
  }

  void onTapUp(TapUpDetails details, Offset offset, int index) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onTapDown(TapDownDetails details) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onVerticalDragUpdate(
      DragUpdateDetails details, Offset offset, int index) {
    if (offset.dy > row - 4 &&
        offset.dx < row &&
        (initialPos.value - details.globalPosition.dy) > 0) {
      if ((freePos.value.dx + 1) == offset.dy &&
          freePos.value.dy == offset.dx) {
        offsets.insert(index, Offset(freePos.value.dx, freePos.value.dy));
        print(offsets[index]);
        updateFreePos(offset);
      }
    } else if (offset.dy < row - 1 &&
        offset.dx < row &&
        (initialPos.value - details.globalPosition.dy) < 0) {
          // down
      if ((freePos.value.dx - 1) == offset.dy &&
          freePos.value.dy == offset.dx) {
       
        offsets.insert(index, Offset(freePos.value.dx, freePos.value.dy));
        print(offsets[index]);
        updateFreePos(offset);
      }
    }
  }

  void onVerticalDragStart(DragStartDetails details, Offset offset, int index) {
    initialPos.value = details.globalPosition.dy;
  }

  void onVerticalDragDown(DragDownDetails details) {
    // print(details.localPosition.direction);
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onHorizontalDragStart(DragStartDetails details) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onHorizontalDragDown(DragDownDetails details) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }
}
