import 'package:flutter/material.dart';
import 'package:hello/Lab5.dart';
import 'calculator.dart';
import 'foodapp.dart';
import 'players.dart';
import 'classtasks.dart';
import 'lab6.dart';

//run pub get
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Labs',
      
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter Labs' , style: TextStyle(color: Colors.white),)),
        backgroundColor: const Color.fromARGB(255, 71, 71, 250),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: GridView.count(
          crossAxisCount: 4,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuCategoriesScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Lab 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculator()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Lab 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayerList()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Lab 3'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Lab5()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Lab 5'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Lab6()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Lab 6'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClassTasks()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Class Tasks'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




