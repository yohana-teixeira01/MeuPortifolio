import 'package:flutter/material.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/helper_class/helper_class.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double screenHeight = MediaQuery.of(context).size.height;

    return HelperClass(
      mobile: buildMobileLayout(size, screenHeight),
      tablet: buildTabletLayout(size, screenHeight),
      desktop: buildDesktopLayout(size, screenHeight),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.sColor,
    );
  }

  Widget buildMobileLayout(Size size, double screenHeight) {
  return ListView(
    children: [
    Column(
      children: [
        Image.asset(
          AppAssets.profile2,
          height: getImageSize(context, 0.6),
          width: getImageSize(context, 0.6),
        ),
        buildMobileAboutMeContents(size, screenHeight),
        Constants.sizedBox(width: 15.0),
      ],
    ),
   ], 
  );
  
}


  Widget buildMobileAboutMeContents(Size size, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Constants.sizedBox(height: 10.0),
        Text.rich(
          _buildTextSpan(),
          style: AppTextStyles.monteserratStyle(getTextSize(context, 30)),
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
        ),
        Constants.sizedBox(height: 5.0),
        Text(
          'Graduada em Tecnologia em Sistemas para Internet pela Universidade Católica de Pernambuco. Estou em busca de uma oportunidade de emprego na área de sistemas de internet. Domínio em linguagens de programação. Na vida acadêmica, tive a oportunidade de estagiar, realizar e participar de projetos pertinentes a vivência de desenvolvedora. Atuei como mentora de Lógica de programação visando trabalhar as dificuldades e necessidades de cada pessoa.',
          style: AppTextStyles.headerTextStyle(getTextSize(context, 14)),
          maxLines: 16,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: size.width * 0.0002),
          child: TabBar(
            indicatorColor: Color(0xFF65C8D6),
            controller: _tabController,
            labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
            tabs: [
              Tab(child: Text('Habilidades', style: AppTextStyles.headerTextStyle(getTextSize(context, 13)),),),
              Tab(child: Text('Experiência', style: AppTextStyles.headerTextStyle(getTextSize(context, 13)),),),
              Tab(child: Text('Formação', style: AppTextStyles.headerTextStyle(getTextSize(context, 13)),),),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: screenHeight * 0.3,
          child: TabBarView(
            controller: _tabController,
            children: [
              Text('Frameworks \nFlutter, React Native, Spring boot, Nodejs, Bootstrap. \n\nHard Skills \n Java, Javascript, Kotlin, Python e Dart. \n\nSoft Skills  \nCriativa, Proativa, Persuasiva, Git/Github, Responsável, Determinada, Comunicativa, HTML, CSS, \nMétodos Ágeis, Capacidade de liderança, Flexibilidade para trabalho em equipe.', style: AppTextStyles.headerTextStyle(getTextSize(context, 13))),
              Text(' Profissional  \n Empresa: Prefeitura do Recife \n Cargo: Estagiária de Desenvolvimento em Python \n Período: 10/2022 a 01/2023 \n Atividades desenvolvidas: Criação de coreografias para os robôs através de IDE com base em Python. \n\n Acadêmica \n Mentora de Lógica de Programação \n Projetos com Startups em parceria com o Porto Digital. ', style: AppTextStyles.headerTextStyle(getTextSize(context, 13))),
              Text(' Sistemas para Internet - UNICAP  | Concluído em 2022. \n\n Power BI - Avanade | Concluído em 2022.  ', style: AppTextStyles.headerTextStyle(getTextSize(context, 13))),
            ],
          ),
        ),
      ],
    );
  }

 Widget buildTabletLayout(Size size, double screenHeight) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.2,
          padding: const EdgeInsets.only(top: 80.0),
          child: Image.asset(
            AppAssets.profile2,
            height: getImageSize(context, 0.3),
            width: getImageSize(context, 0.3),
          ),
        ),
        Container(
          width: size.width * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Constants.sizedBox(height: 215.0),
              Text.rich(
                _buildTextSpan(),
                style: AppTextStyles.monteserratStyle(getTextSize(context, 30)),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              Constants.sizedBox(height: 40.0),
              Text(
                'Graduada em Tecnologia em Sistemas para Internet pela Universidade Católica de Pernambuco.\nEstou em busca de uma oportunidade de emprego na área de sistemas de internet. Domínio em \nlinguagens de programação. Na vida acadêmica, tive a oportunidade de estagiar, realizar e \nparticipar de projetos pertinentes a vivência de desenvolvedora. Atuei como mentora de Lógica\nde programação visando trabalhar as dificuldades e necessidades de cada pessoa.',
                style: AppTextStyles.headerTextStyle(getTextSize(context, 11)),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.3,
          padding: const EdgeInsets.only(top: 230.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.002),
                child: TabBar(
                  indicatorColor: Color(0xFF65C8D6),
                  controller: _tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  tabs: [
                    Tab(child: Text('Skills', style: AppTextStyles.headerTextStyle(getTextSize(context, 8)),),),
                    Tab(child: Text('Experiência', style: AppTextStyles.headerTextStyle(getTextSize(context, 8)),),),
                    Tab(child: Text('Formação', style: AppTextStyles.headerTextStyle(getTextSize(context, 8)),),),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(right: 20.0),
                height: screenHeight * 0.3,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Text(' Frameworks \n Flutter, React Native, Spring boot, Nodejs, Bootstrap. \n\n Hard Skills \n Java, Javascript, Kotlin, Python e Dart. \n\n Soft Skills  \n Criativa, Proativa, Persuasiva, Git, Github, Responsável,\n Determinada, Comunicativa, HTML, CSS, Métodos Ágeis, \n  Capacidade de liderança, Flexibilidade para trabalho em equipe.', style: AppTextStyles.headerTextStyle(getTextSize(context, 10))),
                    Text(' Profissional  \n Empresa: Prefeitura do Recife \n Cargo: Estagiária de Desenvolvimento em Python \n Período: 10/2022 a 01/2023 \n Atividades desenvolvidas: Criação de coreografias para os robôs através de IDE com base em Python. \n\n Acadêmica \n Mentora de Lógica de Programação \n Projetos com Startups em parceria com o Porto Digital. ', style: AppTextStyles.headerTextStyle(getTextSize(context, 10))),
                    Text(' Sistemas para Internet - UNICAP  | Concluído em 2022. \n\n Power BI - Avanade | Concluído em 2022.  ', style: AppTextStyles.headerTextStyle(getTextSize(context, 10))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget buildDesktopLayout(Size size, double screenHeight) {
    return Row(
      children: [
        Image.asset(
          AppAssets.profile2,
          height: getImageSize(context, 0.2),
          width: getImageSize(context, 0.2),
        ),
        buildAboutMeContents(size, screenHeight),
        Constants.sizedBox(height: 250.0),
      ],
    );
  }

  Widget buildAboutMeContents(Size size, double screenHeight) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Constants.sizedBox(height: 120.0),
          Text.rich(
            _buildTextSpan(),
            style: AppTextStyles.monteserratStyle(getTextSize(context, 50)),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
          Constants.sizedBox(height: 10.0),
          Text(
            'Graduada em Tecnologia em Sistemas para Internet pela Universidade Católica de Pernambuco. Estou em busca de uma oportunidade de emprego na área de sistemas de internet. Domínio em linguagens de programação. Na vida acadêmica, tive a oportunidade de estagiar, realizar e participar de projetos pertinentes a vivência de desenvolvedora. Atuei como mentora de Lógica de programação visando trabalhar as dificuldades e necessidades de cada pessoa.',
            style: AppTextStyles.headerTextStyle(getTextSize(context, 14)),
            maxLines: 16,
            overflow: TextOverflow.ellipsis,
          ),
          Constants.sizedBox(height: 1.0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.002),
            child: TabBar(
              indicatorColor: Color(0xFF65C8D6),
              controller: _tabController,
              labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
              tabs: [
                Tab(child: Text('Skills', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5)),),),
                Tab(child: Text('Experiência', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5)),),),
                Tab(child: Text('Formação', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5)),),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: screenHeight * 0.5,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text('Frameworks \nFlutter, React Native, Spring boot, Nodejs, Bootstrap. \n\nHard Skills \n Java, Javascript, Kotlin, Python e Dart. \n\nSoft Skills  \nCriativa, Proativa, Persuasiva, Git/Github, Responsável, Determinada, Comunicativa, HTML, CSS, \nMétodos Ágeis, Capacidade de liderança, Flexibilidade para trabalho em equipe.', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5))),
                  Text(' Profissional  \n Empresa: Prefeitura do Recife \n Cargo: Estagiária de Desenvolvimento em Python \n Período: 10/2022 a 01/2023 \n Atividades desenvolvidas: Criação de coreografias para os robôs através de IDE com base em Python. \n\n Acadêmica \n Mentora de Lógica de Programação \n Projetos com Startups em parceria com o Porto Digital. ', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5))),
                  Text(' Sistemas para Internet - UNICAP  | Concluído em 2022. \n\n Power BI - Avanade | Concluído em 2022.  ', style: AppTextStyles.headerTextStyle(getTextSize(context, 12.5))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getImageSize(BuildContext context, double factor) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 500.0 : screenWidth * factor;
  }

  double getTextSize(BuildContext context, double baseSize) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? baseSize : baseSize * 0.8;
  }

  TextSpan _buildTextSpan() {
    const name = 'Sobre  mim';
    final spans = <TextSpan>[];
    spans.add(_boldWhite(name.substring(0, 5)));
    spans.add(_boldBlue(name.substring(6, 10)));
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

