// import 'dart:math';

import 'package:flutter/material.dart';
import 'eyes.dart';
import 'add_task.dart';

//run pub get
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Categories',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter Labs')),
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
                      MaterialPageRoute(builder: (context) => Todolist()));
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
          ],
        ),
      ),
    );
  }
}

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

class MenuCategoriesScreen extends StatefulWidget {
  @override
  _MenuCategoriesScreenState createState() => _MenuCategoriesScreenState();
}

class _MenuCategoriesScreenState extends State<MenuCategoriesScreen> {
  late List<MenuCategory> categories;

  @override
  void initState() {
    super.initState();
    categories = [
      MenuCategory(name: 'Pastry', itemCount: 25, imageUrl: "paistry.png"),
      MenuCategory(name: 'Donut', itemCount: 30, imageUrl: 'Donut.png'),
      MenuCategory(name: 'Ice Cream', itemCount: 30, imageUrl: 'ice.png'),
      MenuCategory(name: 'Cake', itemCount: 44, imageUrl: 'cake.png'),
      MenuCategory(name: 'Mufflin', itemCount: 5, imageUrl: 'muffins.png'),
    ];
  }

  Map<String, int> cart = {};

  void addToCart(String itemName) {
    setState(() {
      MenuCategory category = categories.firstWhere((c) => c.name == itemName);
      if (category.itemCount > 0) {
        if (cart.containsKey(itemName)) {
          cart[itemName] = cart[itemName]! + 1;
        } else {
          cart[itemName] = 1;
        }
        category.itemCount--;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$itemName added to cart')),
        );
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$itemName is out of stock')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // not working
                      },
                    ),
                    Spacer(),
                    Text('AR Bakers',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          onPressed: () {
                            if (cart.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage(
                                        cart: cart, categories: categories)),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Cart is empty')),
                              );
                            }
                          },
                        ),
                        if (cart.isNotEmpty)
                          CircleAvatar(
                            // number on cart icon
                            radius: 8,
                            backgroundColor: Colors.yellow,
                            child: Text(
                              cart.values.reduce((a, b) => a + b).toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: categories[index],
                        onAddToCart: () => addToCart(categories[index].name),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final MenuCategory category;
  final VoidCallback onAddToCart;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: Transform.scale(
                  scale:
                      0.9, // Change this value to adjust the zoom level (less than 1 to zoom out)
                  child: Image.asset(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    width: 120, // Set width and height according to your needs
                    height: 120,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  Text('${category.itemCount} items',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add,
                  color: category.itemCount > 0
                      ? Colors.grey
                      : Colors.grey.withOpacity(0.3)),
              onPressed: category.itemCount > 0 ? onAddToCart : null,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCategory {
  final String name;
  int itemCount;
  final String imageUrl;

  MenuCategory(
      {required this.name, required this.itemCount, required this.imageUrl});
}

class CartPage extends StatefulWidget {
  final Map<String, int> cart;
  final List<MenuCategory> categories;

  const CartPage({Key? key, required this.cart, required this.categories})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  String itemName = widget.cart.keys.elementAt(index);
                  MenuCategory category =
                      widget.categories.firstWhere((c) => c.name == itemName);
                  return CartItem(
                    category: category,
                    quantity: widget.cart[itemName]!,
                    onDelete: () {
                      setState(() {
                        widget.cart[itemName] = widget.cart[itemName]! - 1;
                        if (widget.cart[itemName]! <= 0) {
                          widget.cart.remove(itemName);
                        }
                        if (widget.cart.isEmpty) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuCategoriesScreen()),
                          );
                        }
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:'),
                  Text(
                    ' ${widget.cart.values.isNotEmpty ? widget.cart.values.reduce((a, b) => a + b) : 0} items',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final MenuCategory category;
  final int quantity;
  final VoidCallback onDelete;

  const CartItem({
    Key? key,
    required this.category,
    required this.quantity,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(category.imageUrl),
            radius: 40,
          ),
          title: Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text('x$quantity', style: TextStyle(color: Colors.grey)),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}

class Players {
  late String name;
  late String type;
  late int runs;
  late int wickets;
  late int matches;

  Players({required this.name, required this.type}) {
    this.runs = 0;
    this.wickets = 0;
    this.matches = 0;
  }
}

class PlayerList extends StatelessWidget {
  final List<Players> players = [
    Players(name: "Virat", type: "Batsman"),
    Players(name: "bobzy", type: "Batsman"),
    Players(name: "rizzu", type: "Batsman"),
    Players(name: "Saad Akhtar", type: "Batsman"),
    Players(name: "Rohit Sharma", type: "Batsman"),
  ];
  PlayerList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Players'),
        ),
        body: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlayerDetails(player: players[index]),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "${players[index].name.replaceFirst(" ", "_")}.png"),
                  radius: 30,
                ),
                title: Text(players[index].name),
                subtitle: Text(players[index].type),
              );
            }));
  }
}

class PlayerDetails extends StatelessWidget {
  final Players player;
  const PlayerDetails({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage("${player.name.replaceFirst(" ", "_")}.png"),
              radius: 100,
            ),
            SizedBox(height: 16),
            Text("Runs: ${player.runs}"),
            Text("Wickets: ${player.wickets}"),
            Text("Matches: ${player.matches}"),
          ],
        ),
      ),
    );
  }
}

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

// class AddTask extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Task"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Text("Add Task : "),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Enter your username',
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
