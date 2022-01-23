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
  var count = 0.obs;
  var freePos = Offset(3, 3).obs;
  var initialPos = 0.0.obs;
  final row = 4;
  @override
  void onInit() {
    data.shuffle();

    super.onInit();
  }

// void updateOffset(int index){

// for(int i=0;i<index;++i){
//   offsets
// }

// }

  void setOffset(int index) {
    offsets.add(
      Offset(
          getXCoordinate(index),
          getYCoordinate(
            index,
          )),
    );
  }

  void updateCount() {
    ++count.value;
  }

  double getXPosition(int index, double div) {
    return index * div;
  }

  double getYPosition(int index, double div) {
    return index * div;
  }

  double getYCoordinate(int index) {
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

  double getXCoordinate(int index) {
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
    // up direction
    if (offsets[index].dy > row - 4 &&
        offsets[index].dx < row &&
        (initialPos.value - details.globalPosition.dy) > 0) {
      if (offsets[index].dx == freePos.value.dx &&
          offsets[index].dy == freePos.value.dy + 1) {
        offsets[index] = freePos.value;
        updateFreePos(offset);
        updateCount();
      }
      // down direction
    } else if (offsets[index].dy < row &&
        offsets[index].dx < row &&
        (initialPos.value - details.globalPosition.dy) < 0) {
      if (offsets[index].dx == freePos.value.dx &&
          offsets[index].dy == freePos.value.dy - 1) {
        offsets[index] = freePos.value;
        updateFreePos(offset);
        updateCount();
      }
    }
  }

  void onVerticalDragStart(
          DragStartDetails details, Offset offset, int index) =>
      initialPos.value = details.globalPosition.dy;

  void onVerticalDragEnd(DragEndDetails details) {
    initialPos.value = 0.0;
  }

  void onVerticalDragDown(DragDownDetails details) {
    // print(details.localPosition.direction);
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onHorizontalDragUpdate(
      DragUpdateDetails details, Offset offset, int index) {
    // right
    if (offsets[index].dx >= row - 4 &&
        offsets[index].dy < row &&
        (initialPos.value - details.globalPosition.dx) < 0) {
      // print('right');
      if (offsets[index].dy == freePos.value.dy &&
          offsets[index].dx + 1 == freePos.value.dx) {
        offsets[index] = freePos.value;
        updateFreePos(offset);
        updateCount();
      }
      // left direction
    } else if (offsets[index].dx < row &&
        offsets[index].dy < row &&
        (initialPos.value - details.globalPosition.dx) > 0) {
      // print('left');
      if (offsets[index].dy == freePos.value.dy &&
          offsets[index].dx == freePos.value.dx + 1) {
        offsets[index] = freePos.value;
        updateFreePos(offset);
        updateCount();
      }
    }
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }

  void onHorizontalDragStart(DragStartDetails details) =>
      initialPos.value = details.globalPosition.dx;
  // print("x  " + details.localPosition.dx.toString());
  // print("y " + details.localPosition.dy.toString());

  void onHorizontalDragDown(DragDownDetails details) {
    // print("x  " + details.localPosition.dx.toString());
    // print("y " + details.localPosition.dy.toString());
  }
  void onHorizontalDragEnd(DragEndDetails details) => initialPos.value = 0.0;
}
