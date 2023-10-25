import 'package:curriculum_site/extras/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:html' as html;

import 'package:fluttertoast/fluttertoast.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, screen) {
      return ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: screen.maxWidth < 880 ? 700 : 600),
        child: Container(
          color: AppColors.midGrey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contato',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: AppColors.midGrey),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black,
                      AppColors.darkGrey,
                      Colors.black,
                    ])),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: screen.maxWidth < 800 ? 40 : 20,
                        crossAxisSpacing: 10,
                        crossAxisCount: screen.maxWidth < 880 ? 2 : 3,
                        childAspectRatio: screen.maxWidth /
                            (3 *
                                100), // Ajuste o valor 100 para o tamanho desejado dos itens
                      ),
                      children: [
                        contactItem(
                          ctx: context,
                          content: '(12)9 8295-0502',
                          icon: 'assets/icons/mobile.svg',
                        ),
                        contactItem(
                            ctx: context,
                            icon: 'assets/icons/instagram.svg',
                            content: '@cristianosilvadev'),
                        contactItem(
                            ctx: context,
                            icon: 'assets/icons/whatsapp.svg',
                            content: '(12)9 9639-0624'),
                        contactItem(
                            ctx: context,
                            onTap: () {
                              html.window.open(
                                  'https://www.linkedin.com/in/cristiano-silva-8878b5181/',
                                  'linkedin');
                            },
                            hint: 'Visitar',
                            data:
                                'https://www.linkedin.com/in/cristiano-silva-8878b5181/',
                            icon: 'assets/icons/linkedin.svg',
                            content: 'linkedin.com/cristiano'),
                        contactItem(
                            ctx: context,
                            icon: 'assets/icons/gmail.svg',
                            content: 'crizoth@gmail.com'),
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: SvgPicture.asset(
                        'assets/icons/flutter.svg',
                        color: Colors.white,
                      ),
                      backgroundColor: AppColors.secondarySpotLight,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Site feito em flutter')
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  contactItem(
      {String? icon,
      String? content,
      String? data,
      Function? onTap,
      String? hint,
      required BuildContext ctx}) {
    return Tooltip(
      message: hint ?? 'Copiar',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            if (onTap != null) {
              onTap();
            }
            Clipboard.setData(ClipboardData(text: data ?? content!));
            showDialog(
                barrierColor: Colors.transparent,
                context: ctx,
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.green,
                              child: Center(child: Text('Copiado')),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                });
            await Future.delayed(Duration(seconds: 1));
            Navigator.of(ctx).pop();
          },
          child: Row(
            children: [
              Container(
                  // height: 100,
                  // width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.spotLight),
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset(
                    icon ?? 'assets/icons/dart.svg',
                    color: AppColors.spotLight,
                    height: 80,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                content ?? 'conteudo',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.midGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
