// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class Colorpick extends StatefulWidget {
  @override
  ColorpickState createState() => ColorpickState();
}

class ColorpickState extends State<Colorpick> {
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("color picker app"),
              centerTitle: true,
            ),
            body: Container(
              color: color,
              child: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        // Create the SelectionScreen in the next step.
                        MaterialPageRoute(builder: (context) => pickcolor()),
                      );

                      setState(() {
                        color = result;
                      });
                    },
                    child: Text("choose color for background")),
              ),
            )));
  }
}

class pickcolor extends StatefulWidget {
  const pickcolor({super.key});

  @override
  State<pickcolor> createState() => _pickcolorState();
}

class _pickcolorState extends State<pickcolor> {
  Color selectedColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff3B1C32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),
            height: 100,
            width: 100,
            color: selectedColor,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: MaterialColorPicker(
                        selectedColor: selectedColor,
                        onColorChange: (Color color) {
                          // Handle color changes
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        colors: [
                          Colors.deepPurple,
                          Colors.blue,
                          Colors.deepOrange,
                          Colors.yellow,
                          Colors.lightGreen
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, selectedColor);
                          },
                          child: Text("ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("pick color"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedColor);
              },
              child: Text("ok"),
            ),
          ])
        ],
      ),
    );
  }
}
