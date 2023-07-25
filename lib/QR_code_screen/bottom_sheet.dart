// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:wajba_new/Menu_display_files/menu_screen.dart';
// //import 'package:wajba_new/Chat/chat.dart';
// import 'package:wajba_new/QR_code_screen/qr_code.dart';
// import 'package:wajba_new/main_splash_drawer/drawwer/profile.dart';
//
// //import '../main_splash_drawer/drawwer/drawer.dart';
//
// class MyAppy extends StatelessWidget {
//   const MyAppy({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animated Notch Bottom Bar',
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 1,keepPage: true);
//
//   int maxCount = 3;
//
//   /// widget list
//   final List<Widget> bottomBarPages = [
//     const profile(),
//     MyApp_qr(),
//     wajba(),
//   ];
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//             bottomBarPages.length, (index) => bottomBarPages[index]),
//       ),
//       extendBody: true,
//       bottomNavigationBar: (bottomBarPages.length <= maxCount)
//           ? AnimatedNotchBottomBar(
//         pageController: _pageController,
//         color: Colors.orangeAccent,
//         showLabel: false,
//         notchColor: Colors.white,
//         bottomBarItems: const [
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.person,
//               color: Colors.white,
//             ),
//             activeItem: Icon(
//               Icons.person,
//               color: Colors.orangeAccent,
//             ),
//             itemLabel: 'Page 1',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.document_scanner_outlined,
//               color: Colors.white,
//             ),
//             activeItem: Icon(
//               Icons.document_scanner_outlined,
//               color: Colors.orangeAccent,
//             ),
//             itemLabel: 'Page 2',
//           ),
//
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.menu_book,
//               color: Colors.white,
//             ),
//             activeItem: Icon(
//               Icons.menu_book,
//               color: Colors.orangeAccent,
//             ),
//             itemLabel: 'Page 4',
//           ),
//         ],
//         onTap: (index) {
//           /// control your animation using page controller
//           _pageController.animateToPage(
//             index,
//             duration: const Duration(milliseconds: 20),
//             curve: Curves.easeIn,
//           );
//         },
//       )
//           : null,
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
//
// class Example extends StatefulWidget {
//   @override
//   _ExampleState createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Likes',
//       style: optionStyle,
//     ),
//     Text(
//       'Search',
//       style: optionStyle,
//     ),
//     Text(
//       'Profile',
//       style: optionStyle,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 20,
//         title: const Text('GoogleNavBar'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 20,
//               color: Colors.black.withOpacity(.1),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//             child: GNav(
//               rippleColor: Colors.grey[300]!,
//               hoverColor: Colors.grey[100]!,
//               gap: 8,
//               activeColor: Colors.black,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: Colors.grey[100]!,
//               color: Colors.black,
//               tabs: [
//                 GButton(
//                   icon: LineIcons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: LineIcons.heart,
//                   text: 'Likes',
//                 ),
//                 GButton(
//                   icon: LineIcons.search,
//                   text: 'Search',
//                 ),
//                 GButton(
//                   icon: LineIcons.user,
//                   text: 'Profile',
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }