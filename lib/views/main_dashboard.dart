import 'package:flutter/material.dart';
import 'package:portifolio/global/app_colors.dart';
import 'package:portifolio/global/app_text_style.dart';
import 'package:portifolio/global/constants.dart';
import 'package:portifolio/views/about.dart';
import 'package:portifolio/views/contact.dart';
import 'package:portifolio/views/home.dart';
import 'package:portifolio/views/portifolio.dart';


class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final PageController _pageController = PageController(initialPage: 0);
  var currentPage = 0;

  final menuItems = ['Home', 'Sobre', 'Portfólio', 'Contato'];

  final List<Widget> screenList =  <Widget>[
    Home(),
    About(),
    MyPortifolio(),
    Contact(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        toolbarHeight: 90,
        titleSpacing: 40,
        title: buildAppBar(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        scrollDirection: Axis.vertical,
        children: screenList,
      ),
    );
  }

  Widget buildAppBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return buildMobileAppBar();
        } else {
          return buildDesktopAppBar();
        }
      },
    );
  }

  Widget buildMobileAppBar() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: Text.rich(
          _buildTextSpan(),
          style: AppTextStyles.nameTextStyle(),
        ),
      ),
      PopupMenuButton(
        icon: Icon(
          Icons.menu_sharp,
          size: 32,
          color: AppColors.BColor,
        ),
        color: AppColors.bgColor,
        position: PopupMenuPosition.under,
        constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width * 0.9),
        itemBuilder: (BuildContext context) => menuItems
            .asMap()
            .entries
            .map(
              (e) => PopupMenuItem(
                textStyle: AppTextStyles.headerTextStyle(16),
                onTap: () {
                  scrollTo(index: e.key);
                },
                child: Text(e.value),
              ),
            )
            .toList(),
      )
    ],
  );
}


  Widget buildDesktopAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text.rich(
          _buildTextSpan(),
          style: AppTextStyles.nameTextStyle(),
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          child: ListView.separated(
            itemCount: menuItems.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, child) =>
                Constants.sizedBox(width: 8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  scrollTo(index: index);
                },
                borderRadius: BorderRadius.circular(100),
                onHover: (value) {
                  setState(() {
                    currentPage = value ? index : 0;
                  });
                },
                child: buildNavBarAnimatedContainer(
                  index,
                  currentPage == index,
                ),
              );
            },
          ),
        ),
        Constants.sizedBox(width: 30.0),
      ],
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool isSelected) {
  return AnimatedContainer(
    alignment: Alignment.center,
    width: isSelected ? 105.0 : 95.0,
    height: 30.0, 
    duration: const Duration(milliseconds: 200),
    child: Center(
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerMenuTextStyle(
          color: isSelected ? AppColors.TColor : AppColors.BColor,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}


  Future<void> scrollTo({required int index}) async {
    if (_pageController != null && _pageController.hasClients) {
      await _pageController.animateToPage(
        index,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }

    setState(() {
      currentPage = index;
    });
  }

  TextSpan _buildTextSpan() {
    const name = 'Yohana  Teixeira';
    final spans = <TextSpan>[];
    spans.add(_boldBlue(name.substring(0, 3)));
    spans.add(_boldWhite(name.substring(3, 6)));
    spans.add(_boldBlue(name.substring(7, 11)));
    spans.add(_boldWhite(name.substring(11, 16)));
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
