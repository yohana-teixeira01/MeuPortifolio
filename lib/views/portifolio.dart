import 'package:flutter/material.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:portifolio/helper_class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPortifolio extends StatefulWidget {
  const MyPortifolio({Key? key});

  @override
  State<MyPortifolio> createState() => _MyPortifolioState();
}

class _MyPortifolioState extends State<MyPortifolio> {
  final onHoverEffect = Matrix4.identity()..scale(1.0);

  List<String> mobileImages = [
    AppAssets.desafioAppM,
    AppAssets.cloneYoutubeM,
    AppAssets.calculadoraM,
    AppAssets.emBreveM,
  ];

  List<String> tabletImages = [
    AppAssets.desafioAppT,
    AppAssets.cloneYoutubeT,
    AppAssets.calculadoraT,
    AppAssets.emBreveT,
  ];

  List<String> descktopImages = [
    AppAssets.desafioApp,
    AppAssets.cloneYoutube,
    AppAssets.calculadora,
    AppAssets.emBreve,
  ];

  List<String> textos = [
    'Desafio App \n\n Aplicação mobile em Kotlin, com:\n tela de cadastro, termos de uso, tela de lista de \n cidades, tela de lista de detalhes das cidades \n e extras.',
    'Youtube App \n\n Projeto de clone do YouTube foi feito com:\n React e Material-UI para estudos.',
    'Calculadora \n\n Clone de calculadora para praticar o Flutter.',
    'Em Breve \n\n Trabalhando um novo projeto para ampliar o meu portifólio no github.',
  ];

  List<String> urls = [
    'https://github.com/yohana-teixeira01/Mobile',
    'https://github.com/yohana-teixeira01/Clone_Youtube',
    'https://github.com/yohana-teixeira01/Calculator',
    'https://github.com/yohana-teixeira01/',
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> currentImages = getImages(size);

    return HelperClass(
      mobile: buildProjectColumn(crossAxisCount: 1, size: size, images: currentImages),
      tablet: buildProjectColumn(crossAxisCount: 2, size: size, images: currentImages),
      desktop: buildProjectColumn(crossAxisCount: 4, size: size, images: currentImages),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  List<String> getImages(Size size) {
    if (size.width < 600) {
      return mobileImages;
    } else if (size.width < 1200) {
      return tabletImages;
    } else {
      return descktopImages;
    }
  }

  Widget buildProjectColumn({required crossAxisCount, required Size size, required List<String> images}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Constants.sizedBox(height: 40.0),
          Text.rich(
            _buildTextSpan(),
            style: AppTextStyles.monteserratStyle(getTitleSize(size)),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: crossAxisCount, size: size, images: images),
        ],
      ),
    );
  }

  double getTitleSize(Size size) {
    if (size.width > 1200) {
      return 60;
    } else if (size.width > 600) {
      return 40;
    } else {
      return 20;
    }
  }

  Widget buildProjectGridView({required crossAxisCount, required Size size, required List<String> images}) {
    return SingleChildScrollView(
      child: GridView.builder(
        itemCount: images.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisExtent: size.width > 600 ? 448 : 320,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildProjectItem(index, size: size, images: images)
            );
        },
      ),
    );
  }

  Widget buildProjectItem(int index, {required Size size, required List<String> images}) {
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
            hoveredIndex = size.width > 600 ? value ? index : null : index;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned.fill(
              child: Visibility(
                visible: isHovered(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: isHovered(index) ? onHoverEffect : null,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        texto,
                        style: AppTextStyles.normalStyle(fontSize: getTextSize(size)),
                        textAlign: TextAlign.center,
                      ),
                      Constants.sizedBox(height: 20.0),
                      CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: const Color.fromRGBO(101, 200, 214, 0.473),
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
            ),
          ],
        ),
      ),
    );
  }

  bool isHovered(int index) {
    return index == hoveredIndex;
  }

  double getTextSize(Size size) {
    if (size.width > 1200) {
      return 17;
    } else if (size.width > 600) {
      return 16;
    } else {
      return 13;
    }
  }

  void abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Erro ao abrir o URL: $url');
    }
  }

  TextSpan _buildTextSpan() {
    const name = 'Meus Projetos';
    final spans = <TextSpan>[];
    spans.add(_boldWhite(name.substring(0, 4)));
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

  TextSpan _boldWhite(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Color.fromRGBO(243, 251, 252, 1),
      ),
    );
  }
}
