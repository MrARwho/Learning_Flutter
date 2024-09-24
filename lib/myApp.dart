import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("AR Bakers"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 53, 208, 229),
        ),
        body: Center(
          child: Text("Hello"),
        ),
      ),

    );
  }
}