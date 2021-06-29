import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Color color;
  final Widget child;
  Function onPressed = () {};

  Block({Key? key, required this.color, required this.child, Function? onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 250,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: child),
    );
  }
}
