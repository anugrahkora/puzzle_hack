import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/constants.dart';

class PuzzleBox extends StatefulWidget {
  final int number;
  final Offset positon;
  final Offset offset;
  final double maxWidth;

  final Function(TapUpDetails) onTapUp;
  final Function(TapDownDetails) onTapDown;
  final Function(DragStartDetails) onVerticalDragStart;
  final Function(DragUpdateDetails) onVerticalDragUpdate;
  final Function(DragDownDetails) onVerticalDragDown;
  final Function(DragEndDetails) onVerticalDragEnd;
  final Function(DragStartDetails) onHorizontalDragStart;
  final Function(DragUpdateDetails) onHorizontalDragUpdate;
  final Function(DragDownDetails) onHorizontalDragDown;
  final Function(DragEndDetails) onHorizontalDragEnd;
  const PuzzleBox({
    Key? key,
    required this.offset,
    required this.maxWidth,
    required this.number,
    required this.onTapUp,
    required this.onTapDown,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragDown,
    required this.onHorizontalDragStart,
    required this.onHorizontalDragUpdate,
    required this.onHorizontalDragDown,
    required this.positon,
    required this.onVerticalDragEnd,
    required this.onHorizontalDragEnd,
  }) : super(key: key);

  @override
  _PuzzleBoxState createState() => _PuzzleBoxState();
}

class _PuzzleBoxState extends State<PuzzleBox> {
  double? calculateOuterWidth() {
    return (widget.maxWidth - 16) / 4;
  }

  double? calculateInnerWidth() {
    return (widget.maxWidth - 16) / 4.5;
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      curve: Curves.elasticOut,
      duration: animationDuration,
      top: widget.positon.dy,
      left: widget.positon.dx,
      child: GestureDetector(
        onTapUp: widget.onTapUp,
        onTapDown: widget.onTapDown,
        onVerticalDragStart: widget.onVerticalDragStart,
        onVerticalDragUpdate: widget.onVerticalDragUpdate,
        onVerticalDragDown: widget.onVerticalDragDown,
        onVerticalDragEnd: widget.onVerticalDragEnd,
        onHorizontalDragStart: widget.onHorizontalDragStart,
        onHorizontalDragUpdate: widget.onHorizontalDragUpdate,
        onHorizontalDragDown: widget.onHorizontalDragDown,
        onHorizontalDragEnd: widget.onHorizontalDragEnd,
        child: SizedBox(
          height: calculateOuterWidth(),
          width: calculateOuterWidth(),
          // color: Colors.white,
          child: Center(
            child: Container(
              // margin: const EdgeInsets.all(8.0),
              height: calculateInnerWidth(),
              width: calculateInnerWidth(),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              // padding: const EdgeInsets.all(30.0),

              child: Center(
                child: Text(
                  widget.number.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
