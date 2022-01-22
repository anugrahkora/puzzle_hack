import 'package:flutter/material.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
      width: size.width * 0.5,
        height: size.width * 0.5,
        color: Colors.blue,
      ),
    );
  }
}
