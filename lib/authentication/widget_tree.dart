// import 'package:wajba_new/user_authentication/sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:wajba_new/QR_code_screen/qr_code.dart';
// // import '../Menu_display_files/menu_screen.dart';
// // import '../authentication/auth.dart';
// import 'package:flutter/material.dart';
//
// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});
//
//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }
//
// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return  StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(), // Stream that emits authentication state changes
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return MyApp_qr(); // Return the 'wajba' widget if there is authenticated user data
//         } else {
//           return login_page(); // Return the 'login_page' widget if there is no authenticated user data
//         }
//       },
//     );
//   }
// }
