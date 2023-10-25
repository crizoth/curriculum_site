import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({super.key});
  List<Skill> skills = [
    Skill(name: 'Flutter', description: 'Desenvolvimento mobile e web'),
    Skill(name: 'Dart', description: 'Dominioda linguagem'),
    Skill(name: 'Mobile', description: 'Publicação nas lojas'),
    Skill(name: 'WEB', description: 'Criação de sites complexos'),
    Skill(name: 'APIRest', description: 'Consumo de apis'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: skillList(),
    );
  }

  skillList() {
    // return ListView.builder(
    //     itemCount: skills.length,
    //     itemBuilder: (context, index) {
    //       return skillListTile(skill: skills[index]);
    //     });

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skillListTile(skill: skills[0], icon: 'assets/icons/flutter.svg'),
              skillListTile(skill: skills[1]),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skillListTile(skill: skills[2], icon: 'assets/icons/mobile.svg'),
              skillListTile(skill: skills[3], icon: 'assets/icons/web.svg'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              skillListTile(skill: skills[4], icon: 'assets/icons/rest.svg'),
              SizedBox(
                height: 220,
              )
            ],
          ),
        ],
      ),
    );
  }

  skillListTile({required Skill skill, String? icon}) {
    return Container(
      width: 210,
      height: 230,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 200,
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 20,
                      color: AppColors.spotLight,
                      offset: Offset(0, 0),
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 220,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: AppColors.spotLight),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.secondarySpotLight,
                    radius: 30,
                    child: SvgPicture.asset(
                      icon ?? 'assets/icons/dart.svg',
                      color: Colors.white,
                      height: 40,
                    )
                    //  Icon(icon ?? Icons.code),
                    ),
                Text(
                  skill.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Flexible(child: Text(skill.description)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skill {
  String name;
  String description;

  Skill({required this.name, required this.description});
}
