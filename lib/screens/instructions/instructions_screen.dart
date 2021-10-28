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
                    '1. Tendrás que elegir el tamaño de la matriz al iniciar el desafío y así poder darle tamaño a un tablero como el que encontrarás a continuación.',
                    style: Styles.normalLabelStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Image.asset('images/ejemplo.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: Text(
                    '2. En la siguiente pestaña encontrarás el tablero con el tamaño que anteriormente elegiste, al ingresar a la pestaña podrás ver el número de islas. Adicional a esto si quieres cambiar alguna isla por agua o viceversa solo basta con tocarlo y el número de islas se recalculará.',
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
