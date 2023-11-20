import 'package:flutter/material.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';



class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> 
with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final Size size = MediaQuery.of(context).size;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: 800 ,
        width: 4200 ,
        color:AppColors.sColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.01), 
          child: Row(
            children: [
              Image.asset(
                AppAssets.profile2,
                height: 500,
                width: 500,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Constants.sizedBox(height: 100.0),
                    Text.rich(
                    _buildTextSpan(),
                    style: AppTextStyles.monteserratStyle(66),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                     ),
                     Constants.sizedBox(height: 10.0),
                     Text('Graduada em Tecnologia em Sistemas para Internet pela Universidade Católica de Pernambuco.\nEstou em busca de uma oportunidade de emprego na área de sistemas de internet. Domínio em \nlinguagens de programação. Na vida acadêmica, tive a oportunidade de estagiar, realizar e \nparticipar de projetos pertinentes a vivência de desenvolvedora. Atuei como mentora de Lógica\nde  programação visando trabalhar as dificuldades e necessidades de cada pessoa.',
                    style: AppTextStyles.headerTextStyle(19),
                    ),
                    Constants.sizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.002), 
                      child: TabBar(
                        
                        indicatorColor: Color(0xFF65C8D6),
                        controller: _tabController ,
                        tabs:  [
                          Tab(child: Text('Skills', style: AppTextStyles.headerTextStyle(15),),),
                          Tab(child: Text('Experiência', style: AppTextStyles.headerTextStyle(15),),),
                          Tab(child: Text('Formação', style: AppTextStyles.headerTextStyle(15),),),
                        ]
                        ),
                    ),
                     Expanded(
                       child: Container(
                          width: double.maxFinite,
                          height: screenHeight * 0.05,
                          child:  TabBarView(
                            controller: _tabController,
                            children: [
                            Text('\n \n Frameworks \n Flutter, React Native, Spring boot,Nodejs, Bootstrap. \n\n Hard Skills \n Java, Javascript, Kotlin, Python e Dart. \n\n Soft Skills  \n Criativa, Proativa, Persuasiva, Git, Github, Responsável,\n Determinada,Comunicativa, HTML, CSS, Métodos Ágeis, \n Capacidade de liderança, Flexibilidade para trabalho em equipe.', style: AppTextStyles.headerTextStyle(16)),
            
                            Text('\n Profissional  \n Empresa: Prefeitura do Recife \n Cargo: Estagiária de Desenvolvimento em Python \n Período: 10/2022 a 01/2023 \n Atividades desenvolvidas: Criação de coreografias para os robôs através de IDE com base em Python. \n\n Acadêmica \n Mentora de Lógica de Programação \n Projetos com Startups em parceria com o Porto Digital ', style: AppTextStyles.headerTextStyle(16)),
            
                            Text('\n Sistemas para Internet - UNICAP  | Concluído em 2022. \n\n Power BI - Avanade | Concluído em 2022.  ', style: AppTextStyles.headerTextStyle(16)),
                            ]
                            ),
                            
                        ),
                     ),
                     
                  ],
                ),
              ),
              Constants.sizedBox(height: 300.0),
            ],
          ),
        ),
      
      );
    
  }
  TextSpan _buildTextSpan() {
  const name = 'Sobre  mim';
  final spans = <TextSpan>[];
  spans.add(_boldwhite(name.substring(0, 5)));
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

TextSpan _boldwhite(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Color.fromRGBO(243, 251, 252, 1),
    ),
  );
}
}