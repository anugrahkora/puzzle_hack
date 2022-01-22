import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/components/puzzle_box.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  double? calculateWidth(Size size) {
    return size.width * 0.6 > 500 ? 500 : size.width * 0.6;
  }

  List<Widget> generatePuzzleContainers() {
    final length = Get.find<PuzzleController>().data.length;
    return List.generate(
      length,
      (index) =>Container(
        height: 20.0,
        width: 20.0,
        color: Colors.amber,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: calculateWidth(size),
        height: calculateWidth(size),
        color: Colors.amber,
        child: Stack(children: generatePuzzleContainers()),
      ),
    );
  }
}
