import 'package:flutter/material.dart';

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
      home: MenuCategoriesScreen(),
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
                    Text('AR Bakers', style: TextStyle(color: Colors.white , fontSize: 20)),
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
