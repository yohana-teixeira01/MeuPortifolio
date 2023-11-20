import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyService extends StatefulWidget {
  const MyService({super.key});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  final onHoverEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.desafioApp,
    AppAssets.cloneYoutube,
    AppAssets.calculadora,
  ];

  List<String> textos = [
    '\n\n\n\n\n\n\nDesafio App \n\n Foi um aplicativo mobile em kotlin que fiz, com:    \n tela de cadastro, termos de uso, tela de lista de \n cidades, tela de lista de detalhes das cidades \n e extras.',
    '\n\n\n\n\n\n\nYoutube App \n\n Esse projeto de clone do youtube, foi feito com     \n react e material-ui para estudos.',
    '\n\n\n\n\n\n\nCalculadora \n\n Nesse projeto fiz um clone de calculadora, para     \n praticar o flutter. ',
  ];

  List<String> urls = [
    'https://github.com/yohana-teixeira01/Mobile',
    'https://github.com/yohana-teixeira01/Clone_Youtube',
    'https://github.com/yohana-teixeira01/Calculator',
  ];

  void abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
     void abrirGithub() async {
    var url = 'https://github.com/yohana-teixeira01?tab=repositories';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    bool isHouver = false;
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.bgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            _buildTextSpan(),
            style: AppTextStyles.monteserratStyle(66),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
          Constants.sizedBox(height: 50.0),
          GridView.builder(
            itemCount: images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 448,
            ),
            itemBuilder: (context, index) {
              var image = images[index];
              var texto = textos[index];
              return FadeInUpBig(
                duration: const Duration(milliseconds: 1600),
                child: InkWell(
                  onTap: () {
                    abrirUrl(urls[index]);
                  },
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        hoveredIndex = index;
                      } else {
                        hoveredIndex = null;
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Visibility(
                        visible: index == hoveredIndex,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: index == hoveredIndex ? onHoverEffect : null,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.TColor.withOpacity(0.8),
                                AppColors.TColor.withOpacity(0.7),
                                AppColors.TColor.withOpacity(0.6),
                                AppColors.TColor.withOpacity(0.5),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                texto,
                                style: AppTextStyles.normalStyle(),
                                textAlign: TextAlign.center,
                              ),
                              Constants.sizedBox(height: 20.0),
                              CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color.fromRGBO(101, 200, 214, 0.473),
                                child: GestureDetector(
                                  onTap: () {
                                    abrirUrl(urls[index]);
                                  },
                                  child: Image.asset(
                                    AppAssets.redirecionar,
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Constants.sizedBox(height: 41.0),
          Expanded(
            child: Center(
              child: AnimatedButton(
                height: 100.0,
                width: 200,
                text: 'Ver mais',
                isReverse: false,
                selectedTextColor: AppColors.BColor,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: AppTextStyles.monteserratStyle(15),
                selectedBackgroundColor: Color(0xFF65C8D6),
                backgroundColor: AppColors.TColor,
                borderColor: Color(0xFF65C8D6),
                borderRadius: 10,
                borderWidth: 1,
                onPress: abrirGithub,
              ),
            ),
          ),
      
        ],
      ),
    );
  }

  TextSpan _buildTextSpan() {
    const name = 'Meus Projetos';
    final spans = <TextSpan>[];
    spans.add(_boldwhite(name.substring(0, 4)));
    spans.add(_boldBlue(name.substring(4, 13)));
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
