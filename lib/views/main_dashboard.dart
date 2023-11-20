import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/views/home.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        toolbarHeight: 90,
        titleSpacing: 40,
        title: LayoutBuilder(
          builder: (context, constraints) { 
            if(constraints.maxWidth < 768){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                Text.rich(
                  _buildTextSpan(),
                  style: AppTextStyles.nameTextStyle(),
                ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.BColor,
                    ),
                  )
                ],
              );

            } else{
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                Text.rich(
                  _buildTextSpan(),
                  style: AppTextStyles.nameTextStyle(),
                ),
                const Spacer(),
        
                Text(
                'Home', 
                style: AppTextStyles.headerTextStyle(20),
                ), 
                Constants.sizedBox(width: 30.0),
        
                Text(
                'Sobre', 
                style: AppTextStyles.headerTextStyle(20),
                ),
                Constants.sizedBox(width: 30.0),
        
                Text(
                'Portifolio',
                style: AppTextStyles.headerTextStyle(20),
                ),
                Constants.sizedBox(width: 30.0),
        
                Text(
                'Contato',
                style: AppTextStyles.headerTextStyle(20),
                ),

                Constants.sizedBox(width: 30.0),
               ], 
              );
            }
          }
        ),
        ),
       body: const Home(),    
    ) ;
  }
  TextSpan _buildTextSpan() {
  const name = 'Yohana  Teixeira';
  final spans = <TextSpan>[];
  spans.add(_boldBlue(name.substring(0, 3)));
  spans.add(_boldwhite(name.substring(3, 6)));
  spans.add(_boldBlue(name.substring(7, 11)));
  spans.add(_boldwhite(name.substring(11, 16)));
  return TextSpan(children: spans);
  }

TextSpan _boldBlue(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Color.fromRGBO(101, 200, 214, 1),
    ),
  );
}

TextSpan _boldwhite(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Color.fromRGBO(243, 251, 252, 1),
    ),
  );
}
}