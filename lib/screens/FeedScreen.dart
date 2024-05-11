// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dietandfitness/screens/CreatePostScreen.dart';
// import 'package:dietandfitness/screens/HomeScreen.dart';
// import 'package:dietandfitness/screens/NotificationScreen.dart';
// import 'package:dietandfitness/screens/ProfileScreen.dart';
// import 'package:dietandfitness/screens/SearchScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FeedScreen extends StatefulWidget {
//   final String currentUserId;
//
//   const FeedScreen({Key? key, required this.currentUserId}) : super(key: key);
//
//   @override
//   State<FeedScreen> createState() => _FeedScreenState();
// }
//
// class _FeedScreenState extends State<FeedScreen> {
//   int _selectedTab = 0;
//   // instance of auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<String?> getCurrentUserId() async {
//     try{
//       final userId = FirebaseAuth.instance.currentUser!.uid;
//
//       // fetch user doc from firestore
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .get();
//
//       if(userDoc.exists){
//
//       }
//       return userId;
//     }
//     catch(e){
//       print('error getting current user ID: $e');
//       return null;
//     }
//   }
//
//   String? _currentUserId;
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUserId().then((userId) {
//       setState(() {
//         _currentUserId = userId;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar:AppBar(
//       //   leading: IconButton(
//       //     icon: Icon(Icons.menu),
//       //     onPressed: (){},
//       //   ),
//       // ),
//       body: [
//         HomeScreen(currentUserId: widget.currentUserId),
//         SearchScreen(currentUserId: widget.currentUserId),
//         //NotificationScreen(),
//         ProfileScreen(
//           currentUserId: widget.currentUserId,
//          // visitedUserId: widget.currentUserId,
//           visitedUserId: _currentUserId ?? '',
//         ),
//       ].elementAt(_selectedTab),
//
//
//       bottomNavigationBar: CupertinoTabBar(
//         onTap: (index){
//           setState(() {
//             _selectedTab = index;
//           });
//         },
//         activeColor: Colors.cyan,
//         currentIndex: _selectedTab,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home)),
//           BottomNavigationBarItem(icon: Icon(Icons.search_rounded)),
//           //BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined)),
//           BottomNavigationBarItem(icon: Icon(Icons.person_3_rounded)),
//         ],
//       ),
//     );
//   }
// }
