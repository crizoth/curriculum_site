import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutMePage extends StatelessWidget {
  AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 1100,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: aboutMeAsPerson()),
            SizedBox(
              width: 40,
            ),
            Expanded(
              flex: 1,
              child: aboutMeAsProfessional(),
            )
          ],
        ),
      ),
    );
  }

  aboutMeAsPerson() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
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
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            child: personCardInfo(),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Olá! Sou um apaixonado desenvolvedor autodidata com mais de 2 anos de experiência na criação de aplicativos e interfaces incríveis para a web, Android e iOS. Minha jornada no mundo da programação começou com um profundo interesse em transformar ideias em realidade, e esse interesse me impulsionou a me tornar um desenvolvedor usando a tecnologia Flutter.',
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
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
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
          SizedBox(
            height: 30,
          ),
          experienceCard('2023', 'Conlife:',
              'Desenvolvedor pleno Flutter, responsável pelo aplicativo e plataforma Web de um internetBanking entre outras funcionalidades; publicado para android e IOS.'),
          experienceCard(
            '2022\n2023',
            'Tinnova:',
            'Desenvolvedor pleno Flutter, integrante de uma equipe de desenvolvedores de uma software house, que cuidava de diveros apps de clientes.',
            inverted: true,
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

  personCardInfo() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
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
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300),
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                            'Disponível para trabalho presencial ou remoto')),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }

  experienceCard(String label, String title, String content,
      {bool inverted = false}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Row(
        mainAxisAlignment: // MainAxisAlignment.center,
            inverted ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!inverted)
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.secondarySpotLight),
              child: Center(child: Text(label)),
            ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: // MainAxisAlignment.center,
                      inverted
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        textAlign: inverted ? TextAlign.right : TextAlign.left,
                        content,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          if (inverted)
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.secondarySpotLight),
              child: Center(child: Text(label)),
            ),
        ],
      ),
    );
  }
}
