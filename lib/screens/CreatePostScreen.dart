import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietandfitness/Models/Post.dart';
import 'package:dietandfitness/Widgets/RoundedButton.dart';
import 'package:dietandfitness/services/DatabaseService.dart';
import 'package:dietandfitness/services/StorageService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatePostScreen extends StatefulWidget {
  final String currentUserId;

  const CreatePostScreen({Key? key, required this.currentUserId}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String _postText = '';
  File? _pickedImage;
  bool _loading = false;

  // handleImageFromGallery() async {
  //   try{
  //     final PermissionStatus permissionStatus = await _requestPermission();
  //     if(permissionStatus == PermissionStatus.granted){
  //       final ImagePicker _picker = ImagePicker();
  //       XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //       if(pickedImage != null){
  //         setState(() {
  //           _pickedImage = File(pickedImage.path);
  //         });
  //       }
  //     } else {
  //     }
  //   } catch (e){
  //     print(e);
  //   }
  // }

  handleImageFromGallery() async {
    try {
      final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker
      XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery); // Call pickImage on the instance
      if (imageFile != null) {
        setState(() {
          _pickedImage = File(imageFile.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }


  Future<PermissionStatus> _requestPermission() async {
    final PermissionStatus permissionStatus = await Permission.storage.status;
    if(permissionStatus != PermissionStatus.granted){
      final PermissionStatus result = await Permission.storage.request();
      return result;
    } else {
      return permissionStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        centerTitle: true,
        title: const Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              maxLength: 200,
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: "Enter text",
              ),
              onChanged: (value){
                _postText=value;
              },
            ),

            const SizedBox(height: 20),
            _pickedImage == null ?
            const SizedBox.shrink() :
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.cyan.shade700,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(_pickedImage!),
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: handleImageFromGallery,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.cyan.shade700,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.cyan.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundedButton(
              btnText: 'Post',
              onBtnPressed: () async {
                setState(() {
                  _loading = true;
                });
                if(_postText != null && _postText.isNotEmpty){
                  String image;
                  if(_pickedImage == null){
                    image = '';
                  } else {
                    image = await StorageService.uploadPostPicture(_pickedImage!);
                  }
                  Post post = Post(
                    id: '',
                    text: _postText,
                    image: image,
                    authorId: widget.currentUserId,
                    likes: 0,
                    reposts: 0,
                    timestamp: Timestamp.fromDate(DateTime.now()),
                  );
                  DatabaseServices.createPost(post);
                  Navigator.pop(context);
                }
                setState(() {
                  _loading = false;
                });
              },
            ),
            const SizedBox(height: 20,),

            _loading ? const CircularProgressIndicator() : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
