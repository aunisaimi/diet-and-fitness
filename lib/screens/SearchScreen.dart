// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dietandfitness/Models/UserModel.dart';
// import 'package:dietandfitness/screens/ProfileScreen.dart';
// import 'package:dietandfitness/services/DatabaseService.dart';
// import 'package:flutter/material.dart';
//
//
// class SearchScreen extends StatefulWidget {
//   final String currentUserId;
//
//   const SearchScreen({Key? key, required this.currentUserId}) : super(key: key);
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   //String _users = '';
//   late Future<QuerySnapshot>? _users = null;
//   TextEditingController _searchController = TextEditingController();
//
//   clearSearch() {
//     WidgetsBinding.instance
//         .addPostFrameCallback((_) => _searchController.clear());
//     setState(() {
//       _users == null;
//     });
//   }
//
//   buildUserTile(UserModel user) {
//     return ListTile(
//       leading: CircleAvatar(
//         radius: 20,
//         backgroundImage: user.profilePicture.isEmpty
//             ? const AssetImage('assets/placeholder.png')
//             : NetworkImage(user.profilePicture)
//         as ImageProvider<Object>?,
//       ),
//       title: Text(user.name),
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => ProfileScreen(
//               currentUserId: widget.currentUserId,
//               visitedUserId: user.id,
//             )));
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     print("user id: ${widget.currentUserId}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0.5,
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(vertical: 15),
//             hintText: 'Search by Name...',
//             hintStyle: const TextStyle(color: Colors.white),
//             border: InputBorder.none,
//             prefixIcon: const Icon(Icons.search, color: Colors.white),
//             suffixIcon: IconButton(
//               icon: const Icon(
//                 Icons.clear,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 clearSearch();
//               },
//             ),
//             filled: true,
//           ),
//           onChanged: (input) {
//             if (input.isNotEmpty) {
//               setState(() {
//                 _users = DatabaseServices.searchUsers(input);
//               });
//             }
//           },
//         ),
//       ),
//       body: _users == null
//           ? const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.search, size: 200),
//             Text(
//               'Search ...',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//       )
//           : FutureBuilder(
//           future: _users,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (snapshot!.data.docs.length == 0) {
//               return const Center(
//                 child: Text('No users found!'),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data!.size,
//                 itemBuilder: (BuildContext context, int index) {
//                   UserModel user =
//                   UserModel.fromDoc(snapshot.data!.docs[index]);
//                   return buildUserTile(user);
//                 });
//           }),
//     );
//   }
// }