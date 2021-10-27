import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool canPushBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Palette.a3Color),
      ),
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
                Text(
                  'Vamos a elegir el tamaño del tablero',
                  style: Styles.welcomeTitleStyle,
                  textAlign: TextAlign.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Alto: ',
                        style: Styles.a3LabelStyle,
                      ),
                    ),
                    A3TextField(
                      controller: heightController,
                      hintText: '5',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      textInputFormatters: [
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      onChanged: (text) {
                        _canPush();
                      },
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return 'Por favor, rellena este campo';
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                      child: Text(
                        'Ancho: ',
                        style: Styles.a3LabelStyle,
                      ),
                    ),
                    A3TextField(
                      controller: widthController,
                      hintText: '5',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        _canPush();
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
                  canPush: canPushBool,
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

  void _canPush() {
    if (heightController.text.trim() != '' &&
        widthController.text.trim() != '') {
      setState(() {
        canPushBool = true;
      });
    } else {
      setState(() {
        canPushBool = false;
      });
    }
  }
}
