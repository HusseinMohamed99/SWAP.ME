import 'package:flutter/material.dart';

class Size extends StatelessWidget {
  final double width;
  final double height;

  const Size({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
