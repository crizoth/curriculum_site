import 'package:curriculum_site/app/pages/contact_page.dart';
import 'package:curriculum_site/app/pages/presentation_page.dart';
import 'package:curriculum_site/app/pages/about_me_page.dart';
import 'package:curriculum_site/app/pages/skills_page.dart';
import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: OverflowBox(
          minWidth: 800,
          child: _buildBody(),
        ));
  }

  _buildBody() {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: AppColors.darkGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  menuButton(label: 'Inicio', index: 0),
                  SizedBox(
                    width: 40,
                  ),
                  menuButton(label: 'Sobre mim', index: 1),
                  SizedBox(
                    width: 40,
                  ),
                  menuButton(label: 'Conhecimentos', index: 2),
                  SizedBox(
                    width: 40,
                  ),
                  menuButton(label: 'Contato', index: 3),
                ],
              ),
            )),
        Expanded(
          flex: 16,
          child: PageView(
            onPageChanged: (index) {
              currentPage = index;
              setState(() {});
            },
            controller: pageController,
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            children: [
              PresentationPage(),
              AboutMePage(),
              SkillsPage(),
              ContactPage(),
            ],
          ),
        ),
      ],
    );
  }

  menuButton({required String label, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 130), curve: Curves.easeIn);
        });
      },
      child: Container(
        child: Text(
          label,
          style: TextStyle(
              color: currentPage == index
                  ? AppColors.spotLight
                  : AppColors.midGrey,
              fontSize: 22),
        ),
      ),
    );
  }
}
