// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService extends ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User?> get user => _auth.authStateChanges();

//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//   }

//   Future<void> registerWithEmailAndPassword(String email, String password) async {
//     await _auth.createUserWithEmailAndPassword(email: email, password: password);
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }