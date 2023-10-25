import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = TextStyle(
        fontSize: 46, color: AppColors.spotLight, fontWeight: FontWeight.w600);
    TextStyle subtitleStyle = TextStyle(fontSize: 38, color: Colors.white);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600),
      child: Container(
        decoration: BoxDecoration(
            //  color: Color.fromARGB(255, 35, 45, 49),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.spaceBlue, Colors.black])),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Olá! Eu sou',
                          style: subtitleStyle,
                        ),
                        Text(
                          'Cristiano Silva',
                          style: titleTextStyle,
                        ),
                        Text(
                          'Desenvolvedor flutter',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        height: 400, width: 400,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [Colors.cyan, Colors.transparent],
                          ),
                          borderRadius: BorderRadius.circular(200),
                          // border: Border.all(),
                        ),
                        // padding:
                        // EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Image.asset('assets/images/profile_photo.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
