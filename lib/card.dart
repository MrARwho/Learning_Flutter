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
          elevation: 10,
          shadowColor: Colors.black,
          color: const Color.fromARGB(255, 10, 11, 41),
          child: SizedBox(
            width: 300,
            height: 500,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      'Abdul Rehman',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text(
                      '0004-2520-0000-1231',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 219, 136, 20),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0, right: 10.0),
                    child: Text(
                      'Expiry: 22/5/2027',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0, left: 10.0),
                    child: Image(image: const AssetImage('visa.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, left:5.0),
                    child: Image(image: const AssetImage('AR.png'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, left:5.0),
                    child: Image(image: const AssetImage('NFC.png'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //Center
  }
}
