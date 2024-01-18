import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:portifolio/global/app_assets.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/helper_class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
   Contact({super.key});

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mensagemController = TextEditingController();

  final String corpoEmail = 'Nome: %nome%\nEmail: %email%\nMensagem: %mensagem%';
  final String assunto = 'Contato do Portfólio';
  final String destinatario = 'yteixeira133@gmail.com';

  static const String linkedInURL = 'https://www.linkedin.com/in/yohana-teixeira-269a40213';
  static const String githubURL = 'https://github.com/yohana-teixeira01';
  static const String cvURL = 'https://www.canva.com/design/DAFy380oCGs/WawqVPHezEJywddvxsQnbw/edit?utm_content=DAFy380oCGs&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
  static const String whatsappURL = 'https://api.whatsapp.com/send/?phone=5581971195993';

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

   void enviarGmail(String nome, String email, String mensagem) async {
   final String body = corpoEmail
    .replaceAll('%nome%', nome)
    .replaceAll('%email%', email)
    .replaceAll('%mensagem%', mensagem);

final String gmailLink = 'https://mail.google.com/mail/?view=cm&fs=1&to=$destinatario&subject=$assunto&body=${Uri.encodeComponent(body)}';
    await launchURL(gmailLink);
  }

  void visualizarCV() async {
    await launchURL(cvURL);
  }

  void whatsApp() async {
    await launchURL(whatsappURL);
  }

  void github() async {
    await launchURL(githubURL);
  }

  void gmail() async {
    await launchURL('https://mail.google.com/mail/?view=cm&fs=1&to=$destinatario');
  }

  void linkedIn() async {
    await launchURL(linkedInURL);
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: size.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    _buildTextSpan(),
                    style: AppTextStyles.monteserratStyle(30),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ),
                  Constants.sizedBox(height: 10.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                gmail();
                              },
                              child: Image.asset(
                                AppAssets.enviar,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ),
                          Constants.sizedBox(width: 10.0),
                          Flexible(
                            child: Text('Yteixeira133@gmail.com', style: AppTextStyles.headerTextStyle(9)),
                          ),
                        ],
                      ),
                      Constants.sizedBox(height: 10.0),
                      Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                whatsApp();
                              },
                              child: Image.asset(
                                AppAssets.telefone,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ),
                          Constants.sizedBox(width: 10.0),
                          Flexible(
                            child: Text('Ligações e WhatsApp', style: AppTextStyles.headerTextStyle(9)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 20.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          linkedIn();
                        },
                        child: Image.asset(
                          AppAssets.linkedin,
                          height: 35,
                          width: 35,
                        ),
                      ),
                      Constants.sizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {
                          github();
                        },
                        child: Image.asset(
                          AppAssets.github,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 20.0),
                  AnimatedButton(
                    height: 50,
                    width: 150,
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
                    onPress: () {
                      visualizarCV();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: size.width * 0.03),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 8,
                color: Colors.transparent,
                child: TextField(
                  controller: nomeController,
                  decoration: buildInputDecoration(hintText: 'Nome'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * 0.03),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 8,
                color: Colors.transparent,
                child: TextField(
                  controller: emailController,
                  decoration: buildInputDecoration(hintText: 'Email'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * 0.03),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 8,
                color: Colors.transparent,
                child: TextField(
                  controller: mensagemController,
                  maxLines: 10,
                  decoration: buildInputDecoration(hintText: 'Mensagem de texto'),
                ),
              ),
            ),
            Constants.sizedBox(height: 10.0),
            AnimatedButton(
              height: 50,
              width: 90,
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
              onPress: () {
                enviarGmail(
                  nomeController.text,
                  emailController.text,
                  mensagemController.text,
                );
              },
            ),
          ],
        ),
      ),

      tablet: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    _buildTextSpan(),
                    style: AppTextStyles.monteserratStyle(60),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ),
                  Constants.sizedBox(height: 20.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              gmail();
                            },
                            child: Image.asset(
                              AppAssets.enviar,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Constants.sizedBox(width: 30.0),
                          Text('Yteixeira133@gmail.com', style: AppTextStyles.headerTextStyle(20)),
                        ],
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 30.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              whatsApp();
                            },
                            child: Image.asset(
                              AppAssets.telefone,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Constants.sizedBox(width: 30.0),
                          Text('Ligações e WhatsApp', style: AppTextStyles.headerTextStyle(20)),
                        ],
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 40.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          linkedIn();
                        },
                        child: Image.asset(
                          AppAssets.linkedin,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Constants.sizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          github();
                        },
                        child: Image.asset(
                          AppAssets.github,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  Constants.sizedBox(height: 30.0),
                  AnimatedButton(
                    height: 70,
                    width: 200,
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
                    onPress: () {
                      visualizarCV();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.03),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 8,
                color: Colors.transparent,
                child: TextField(
                  controller: nomeController,
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
                  controller: emailController,
                  decoration: buildInputDecoration(hintText: 'Email'),
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
                  controller: mensagemController,
                  maxLines: 10,
                  decoration: buildInputDecoration(hintText: 'Mensagem de texto'),
                ),
              ),
            ),
            AnimatedButton(
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
              onPress: () {
                enviarGmail(
                  nomeController.text,
                  emailController.text,
                  mensagemController.text,
                );
              },
            ),
          ],
        ),
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.001),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Constants.sizedBox(height: 30.0),
                  Text.rich(
                    _buildTextSpan(),
                    style: AppTextStyles.monteserratStyle(66),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ),
                  Constants.sizedBox(height: 20.0),
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
                    onPress: () {
                      visualizarCV();
                    },
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
                const SizedBox(height: 150),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.01),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      controller: nomeController,
                      decoration: buildInputDecoration(hintText: 'Nome'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.01),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      controller: emailController,
                      decoration: buildInputDecoration(hintText: 'Email'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.01),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    color: Colors.transparent,
                    child: TextField(
                      controller: mensagemController,
                      maxLines: 10,
                      decoration: buildInputDecoration(hintText: 'Mensagem de texto'),
                    ),
                  ),
                ),
                AnimatedButton(
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
                  onPress: () {
                    enviarGmail(
                      nomeController.text,
                      emailController.text,
                      mensagemController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.sColor,
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
      hintStyle: AppTextStyles.headerTextStyle(18),
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
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    );
  }

  TextSpan _buildTextSpan() {
    const name = 'Contato';
    final spans = <TextSpan>[];
    spans.add(_boldWhite(name.substring(0, 3)));
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

  TextSpan _boldWhite(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Color.fromRGBO(243, 251, 252, 1),
      ),
    );
  }
}

