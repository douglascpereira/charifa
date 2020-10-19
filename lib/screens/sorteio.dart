import 'package:charifa/datas/lista.dart';
import 'package:flutter/material.dart';

import 'dart:math' show Random;

class Sorteio extends StatefulWidget {
  const Sorteio({Key key}) : super(key: key);

  @override
  _SorteioState createState() => _SorteioState();
}

class _SorteioState extends State<Sorteio> {
  String numeroSorteado = "0";
  String numero1 = "0";
  String numero2 = "0";
  var map;
  var nome1Lugar = "";
  var nome2Lugar = "";

  @override
  void initState() {
    super.initState();
    map = getLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sorteio do Chá Rifa"),
        actions: [
          IconButton(
              icon: Icon(Icons.restore_from_trash),
              onPressed: () {
                setState(() {
                  numeroSorteado = "0";
                  numero1 = "0";
                  numero2 = "0";
                  nome1Lugar = "";
                  nome2Lugar = "";
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Center(
              child: Text(numeroSorteado,
                  style: TextStyle(fontSize: 100), textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(children: [
                  Text(
                    "1º Lugar - R\$150,00",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    nome1Lugar,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "2º Lugar - R\$75,00",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    nome2Lugar,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: nome2Lugar == ""
            ? () {
                _sortear();
              }
            : null,
        label: Text(''),
        icon: Icon(Icons.check),
        backgroundColor: Colors.pink,
      ),
    );
  }

  void _sortear() {
    final _random = new Random();
    var keys = map.keys.toList();
    var element = keys[_random.nextInt(keys.length)];
    var r = map[element];
    setState(() {
      numeroSorteado = "${element.toString()}";
      //numeroSorteado = "1";
      if (nome1Lugar == "") {
        numero1 = numeroSorteado;
        nome1Lugar = "Premiado: ${element.toString()} - $r";
      } else {
        if (numero1 == numeroSorteado) {
          final _newRandom = new Random();
          var newKeys = map.keys.toList();
          var newElement = newKeys[_newRandom.nextInt(newKeys.length)];
          var newR = map[newElement];
          numeroSorteado = "${newElement.toString()}";
          nome2Lugar = "Premiado: ${newElement.toString()} - $newR";
        } else {
          nome2Lugar = "Premiado: ${element.toString()} - $r";
        }
      }
    });
  }
}
