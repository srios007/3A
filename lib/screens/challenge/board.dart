import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_3_astronautas/components/components.dart';
import 'package:prueba_3_astronautas/config/config.dart';
import 'package:prueba_3_astronautas/models/models.dart';
import 'package:prueba_3_astronautas/screens/challenge/algorithm.dart';

class BoardScreen extends StatefulWidget {
  BoardScreen({@required this.height, @required this.width});
  int height;
  int width;
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<List<Island>> matrix = List<List<Island>>();
  List<Island> numbers = [];
  var random = Random();
  @override
  void initState() {
    int aux = 0;
    setState(() {
      for (int i = 0; i < widget.height; i++) {
        List<Island> list = [];
        for (int j = 0; j < widget.width; j++) {
          list.add(
            Island(
              number: random.nextInt(2),
              isVisited: false,
              listPosition: aux,
              height: i,
              width: j,
            ),
          );
          aux += 1;
          print(aux);
        }
        matrix.add(list);
      }

      for (var i = 0; i < widget.height; i++) {
        for (var j = 0; j < widget.width; j++) {
          numbers.add(matrix[i][j]);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Palette.a3Color,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Tablero',
                  style: Styles.welcomeTitleStyle,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: Text(
                    'Elegiste un tablero de ${widget.height} de alto y ${widget.width} de ancho',
                    style: Styles.welcomeSubtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: (100.0 * widget.height),
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.width,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: numbers.length,
                      itemBuilder: (BuildContext context, index) {
                        return CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            print(
                                'La posición es ${numbers[index].height} x ${numbers[index].width}');
                            print(
                                'El número de la posición es ${matrix[numbers[index].height][numbers[index].width].listPosition} ');
                            setState(() {
                              if (numbers[index].number == 0) {
                                numbers[index].number = 1;
                                matrix[numbers[index].height]
                                        [numbers[index].width]
                                    .number = 1;
                              } else {
                                numbers[index].number = 0;
                                matrix[numbers[index].height]
                                        [numbers[index].width]
                                    .number = 0;
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${numbers[index].number}',
                              style: TextStyle(
                                color: Palette.black,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: numbers[index].number == 1
                                  ? Palette.green
                                  : Palette.blue,
                              border: Border.all(
                                color: Palette.black,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                A3Button(
                  title: 'Calular',
                  onPressed: () {
                    Algorithm p = Algorithm();
                    print(
                      p.countIslands(matrix, widget.height, widget.width),
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
