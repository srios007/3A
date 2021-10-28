import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_3_astronautas/components/a3_button.dart';
import 'package:prueba_3_astronautas/config/config.dart';
import 'package:prueba_3_astronautas/screens/screens.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  'Bienvenido al desafío de encontrar las islas para Tres Astronautas.',
                  style: Styles.welcomeTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  'Desarrollado por: Santiago Rios Valero',
                  style: Styles.welcomeSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset('images/3a.png'),
              ),
              A3Button(
                title: 'Empezar',
                onPressed: () {
                   Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SetMatrixSizeScreen(),
                    ),
                  );
                },
              ),
              A3Button(
                title: 'Instrucciones',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => InstructionsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
