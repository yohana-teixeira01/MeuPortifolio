import 'package:flutter/material.dart';

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Color bgColor;

  const HelperClass({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.paddingWidth,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size size = MediaQuery.of(context).size;

        if (constraints.maxWidth < 768) {
          return Container(
            height: size.height,
            width: size.width,
            color: bgColor,
            padding: EdgeInsets.symmetric(
              vertical: paddingWidth,
              horizontal: paddingWidth,
            ),
            child: mobile,
          );
        } else if (constraints.maxWidth < 1007) {
          return Container(
            height: size.height,
            width: size.width,
            color: bgColor,
            padding: EdgeInsets.symmetric(
              horizontal: paddingWidth,
            ),
            child: tablet,
          );
        } else {
          return Container(
            height: size.height,
            width: size.width,
            color: bgColor,
            padding: EdgeInsets.symmetric(
              horizontal: paddingWidth,
            ),
            child: desktop,
          );
        }
      },
    );
  }
}
