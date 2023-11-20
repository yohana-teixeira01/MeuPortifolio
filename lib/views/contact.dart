




import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});


  void visualizarCV() async {
    var url = 'https://www.canva.com/design/DAFy380oCGs/WawqVPHezEJywddvxsQnbw/edit?utm_content=DAFy380oCGs&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  void whatsApp() async {
    var url = 'https://api.whatsapp.com/send/?phone=5581971195993';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  void github() async {
    var url = 'https://github.com/yohana-teixeira01';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  void gmail() async {
    var url = 'mailto:Yteixeira133@gmail.com?subject=&body=';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  void linkedIn() async {
    var url = 'https://www.linkedin.com/in/yohana-teixeira-269a40213';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color:  AppColors.sColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
           padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.1), 
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Constants.sizedBox(height: 50.0),
                  Text.rich(
                    _buildTextSpan(),
                    style: AppTextStyles.monteserratStyle(66),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ), 
                  Constants.sizedBox(height: 30.0),                   
                  Column(
                    children:[ 
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              gmail();
                            },
                            child: Image.asset(
                              AppAssets.enviar,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Constants.sizedBox(width: 30.0),
                          Text('Yteixeira133@gmail.com', style: AppTextStyles.headerTextStyle(24)),
                        ],
                      ),
                    ]
                  ),
                  Constants.sizedBox(height: 30.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              whatsApp();
                            },
                            child: Image.asset(
                              AppAssets.telefone,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Constants.sizedBox(width: 30.0),
                          Text('Ligações e WhatsApp', style: AppTextStyles.headerTextStyle(24)),
                        ],
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 40.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          linkedIn();
                        },
                        child: Image.asset(
                          AppAssets.linkedin,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Constants.sizedBox(width: 30.0),
                      GestureDetector(
                        onTap: (){
                          github();
                        },
                        child: Image.asset(
                          AppAssets.github,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 30.0),
                  AnimatedButton(
                    height: 70,
                    width: 250,
                    text: 'Visualizar CV',
                    isReverse: false,
                    selectedTextColor: AppColors.BColor,
                    transitionType: TransitionType.LEFT_TO_RIGHT,
                    textStyle: AppTextStyles.monteserratStyle(15),
                    selectedBackgroundColor: Color(0xFF65C8D6),
                    backgroundColor: AppColors.TColor,
                    borderColor: Color(0xFF65C8D6),
                    borderRadius: 10,
                    borderWidth: 1,
                    onPress: visualizarCV,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 180),
              Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.03),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      color: Colors.transparent,
                      child: TextField(
                        decoration: buildInputDecoration(hintText: 'Nome'),
                      ),
                    ),
                  ),
                
              Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.03),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      color: Colors.transparent,
                      child: TextField(
                        decoration: buildInputDecoration(hintText: 'Nome-exemplo@gmail.com'),
                      ),
                    ),
                  ),
                
               Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.03),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8, 
                      color: Colors.transparent,
                      child: TextField(
                        maxLines: 10,
                        decoration: buildInputDecoration(hintText: 'Mensagem de texto'),
                      ),
                    ),
                  ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.2),
                  child: Expanded(
                    child: AnimatedButton(
                      height: 50,
                      width: 180,
                      text: 'Enviar',
                      isReverse: false,
                      selectedTextColor: AppColors.BColor,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      textStyle: AppTextStyles.monteserratStyle(15),
                      selectedBackgroundColor: Color(0xFF65C8D6),
                      backgroundColor: AppColors.TColor,
                      borderColor: Color(0xFF65C8D6),
                      borderRadius: 10,
                      borderWidth: 1,
                      onPress: visualizarCV,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


Image iconContact({required String asset}) {
  return Image.asset(
    asset,
    width: 50,
    height: 50,
    
  );
}

InputDecoration buildInputDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: AppColors.QColor,
    hintStyle: 
        AppTextStyles.headerTextStyle(18),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        focusColor: AppColors.QColor,
        contentPadding: 
            const  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    );
}
  TextSpan _buildTextSpan() {
  const name = 'Contato';
  final spans = <TextSpan>[];
  spans.add(_boldwhite(name.substring(0, 3)));
  spans.add(_boldBlue(name.substring(3, 7)));
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
