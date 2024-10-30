// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Card'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ), //AppBar
      body: Center(
        child: Card(
            elevation: 100,
            shadowColor: Colors.black,
            color: const Color.fromARGB(255, 10, 11, 41),
            child: Container(
              width: 300,
              height: 500,
              child: Column(
              
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Abdul Rehman',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0004-2520-0000-1231',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 219, 136, 20),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
      ),
      )
    ); //Center
    
  }
}
