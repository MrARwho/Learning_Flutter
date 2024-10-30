import 'package:flutter/material.dart';
import 'package:hello/card.dart';
import 'eyes.dart';

class ClassTasks extends StatelessWidget {
  final List<Widget> pages = [
    EyeWidget(isEyeOpen: true),
    card()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class Tasks'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Task ${index + 1}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  },
                );
              }),
        ));
  }
}
