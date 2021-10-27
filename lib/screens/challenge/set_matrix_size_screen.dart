import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_3_astronautas/components/components.dart';
import 'package:prueba_3_astronautas/config/config.dart';
import 'package:prueba_3_astronautas/screens/screens.dart';

class SetMatrixSizeScreen extends StatefulWidget {
  @override
  _SetMatrixSizeScreenState createState() => _SetMatrixSizeScreenState();
}

class _SetMatrixSizeScreenState extends State<SetMatrixSizeScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                    'Vamos a elegir el tamaño del tablero',
                    style: Styles.welcomeTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Text(
                    'Tendrás que indicar el alto y el ancho de la matriz',
                    style: Styles.welcomeSubtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    A3TextField(
                      controller: heightController,
                      hintText: '5',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (text) {
                        // _canPush();
                      },
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Por favor, rellena este campo';
                        }
                      },
                    ),
                    A3TextField(
                      controller: widthController,
                      hintText: '5',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (text) {
                        // _canPush();
                      },
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Por favor, rellena este campo';
                        }
                      },
                    ),
                  ],
                ),
                A3Button(
                  title: 'Continuar',
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
      ),
    );
  }
}
