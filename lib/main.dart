import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

//stateless widget (root widget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color change app',
      theme: ThemeData.dark(),
      home: ColorChangeScreen(),
    );
  }
}

//stateful widget (changes state when tapped)
class ColorChangeScreen extends StatefulWidget {
  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  Color _bgColor = Colors.blueGrey; //initial color

  //function generate random colors
  void _changeColor() {
    setState(() {
      _bgColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });

    //show a snack box message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Color changed!'),
        duration: Duration(microseconds: 500),
        backgroundColor: _bgColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:GestureDetector(
        onTap: _changeColor, //change color when tapped,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: _bgColor,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                
              ),
            )
          ),
        ),
      ),
    );
  }
}
