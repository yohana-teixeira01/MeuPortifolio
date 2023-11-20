import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/helper_class/helper_class.dart';
import 'package:portifolio/widgets/profile_animation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
        body: Container(
            child: HelperClass(
              mobile: Column(
                      children: [
                        buildHomePersonalInfo(size),
                        Constants.sizedBox(height: 25),
                        const ProfileAnimation(),
                      ],
                    ), 
                tablet: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: [
                            Expanded(child: buildHomePersonalInfo(size)),
                            Expanded(child: const ProfileAnimation()), 
                          ],
                        ),
                  desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                          children: [
                            buildHomePersonalInfo(size),
                            const ProfileAnimation(), 
                          ],
                        ),
            ),
        ),
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                      'Olá, Bem vindos!',
                      style: AppTextStyles.headerTextStyle(23),
                      ),
                      Constants.sizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                          'Sou Desenvolvedora ',
                          style: AppTextStyles.monteserratStyle(20),
                          ),
                          AnimatedTextKit(animatedTexts:[
                            TyperAnimatedText('Front End',
                            textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6))),
                            TyperAnimatedText('Mobile',
                            textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6))),
                          ],
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                          repeatForever: true,
                          )
                        ],
                      ),
                      Constants.sizedBox(height: 10),
                      SizedBox(
                        width: size.width * 0.5,
                          child: Text(
                            'Atualmente estou em busca da minha primeira oportunidade na área e através desse site,'
                            ' deixo um pouco dos meus conhecimentos registrado para vocês.',
                            style: AppTextStyles.normalStyle(),
                          ),
                        ),
                          Constants.sizedBox(height: 25),
                        
                    ],
                  );
                  
  }
}


