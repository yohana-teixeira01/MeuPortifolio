import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/helper_class/helper_class.dart';
import 'package:portifolio/widgets/profile_animation.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: HelperClass(
        mobile: buildMobileLayout(size),
        tablet: buildTabletLayout(size),
        desktop: buildDesktopLayout(size),
        paddingWidth: size.width * 0.1,
        bgColor: AppColors.bgColor,
      ),
    );
  }

  Widget buildMobileLayout(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildMobileHomePersonalInfo(size),
        Expanded(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: ProfileAnimation(),
          ),
        ),
      ],
    );
  }

  Widget buildTabletLayout(Size size) {
    return Column(
      children: [
        buildTabletHomePersonalInfo(size),
        Constants.sizedBox(height: 25.0),
        ProfileAnimation(),
      ],
    );
  }

  Widget buildDesktopLayout(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildDesktopHomePersonalInfo(size)),
        const ProfileAnimation(),
      ],
    );
  }

  Column buildMobileHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Olá, Bem vindos!',
          style: AppTextStyles.headerTextStyle(19.0),
        ),
        Constants.sizedBox(height: 5.0),
        Row(
          children: [
            Text(
              'Sou Desenvolvedora ',
              style: AppTextStyles.monteserratStyle(16.5),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Front End',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 16.5)),
                TyperAnimatedText('Mobile',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 16.5)),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              repeatForever: true,
            ),
          ],
        ),
        Constants.sizedBox(height: 10.0),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            'Atualmente estou em busca da minha primeira oportunidade na área e através desse site,'
            ' deixo um pouco dos meus conhecimentos registrado para vocês.',
            style: AppTextStyles.normalStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Column buildTabletHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Olá, Bem vindos!',
          style: AppTextStyles.headerTextStyle(23.0),
        ),
        Constants.sizedBox(height: 5.0),
        Row(
          children: [
            Text(
              'Sou Desenvolvedora ',
              style: AppTextStyles.monteserratStyle(20.0),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Front End',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 20.0)),
                TyperAnimatedText('Mobile',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 20.0)),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              repeatForever: true,
            ),
          ],
        ),
        Constants.sizedBox(height: 10.0),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            'Atualmente estou em busca da minha primeira oportunidade na área e através desse site,'
            ' deixo um pouco dos meus conhecimentos registrado para vocês.',
            style: AppTextStyles.normalStyle(fontSize: 17.0),
          ),
        ),
        Constants.sizedBox(height: 10.0),
      ],
    );
  }

  Column buildDesktopHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Olá, Bem vindos!',
          style: AppTextStyles.headerTextStyle(23.0),
        ),
        Constants.sizedBox(height: 5.0),
        Row(
          children: [
            Text(
              'Sou Desenvolvedora ',
              style: AppTextStyles.monteserratStyle(21.0),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Front End',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 21.0)),
                TyperAnimatedText('Mobile',
                    textStyle: AppTextStyles.monteserratblueStyle(color: Color(0xFF65C8D6), fontSize: 21.0)),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              repeatForever: true,
            ),
          ],
        ),
        Constants.sizedBox(height: 10.0),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            'Atualmente estou em busca da minha primeira oportunidade na área e através desse site,'
            ' deixo um pouco dos meus conhecimentos registrado para vocês.',
            style: AppTextStyles.normalStyle(fontSize: 17.0),
          ),
        ),
        Constants.sizedBox(height: 10.0),
      ],
    );
  }
}
