import 'package:flutter/material.dart';
import 'package:puzzle_hack/responsive.dart';
import 'package:puzzle_hack/views/desktop/desktop_view.dart';
import 'package:puzzle_hack/views/mobile/mobile_view.dart';
import 'package:puzzle_hack/views/tablet/tablet_view.dart';

class PuzzleViewScreen extends StatefulWidget {
  const PuzzleViewScreen({Key? key}) : super(key: key);

  @override
  _PuzzleViewScreenState createState() => _PuzzleViewScreenState();
}

class _PuzzleViewScreenState extends State<PuzzleViewScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return const Scaffold(
      body: SafeArea(
          child: Responsive(
        desktop: DesktopView(),
        tablet: TabletView(),
        mobile: MobileView(),
      )),
    );
  }
}
