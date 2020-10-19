import 'package:charifa/datas/lista.dart';
import 'package:flutter/material.dart';

class ControleScreen extends StatefulWidget {
  ControleScreen({Key key}) : super(key: key);

  @override
  _ControleScreenState createState() => _ControleScreenState();
}

class _ControleScreenState extends State<ControleScreen> {
  Map<String, String> mapa;

  @override
  void initState() {
    super.initState();
    mapa = getLista();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Chá Rifa Antonela Maria"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: mapa.length,
              itemBuilder: (context, index) {
                var numero = mapa.keys.elementAt(index);
                var nome = mapa.values.elementAt(index);
                return ListTile(
                    leading: Text(
                      numero,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(nome));
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          )),
    );
  }
}
