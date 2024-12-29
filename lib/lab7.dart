import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Hero Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RadialHeroAnimationScreen(),
    );
  }
}

class RadialHeroAnimationScreen extends StatelessWidget {
  const RadialHeroAnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 24, 24),
      appBar: AppBar(
        title: const Text('Radial Hero Animation Demo'),
      ),
      body: Center(
        
        child: RadialExpansion(
          photo: 'good.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailScreen()),
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion({
    Key? key,
    required this.photo,
    required this.onTap,
  }) : super(key: key);

  final String photo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Hero(
          tag: photo,
          child: Image.asset(
            photo,
            width: 150.0,
            height: 150.0,
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'cake.png',
            child: Image.asset(
              'good.png',
              width: 300.0,
              height: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}