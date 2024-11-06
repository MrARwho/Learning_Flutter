
import 'package:flutter/material.dart';
import 'package:hello/colorpick.dart';
import 'package:hello/questions.dart';
import 'package:hello/todo_list.dart';

class Lab5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter Lab 5' , style: TextStyle(color: Colors.white),)),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Todolist()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('Task 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Colorpick()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('task 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 131, 82),
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                child: Text('task 3'),
              ),
            ),
          ],
        ),
      ),
      
  );
  }
}