import 'package:charifa/screens/controle.dart';
import 'package:charifa/screens/sorteio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chá Rifa Antonela Maria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chá Rifa Antonela Maria"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.border_all),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ControleScreen()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Image(image: AssetImage('images/charifa.jpeg'))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Sorteio()));
        },
        child: Icon(Icons.flag),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
