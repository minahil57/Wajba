// import 'package:firebase_auth/firebase_auth.dart';
// class Auth {
//   //Creating a new instance of firebase auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? get currentUser => _auth.currentUser;
//
//   Stream<User?> get authStateChanges => _auth.authStateChanges();
//
//   Future<void> registerwithEmailAndPassword(String email, String password) async {
//     await _auth.createUserWithEmailAndPassword(
//       email:email,
//       password:password,
//     );
//   }
//   Future<void> signInWithEmailAndPassword(String email, String password) async{
//     await _auth.signInWithEmailAndPassword(
//       email:email,
//       password:password,
//     );
//   }
//   Future<void> signOut() async{
//     await _auth.signOut();
//   }
// }