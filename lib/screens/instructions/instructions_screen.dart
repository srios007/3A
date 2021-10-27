import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_3_astronautas/config/config.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Palette.a3Color),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    'Instrucciones',
                    style: Styles.welcomeTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    '1. Tendras que elegir el tamaño de la matriz al iniciar el desafio y así poder darle tamaño a un tablero coo el que encontrarás a continuación.',
                    style: Styles.normalLabelStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Image.asset('images/ejemplo.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: Text(
                    '2. En la siguiente pestaña encontrarás el tablero con el tamaño que anteriormente elegiste, tendrás un botón el cual te calculará el numeró total de islas que están presentes en el tablero',
                    style: Styles.normalLabelStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
