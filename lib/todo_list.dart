import 'package:flutter/material.dart';
import 'add_task.dart';
class Todolist extends StatefulWidget {
  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final List<String> tasks = ["Task 1", "Task 2", "Task 3", "Task 4"];
  List<bool> taskCompletionStatus = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF3451a1)),
        home: Scaffold(
          appBar: AppBar(
            elevation: 10,
            backgroundColor: Color.fromARGB(0, 5, 25, 86),
            title: Text(
              "To Do List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      minTileHeight: 70,
                      title: Text(
                        tasks[index],
                        style: TextStyle(
                          decoration: taskCompletionStatus[index]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      tileColor: const Color(0xff051956),
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      leading: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: Color(0xFFe906fd),
                            side: BorderSide(color: Color(0xFFe906fd)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            value: taskCompletionStatus[index],
                            checkColor: Color(0xFF051956),
                            onChanged: (bool? value) {
                              setState(() {
                                taskCompletionStatus[index] = value ?? false;
                              });
                            },
                          )),
                    ),
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTask()),
              );
            },
            backgroundColor: Color(0xFFe907f9),
            tooltip: "Add Task",
            child: Icon(Icons.add),
          ),
        ));
  }
}