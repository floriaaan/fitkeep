import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Block extends StatelessWidget {
  final Color color;
  final double width;
  final Widget child;

  Function? onPress;

  Block(
      {Key? key,
      required this.color,
      required this.child,
      required this.width,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.5),
        height: width * 1.5,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: child),
      ),
    );
  }
}
