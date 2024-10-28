import 'package:flutter/material.dart';
import 'eyes.dart';

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  bool isEyeOpen = true;
  late String _Output = '';
  late int a;
  late int b;
  bool state = false;
  void togglestate() {
    setState(() {
      state = !state; // Toggle the state of the eyes on button press
    });
  }

  void toggleEyes() {
    setState(() {
      isEyeOpen = !isEyeOpen; // Toggle the state of the eyes on button press
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator')),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 76, 115, 224),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.black,
                width: 5,
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EyeWidget(isEyeOpen: isEyeOpen),
                  EyeWidget(isEyeOpen: isEyeOpen),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 100, 200, 247),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: const Color.fromARGB(255, 244, 54, 187),
                          width: 5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$_Output ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("smile.png"),
                        width: 250,
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: const Color.fromARGB(255, 244, 54, 187),
                          width: 5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    toggleEyes();
                                    togglestate();
                                    if (!state) {
                                      // Toggle the eyes' state
                                      _Output = '';
                                    } else {
                                      _Output = '0';
                                    } // Clear the output
                                  });
                                },
                                child: Text('ON/OFF'),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: GridView.count(
                              childAspectRatio: 0.8 / 0.7,
                              crossAxisCount: 4,
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '7';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '7',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '8';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '8',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '9';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '9',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '/';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '/',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '4';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '4',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '5';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '5',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '6';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '6',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '-';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '-',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '1';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '2';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '2',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '3';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '3',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              a = int.parse(_Output);
                                              print(a);
                                              _Output += '+';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '+',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '0';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '0',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output += '0';
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '0',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              b = int.parse(
                                                  _Output.split('+').last);
                                              print(b);
                                              _Output = (a + b).toString();
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      '=',
                                      style: TextStyle(fontSize: 30),
                                    )),
                                ElevatedButton(
                                    onPressed: state
                                        ? () {
                                            setState(() {
                                              _Output = _Output.substring(
                                                  0, _Output.length - 1);
                                            });
                                          }
                                        : null,
                                    child: Text(
                                      'C',
                                      style: TextStyle(fontSize: 30),
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}