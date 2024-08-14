import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? data;
  final double? size;
  final Color? color;
  final FontWeight? fw;
  final TextAlign? align;
  AppText(
      {Key? key,
      required this.data,
      this.size,
      this.color,
      this.fw,
      this.align = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data.toString(),
      textAlign: align,
      style: TextStyle(
          fontSize: size, color: color, fontWeight: fw, fontFamily: "Roboto"),
    );
  }
}
