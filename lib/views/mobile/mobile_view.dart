import 'package:flutter/material.dart';
import 'package:puzzle_hack/components/counter_box.dart';
import 'package:puzzle_hack/components/generate_puzzle_boxes.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
            color: Colors.blue,
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
