import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final Function(DragStartDetails) onHorizontalDragStart;
  final Function(DragUpdateDetails) onHorizontalDragUpdate;
  final Function(DragDownDetails) onHorizontalDragDown;
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
  }) : super(key: key);

  @override
  _PuzzleBoxState createState() => _PuzzleBoxState();
}

class _PuzzleBoxState extends State<PuzzleBox> {
  double? calculateWidth() {
    return (widget.maxWidth - 16) / 4;
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: widget.positon.dy,
      left: widget.positon.dx,
      child: GestureDetector(
        onTapUp: widget.onTapUp,
        onTapDown: widget.onTapDown,
        onVerticalDragStart: widget.onVerticalDragStart,
        onVerticalDragUpdate: widget.onVerticalDragUpdate,
        onVerticalDragDown: widget.onVerticalDragDown,
        onHorizontalDragStart: widget.onHorizontalDragStart,
        onHorizontalDragUpdate: widget.onHorizontalDragUpdate,
        onHorizontalDragDown: widget.onHorizontalDragDown,
        child: Container(
          height: calculateWidth(),
          width: calculateWidth(),
          color: Colors.white,
          child: Center(
              child: Container(
                  // margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.black,
                  child: Text(
                    widget.offset.dx.toString() +
                        " " +
                        widget.offset.dy.toString(),
                    style: const TextStyle(color: Colors.white),
                  ))),
        ),
      ),
    );
  }
}
