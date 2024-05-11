// import 'dart:io';
//
// import 'package:dietandfitness/Models/UserModel.dart';
// import 'package:dietandfitness/services/DatabaseService.dart';
// import 'package:dietandfitness/services/StorageService.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   final UserModel user;
//
//   const EditProfileScreen({Key? key, required this.user}) : super(key:key);
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String _name = '';
//   String _bio = '';
//   File? _profileImage;
//   File? _coverImage;
//   late String _imagePickedType;
//   final _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//
//   // displayCoverImage() {
//   //   if (_coverImage != null) {
//   //     return FileImage(_coverImage!);
//   //   }
//   //   else if (widget.user!.coverImage.isNotEmpty) {
//   //     return NetworkImage(widget.user.coverImage);
//   //   }
//   //   else {
//   //     return const AssetImage('assets/placeholder.png');
//   //   }
//   // }
//
//   displayCoverImage() {
//     if (_coverImage == null) {
//       if (widget.user.coverImage.isNotEmpty) {
//         return NetworkImage(widget.user.coverImage);
//       }
//     } else {
//       return FileImage(_coverImage!);
//     }
//   }
//
//   displayProfileImage(){
//     if (_profileImage != null) {
//       return FileImage(_profileImage!);
//     } else if (widget.user.profilePicture.isNotEmpty) {
//       return NetworkImage(widget.user.profilePicture);
//     } else {
//       return const AssetImage('assets/placeholder.png');
//     }
//   }
//
//   saveProfile() async {
//     _formKey.currentState!.save();
//     if(_formKey.currentState!.validate() && !_isLoading){
//       setState(() {
//         _isLoading = true;
//       });
//
//       // Use _profileImage and _coverImage files directly
//       // String profilePictureUrl = widget.user.profilePicture ?? '';
//       // String coverPictureUrl = widget.user.coverImage ?? '';
//
//       String profilePictureUrl = '';
//       String coverPictureUrl ='';
//
//       if(_profileImage != null){
//         // profilePictureUrl = widget.user.profilePicture; // Change here
//         profilePictureUrl = await StorageService.uploadProfilePicture(widget.user.profilePicture, _profileImage!);
//       }
//       else{
//         // profilePictureUrl = await StorageService.uploadProfilePicture(
//         //     widget.user.profilePicture, _profileImage!); // Change here
//         profilePictureUrl = widget.user.profilePicture; // Change here
//       }
//
//       if(_coverImage != null){
//         //coverPictureUrl = widget.user.coverImage; // Change here
//         coverPictureUrl = await StorageService.uploadCoverPicture(
//             widget.user.coverImage, _coverImage!);
//       }
//       else{
//         // coverPictureUrl = await StorageService.uploadCoverPicture(
//         //     widget.user.coverImage, _coverImage!); // Change here
//         coverPictureUrl = widget.user.coverImage;
//       }
//
//       UserModel user = UserModel(
//           id: widget.user!.id,
//           name: _name,
//           profilePicture: profilePictureUrl,
//           bio: _bio,
//           coverImage: coverPictureUrl,
//           email: '' //kiv
//       );
//
//       DatabaseServices.updateUserData(user);
//       Navigator.pop(context);
//     }
//   }
//
//   handleImageFromGallery() async {
//     try{
//       final imagePicker = ImagePicker();
//       final XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
//
//       if(imageFile != null) {
//         if(_imagePickedType == 'profile'){
//           setState(() {
//             _profileImage = File(imageFile.path);
//           });
//         }
//         else if (_imagePickedType == 'cover'){
//           setState(() {
//             _coverImage = File(imageFile.path);
//           });
//         }
//       }
//     }
//     catch (e){
//       print('Image not found: ${e}');
//     }
//   }
//
//   // Future<void> pickImageFromFirestoreStorage() async {
//   //   try {
//   //     final imagePicker = ImagePicker();
//   //     final XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
//   //
//   //     if (imageFile != null) {
//   //       final appDir = await getApplicationDocumentsDirectory();
//   //       final imageName = imageFile.path.split('/').last;
//   //       final localImagePath = '${appDir.path}/$imageName';
//   //
//   //       // Copy the image file to local storage
//   //       await File(imageFile.path).copy(localImagePath);
//   //
//   //       setState(() {
//   //         if (_imagePickedType == 'profile') {
//   //           _profileImage = File(localImagePath);
//   //         } else if (_imagePickedType == 'cover') {
//   //           _coverImage = File(localImagePath);
//   //         }
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print('Error picking image: $e');
//   //   }
//   // }
//
//   // Future<String?> getImageUrl(String imagePath) async {
//   //   try {
//   //     final ref = FirebaseStorage.instance.ref().child(imagePath);
//   //     return await ref.getDownloadURL();
//   //   } catch (e) {
//   //     print('Error getting image URL: $e');
//   //     return null;
//   //   }
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("Image: ${widget.user!.coverImage}");
//     print("name: ${widget.user!.name}");
//     print("profile: ${widget.user!.profilePicture}");
//     _name = widget.user!.name;
//     _bio = widget.user!.bio;
//
//     // Set the cover image from the user data if it's available
//     if (widget.user!.coverImage.isNotEmpty) {
//       setState(() {
//         _coverImage = File(widget.user!.coverImage);
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         physics: const BouncingScrollPhysics(
//           parent: AlwaysScrollableScrollPhysics()
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
//                     : null,
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
//                       _imagePickedType = 'profile';
//                       handleImageFromGallery();
//                     },
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
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 30),
//                         TextFormField(
//                           initialValue: _name,
//                           decoration: InputDecoration(
//                             labelText: 'Name',
//                             labelStyle: TextStyle(
//                                 color: Colors.cyanAccent.shade400
//                             ),
//                           ),
//                           validator: (input)=>input!.trim().length<2?
//                           'Please enter a valid name'
//                               : null,
//                           onSaved: (value){
//                             _name = value!;
//                           },
//                         ),
//                         const SizedBox(height: 30),
//                         TextFormField(
//                           initialValue: _bio,
//                           decoration: InputDecoration(
//                             labelText: 'Bio',
//                             labelStyle: TextStyle(color: Colors.cyanAccent.shade400),
//                           ),
//                           onSaved: (value){
//                             _bio = value!;
//                           },
//                         ),
//                         const SizedBox(height: 30),
//                         _isLoading
//                             ? const CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(
//                               Colors.cyanAccent),
//                         )
//                             : const SizedBox.shrink()
//                       ],
//                     ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
