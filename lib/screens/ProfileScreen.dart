// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dietandfitness/Models/Post.dart';
// import 'package:dietandfitness/Models/UserModel.dart';
// import 'package:dietandfitness/Widgets/PostContainer.dart';
// import 'package:dietandfitness/constants/constants.dart';
// import 'package:dietandfitness/screens/EditProfileScreen.dart';
// import 'package:dietandfitness/screens/WelcomeScreen.dart';
// import 'package:dietandfitness/services/DatabaseService.dart';
// import 'package:dietandfitness/services/authService.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatefulWidget {
//   final String currentUserId;
//   final String visitedUserId;
//
//   const ProfileScreen({
//     Key? key,
//     required this.currentUserId,
//     required this.visitedUserId}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   int _followersCount = 0;
//   int _followingCount = 0;
//   int _profileSegmentedValue= 0;
//   bool _isFollowing = false;
//   List<Post> _allPosts=[];
//   List<Post> _mediaPosts=[];
//
//
//   Map<int,Widget> _profileTabs = <int, Widget> {
//     0: const Padding(
//       padding: EdgeInsets.symmetric(vertical: 10),
//
//       child: Text(
//         'Posts',
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),),
//     ),
//     1: const Padding(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         'Media',
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),),
//     ),
//     2: Padding(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         'Likes',
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),),
//     ),
//   };
//
//   Widget buildProfileWidgets(UserModel author) {
//     switch(_profileSegmentedValue){
//       case 0:
//         return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: _allPosts.length,
//             itemBuilder: (context, index){
//               return PostContainer(
//                 currentUserId: widget.currentUserId,
//                 author: author,
//                 post: _allPosts[index],
//               );
//             });
//         break;
//       case 1:
//         return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: _mediaPosts.length,
//             itemBuilder: (context, index){
//               return PostContainer(
//                 currentUserId: widget.currentUserId,
//                 author: author,
//                 post: _mediaPosts[index],
//               );
//             });
//         break;
//       case 2:
//         return const Center(
//             child: Text(
//                 'Likes',
//                 style: TextStyle(
//                     fontSize: 25)));
//         break;
//       default:
//         return const Center(
//             child: Text(
//                 'Something Wrong',
//                 style: TextStyle(
//                     fontSize: 25)));
//         break;
//
//     }
//   }
//
//   getFollowersCount() async {
//     int followersCount =
//       await DatabaseServices.followersNum(widget.visitedUserId);
//     if(mounted){
//       setState(() {
//         _followersCount = followersCount;
//       });
//     }
//   }
//
//   getFollowingCount() async {
//     int followingCount =
//       await DatabaseServices.followingNum(widget.visitedUserId);
//     if(mounted){
//       setState(() {
//         _followingCount = followingCount;
//       });
//     }
//   }
//
//   followOrUnfollow(){
//     if(_isFollowing){
//       unfollowUser();
//     } else {
//       followUser();
//     }
//   }
//
//   unfollowUser(){
//     DatabaseServices.unfollowUser(widget.currentUserId, widget.visitedUserId);
//     setState(() {
//       _isFollowing = false;
//       _followersCount--;
//     });
//   }
//
//   followUser(){
//     DatabaseServices.followUser(widget.currentUserId, widget.visitedUserId);
//     setState(() {
//       _isFollowing = true;
//       _followersCount++;
//     });
//   }
//
//   setupIsFollowing() async {
//     bool isFollowingThisUser =
//       await DatabaseServices.isFollowingUser(widget.currentUserId, widget.visitedUserId);
//     setState(() {
//       _isFollowing = isFollowingThisUser;
//     });;
//   }
//
//   getAllPosts() async {
//     dynamic userPosts = await DatabaseServices.getUserPosts(widget.visitedUserId);
//     // if (userPostsData != null && userPostsData is List<Post>) {
//     //   if (mounted) {
//     //     setState(() {
//     //       _allPosts = userPostsData;
//     //       _mediaPosts = _allPosts.where((element) => element.image.isNotEmpty).toList();
//     //     });
//     //   }
//     // }
//
//       if (mounted) {
//         setState(() {
//           _allPosts = userPosts;
//           _mediaPosts = _allPosts
//               .where((element) => element.image.isNotEmpty).toList();
//         });
//       }
//
//   }
//
//   // function to show logout confirmation dialog
//   Future<void> _showLogoutConfirmationDialog() async {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context){
//           return AlertDialog(
//             title: Text('Logout Confirmation'),
//             content: Text('Are you sure you want to log out?'),
//             actions:<Widget>[
//               TextButton(
//                   onPressed: (){
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Cancel'),
//               ),
//               TextButton(
//                   onPressed: () async {
//                     await _logout(); // call the logout function if confirmed
//                     Navigator.of(context)
//                         .pushReplacement(
//                         MaterialPageRoute(
//                             builder: (context) => WelcomeScreen())
//                     );
//                   },
//                   child: Text('Logout'),
//               ),
//             ],
//           );
//         },
//     );
//   }
//
//   // Function to perform logout
//   Future<void> _logout()async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       // Redirect to welcome page after log out
//       Navigator.of(context)
//           .pushReplacement(
//           MaterialPageRoute(
//               builder: (context) => WelcomeScreen())
//       );
//     } catch(e){
//       print('Error during logout: $e');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     getFollowersCount();
//     getFollowingCount();
//     setupIsFollowing();
//     getAllPosts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//         body: FutureBuilder(
//         future: usersRef.doc(widget.visitedUserId).get(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData || snapshot.data == null){
//             return const Center(
//               child: Text('Error: User data not found or incomplete'),
//               // child: CircularProgressIndicator(
//               //   valueColor: AlwaysStoppedAnimation(Colors.cyan),
//               // ),
//             );
//           }
//
//           // UserModel userModel;
//           //
//           // try {
//           //   userModel = UserModel.fromDoc(snapshot.data);
//           // } catch (error) {
//           //   // handle error if any fields are missing
//           //   debugPrint(error.toString());
//           //   return const Center(
//           //     child: Text('Error: User Data is incomplete'),
//           //   );
//           // }
//           UserModel userModel = UserModel.fromDoc(snapshot.data);
//
//           if (userModel == null){
//             return const Center(
//               child: Text('Error: User data is null'),
//             );
//           }
//
//           return ListView(
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             children: [
//             Container(
//             height: 150,
//             decoration: BoxDecoration(
//                 color: Colors.cyan,
//                 image: userModel.coverImage.isEmpty
//                     ? null
//                     : DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(userModel.coverImage),
//                 )
//             ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox.shrink(),
//                     widget.currentUserId == widget.visitedUserId ?
//                     PopupMenuButton(
//                       icon: const Icon(
//                         Icons.more_horiz,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                       itemBuilder: (_){
//                         return <PopupMenuItem<String>>[
//                           const PopupMenuItem(
//                             child: Text('Logout'),
//                             value: 'logout',
//                           )
//                         ];
//                       },
//                         onSelected: (selectedItem){
//                           if(selectedItem == 'logout'){
//                           _showLogoutConfirmationDialog();
//                           }
//                         },
//                     )
//                       : const SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//
//           Container(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Transform.translate(
//                 offset: const Offset(0.0, -40.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                         CircleAvatar(
//                           radius: 45,
//                           backgroundImage: userModel.profilePicture.isEmpty
//                               ? const AssetImage('assets/placeholder.png')
//                               : NetworkImage(userModel.profilePicture)
//                           as ImageProvider,
//                           backgroundColor: Colors.cyan.shade700,
//                         ),
//                           widget.currentUserId==widget.visitedUserId ?
//                           GestureDetector(
//                             onTap: () async {
//                               print(userModel);
//                               await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => EditProfileScreen(
//                                         user:userModel),
//                                   )
//                               );
//                               setState(() {});
//                             },
//                             child: Container(
//                               width: 100,
//                               height: 35,
//                               padding: const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                                 border: Border.all(color: Colors.cyan.shade700),
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'Edit',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                               :GestureDetector(
//                                 onTap: followOrUnfollow,
//                                 child: Container(
//                                   width: 100,
//                                   height: 35,
//                                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: _isFollowing
//                                         ? Colors.green
//                                         : Colors.cyan.shade700,
//                                     border: Border.all(
//                                         color: Colors.white
//                                     ),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       _isFollowing? 'Following':'Follow',
//                                       style: TextStyle(
//                                         fontSize: 17,
//                                         color: _isFollowing
//                                             ? Colors.white
//                                             : Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                           )
//                         ],
//                     ),
//
//                     const SizedBox(height: 10), // Add some space between avatar and name
//
//                     Text(
//                       userModel.name,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 10),
//                     Text(
//                       userModel.bio,
//                       style: const TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     const SizedBox(height: 15), // Add some space before follower/following counts
//
//                     Row(
//                       children: [
//                         // Following count
//                         Expanded(
//                           child: Text(
//                             '$_followingCount Following',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 2,
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(width: 15), // Add space between counts
//
//                         // Followers count
//                         Expanded(
//                           child: Text(
//                             '$_followersCount Followers',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 2,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 20),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: CupertinoSlidingSegmentedControl(
//                         groupValue: _profileSegmentedValue,
//                         thumbColor: Colors.cyan.shade700,
//                         backgroundColor: Colors.blueGrey,
//                         children: _profileTabs,
//                         onValueChanged: (i){
//                           setState(() {
//                             _profileSegmentedValue= i!;
//                           });
//                         },
//                       ),
//                     ),
//                     buildProfileWidgets(userModel),
//                   ]
//                  )
//                ),
//              ),
//             ),
//            ],
//          );
//         }
//       )
//     );
//   }
// }
