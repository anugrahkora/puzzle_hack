import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:puzzle_hack/components/counter_box.dart';
import 'package:puzzle_hack/components/generate_puzzle_boxes.dart';
import 'package:puzzle_hack/components/puzzle_box.dart';
import 'package:puzzle_hack/controllers/puzzle_controller.dart';

import '../../constants.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  _TabletViewState createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  void initState() {
    super.initState();
  }

  double calculateWidth(Size size) {
    return size.width * 0.6 > 500 ? 500 : size.width * 0.6;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: calculateWidth(size),
            height: calculateWidth(size),
            color: Colors.red,
            child: Stack(
              children: generatePuzzleContainers(calculateWidth(size), size),
            ),
          ),
          counterBox(),
        ],
      ),
    );
  }
}
