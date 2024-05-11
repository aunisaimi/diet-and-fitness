// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfile extends StatefulWidget {
//   const EditProfile({Key? key}) : super(key: key);
//
//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _bioController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   File? _imageFile;
//   final imagePicker = ImagePicker();
//   String profilePicture ='';
//   String coverImage ='';
//   Uint8List? _image;
//
//   Future<void> fetchUserData() async {
//     try{
//       //get current user's id
//       final userId = FirebaseAuth.instance.currentUser!.uid;
//
//       // fetch user's document from firestore
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .get();
//
//       if(userDoc.exists){
//         setState(() {
//           _nameController.text = userDoc['name'];
//           _bioController.text = userDoc['bio'];
//           _emailController.text = userDoc['bio'];
//           profilePicture= userDoc['profilePicture'];
//           coverImage = userDoc['coverImage'];
//         });
//
//         print('This is name: ${userDoc['name']}');
//         print('This is bio: ${userDoc['name']}');
//         print('This is profile picture: ${userDoc['profilePicture']}');
//         print('This is cover image: ${userDoc['coverImage']}');
//       }
//     } catch(e){
//       print(e);
//     }
//   }
//
//   Future<void> uploadImageAndSave() async{
//     try{
//       final user = _auth.currentUser;
//       if (user == null) {
//         // Handle the case where the user is not signed in.
//         return;
//       }
//       final profile = 'profile_pictures/${user.uid}.png';
//
//       // upload image to cloud storage
//       final UploadTask task = _storage.ref().child(profile).putData(_image!);
//
//       //get dwnld URL of the uploaded image
//       final TaskSnapshot snapshot = await task;
//       final imageUrl = await snapshot.ref.getDownloadURL();
//
//       // update user's firestore doc with the image url
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .update({'profilePicture': imageUrl});
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Profile picture uploaded and updated.'),
//         ),
//       );
//     }catch (error) {
//       // Handle errors here.
//       print('Error uploading image: $error');
//     }
//   }
//
//   Future<void> pickImage(ImageSource source) async {
//     final pickedImage = await imagePicker.pickImage(source: source);
//     if (pickedImage != null) {
//       final imageBytes = await pickedImage.readAsBytes();
//       setState(() {
//         _image = Uint8List.fromList(imageBytes);
//       });
//     }
//     else{
//       print("Image source not found");
//     }
//   }
//
//   Future<void> updateUserData() async {
//     try{
//       // get curret user id
//       final userId = FirebaseAuth.instance.currentUser!.uid;
//       print("This is image picture : ${_image}");
//
//       // update the user document in firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .update({
//         'name': _nameController.text,
//         'email' : _emailController.text,
//         'profilePicture' : profilePicture,
//         'coverImage' : coverImage,
//
//       });
//     } catch(e){
//       print(e);
//     }
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     fetchUserData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         physics: const BouncingScrollPhysics(
//             parent: AlwaysScrollableScrollPhysics()
//         ),
//         children: [
//           GestureDetector(
//             onTap: (){
//               _imagePickedType = 'cover';
//               handleImageFromGallery();
//             },
//             child: Stack(
//               children: [
//                 Container(
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: Colors.cyan,
//                     image: _coverImage != null && widget.user!.coverImage.isEmpty
//                         ? DecorationImage(
//                       fit: BoxFit.cover,
//                       image: FileImage(_coverImage!),
//                       //image: displayCoverImage(),
//                     )
//                         : null,
//                   ),
//                 ),
//                 Container(
//                   height: 150,
//                   color: Colors.black54,
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.camera_alt,
//                         size: 70,
//                         color: Colors.white,
//                       ),
//                       Text(
//                         'Change Cover Photo',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             transform: Matrix4.translationValues(0, -40.0, 0),
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     GestureDetector(
//                       onTap: (){
//                         _imagePickedType = 'profile';
//                         handleImageFromGallery();
//                       },
//                       child: Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 45,
//                             backgroundImage: displayProfileImage(),
//                           ),
//                           const CircleAvatar(
//                             radius: 45,
//                             backgroundColor: Colors.black54,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Icon(
//                                   Icons.camera_alt,
//                                   size: 30,
//                                   color: Colors.white,
//                                 ),
//                                 Text(
//                                   'Change Profile Photo',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: saveProfile,
//                       child: Container(
//                         width: 100,
//                         height: 35,
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.cyan,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Save',
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         initialValue: _name,
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           labelStyle: TextStyle(
//                               color: Colors.cyanAccent.shade400
//                           ),
//                         ),
//                         validator: (input)=>input!.trim().length<2?
//                         'Please enter a valid name'
//                             : null,
//                         onSaved: (value){
//                           _name = value!;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         initialValue: _bio,
//                         decoration: InputDecoration(
//                           labelText: 'Bio',
//                           labelStyle: TextStyle(color: Colors.cyanAccent.shade400),
//                         ),
//                         onSaved: (value){
//                           _bio = value!;
//                         },
//                       ),
//                       const SizedBox(height: 30),
//                       _isLoading
//                           ? const CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(
//                             Colors.cyanAccent),
//                       )
//                           : const SizedBox.shrink()
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
