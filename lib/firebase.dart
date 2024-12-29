import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';


class MyAppflutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<String?>(
        future: SharedPreferences.getInstance()
            .then((prefs) => prefs.getString('username')),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomeScreen(username: snapshot.data!);
          }
          return UsernameScreen();
        },
      ),
    );
  }
}

// lib/services/device_id_service.dart

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final _usernameController = TextEditingController();

  void _saveUsername() async {
    final username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen(username: username)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Username')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveUsername,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}


class BookService {
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$query'));
    final data = json.decode(response.body);
    return (data['items'] as List).map((item) => Book.fromJson(item)).toList();
  }
}

// lib/models/book.dart
class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    return Book(
      id: json['id'],
      title: volumeInfo['title'] ?? '',
      author: (volumeInfo['authors'] as List?)?.first ?? '',
      description: volumeInfo['description'] ?? '',
      imageUrl: volumeInfo['imageLinks']?['thumbnail'] ?? '',
    );
  }
}

// lib/services/firestore_service.dart


class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFavorite(String username, Book book) async {
    await _firestore
        .collection('users')
        .doc(username)
        .collection('favorites')
        .doc(book.id)
        .set({
      'title': book.title,
      'author': book.author,
      'description': book.description,
      'imageUrl': book.imageUrl,
    });
  }

  Future<void> removeFavorite(String username, String bookId) async {
    await _firestore
        .collection('users')
        .doc(username)
        .collection('favorites')
        .doc(bookId)
        .delete();
  }

  Stream<List<Book>> getFavorites(String username) {
    return _firestore
        .collection('users')
        .doc(username)
        .collection('favorites')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Book(
                  id: doc.id,
                  title: doc['title'],
                  author: doc['author'],
                  description: doc['description'],
                  imageUrl: doc['imageUrl'],
                ))
            .toList());
  }
}

// lib/screens/home_screen.dart
class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookService _bookService = BookService();
  final _searchController = TextEditingController();
  List<Book> _books = [];

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => UsernameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Store (${widget.username})'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FavoritesScreen(username: widget.username),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Books',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final books = await _bookService.searchBooks(_searchController.text);
                    setState(() => _books = books);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _books.length,
              itemBuilder: (context, index) {
                final book = _books[index];
                return ListTile(
                  leading: book.imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: book.imageUrl,
                          width: 50,
                        )
                      : Icon(Icons.book),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookDetailScreen(
                        book: book,
                        username: widget.username,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// lib/screens/book_detail_screen.dart
class BookDetailScreen extends StatelessWidget {
  final Book book;
  final String username;

  BookDetailScreen({required this.book, required this.username});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book.imageUrl.isNotEmpty)
              Center(
                child: CachedNetworkImage(
                  imageUrl: book.imageUrl,
                  height: 200,
                ),
              ),
            SizedBox(height: 16),
            Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
            Text(book.author, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            Text(book.description),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.favorite),
              label: Text('Add to Favorites'),
              onPressed: () => firestoreService.addFavorite(username, book),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/screens/favorites_screen.dart
class FavoritesScreen extends StatelessWidget {
  final String username;

  FavoritesScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: StreamBuilder<List<Book>>(
        stream: firestoreService.getFavorites(username),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final books = snapshot.data!;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                leading: book.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: book.imageUrl,
                        width: 50,
                      )
                    : Icon(Icons.book),
                title: Text(book.title),
                subtitle: Text(book.author),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      firestoreService.removeFavorite(username, book.id),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookDetailScreen(
                      book: book,
                      username: username,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}