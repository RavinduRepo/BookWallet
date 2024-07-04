// import 'package:flutter/material.dart';

// import 'package:book_wallert/colors.dart';
// import 'package:book_wallert/screens/main_screen/groups_screen/groups_screen_body.dart';
// import 'package:book_wallert/screens/main_screen/profile_screen/profile_screen_body.dart';
// import 'package:book_wallert/screens/main_screen/top_panel.dart';
// import 'package:book_wallert/buttons/custom_button.dart';
// import 'package:book_wallert/screens/test_screens/test_screen_frame.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: MyColors.bgColor,
//       ),
//       routes: {
//         '/groups': (context) => const TestScreen(),
//         '/profile': (context) => const ProfileScreenBody(),
//       },
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       switch (index) {
//         case 0:
//           Navigator.pushReplacementNamed(context, '/');
//           break;
//         case 1:
//           Navigator.pushReplacementNamed(context, '/groups');
//           break;
//         case 3:
//           Navigator.pushReplacementNamed(context, '/profile');
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TopPanel(title: 'pageName'),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               CustomToggleButton(text: 'Recommended'),
//               SizedBox(width: 10),
//               CustomToggleButton(text: 'Trending'),
//               SizedBox(width: 10),
//               CustomToggleButton(text: 'Wishlist'),
//               SizedBox(width: 10),
//               CustomToggleButton(text: 'Completed'),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: const [
//                 BookListView(),
//                 BookListView(),
//                 BookListView(),
//                 BookListView(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 30,
//         backgroundColor: MyColors.navigationBarColor,
//         unselectedItemColor: MyColors.nonSelectedItemColor,
//         selectedItemColor: MyColors.selectedItemColor,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'Groups',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.library_books),
//             label: 'Books',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline_outlined),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BookListView extends StatelessWidget {
//   const BookListView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10, // Change this to the number of books
//       itemBuilder: (context, index) {
//         return Card(
//           color: MyColors.panelColor, // Ensure card matches background
//           child: ListTile(
//             leading: Image.asset(
//               'Images/Book_Image1.jpg',
//               scale: 1,
//             ), // Book cover image
//             title: const Text(
//               'Dune Messiah',
//               style: TextStyle(color: Colors.white), // Ensure text is visible
//             ),
//             subtitle: const Text(
//               'Frank Herbert\nPages: 256\nGenre: Science Fiction\nTotal Rating: 9.8/10',
//               style: TextStyle(color: Colors.white), // Ensure text is visible
//             ),
//             isThreeLine: true,
//             trailing: IconButton(
//               icon: const Icon(Icons.favorite_border, color: Colors.white),
//               onPressed: () {
//                 // Add to wishlist action
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }