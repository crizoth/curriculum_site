import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutMePage extends StatelessWidget {
  AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool mediumLayout = constraints.maxWidth < 1100;
      bool smallLayout = constraints.maxWidth < 860;
      return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: mediumLayout && !smallLayout
                ? 700
                : smallLayout
                    ? 800
                    : 600),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 60),
            decoration: BoxDecoration(
                //  color: Color.fromARGB(255, 35, 45, 49),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black,
                  AppColors.darkGrey,
                  Colors.black,
                ])),
            child: mediumLayout || smallLayout
                ? getColumnLayout()
                : getRowLayout()),
      );
    });
  }

  getRowLayout() {
    return Row(
      children: [
        Flexible(flex: 1, child: aboutMeAsPerson(false)),
        SizedBox(
          width: 40,
        ),
        Flexible(
          flex: 1,
          child: aboutMeAsProfessional(),
        )
      ],
    );
  }

  getColumnLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        aboutMeAsPerson(true),
        aboutMeAsProfessional(),
      ],
    );
  }

  aboutMeAsPerson(bool isColumn) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.spotLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sobre mim',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            child: personCardInfo(!isColumn),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Sou um apaixonado desenvolvedor autodidata com mais de 2 anos de experiência na criação de aplicativos e interfaces incríveis para a web, Android e iOS. Minha jornada no mundo da programação começou com um profundo interesse em transformar ideias em realidade, e esse interesse me impulsionou a me tornar um desenvolvedor usando a tecnologia Flutter.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  aboutMeAsProfessional() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.spotLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experiência profissional',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          experienceCard('2023', 'Conlife:',
              'Desenvolvedor pleno Flutter, responsável pelo aplicativo e plataforma Web de um internetBanking entre outras funcionalidades; publicado para android e IOS.'),
          SizedBox(
            height: 20,
          ),
          experienceCard(
            '2022\n2023',
            'Tinnova:',
            'Desenvolvedor pleno Flutter, integrante de uma equipe de desenvolvedores de uma software house, que cuidava de diveros apps de clientes.',
          ),
          SizedBox(
            height: 20,
          ),
          experienceCard(
            '2021\n2023',
            'NextMed:',
            'Desenvolvedor pleno Flutter, responsável pelo aplicativo  de um chat entre medicos para atender demandas profissionais; em desenvolvimento para android e IOS.',
          ),
        ],
      ),
    );
  }

  personCardInfo(bool showPerson) {
    print(showPerson);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showPerson)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),
          if (showPerson)
            SizedBox(
              width: 30,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: Cristiano'),
              Text('Idade: 30'),
              Text('Nacionalidade: Brasileiro'),
              Text('Moradia: São Paulo - Vale do Paraiba'),
              Text('Experiência: 2 anos+'),
              Text('Senioridade: Pleno'),
            ],
          ),
        ],
      ),
    );
  }

  experienceCard(
    String label,
    String title,
    String content,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.secondarySpotLight),
          child: Center(child: Text(label)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      // textAlign: TextAlign.left,
                      content,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
