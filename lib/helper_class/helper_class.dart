import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const HelperClass({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return  LayoutBuilder(builder: (context, constraints){
      if( constraints.maxWidth < 768){
       return Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.05), 

          child: mobile,
        );
        
      }else if (constraints.maxWidth < 1200){
        return Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.005), 

          child: tablet,
        );
      }else{
        return Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.01), 

          child: desktop,
        );
      }
  });
}
}