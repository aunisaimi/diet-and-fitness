import 'dart:io';

import 'package:dietandfitness/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class StorageService{

  static Future<String> uploadProfilePicture(String url, File imageFile) async {
    String? uniquePhotoId = Uuid().v4();
    File image = await compressImage(uniquePhotoId, imageFile);

    if (url.isNotEmpty) {
      RegExp exp = RegExp(r'userProfile_(.*).jpg');
      uniquePhotoId = exp.firstMatch(url)![1];
    }
    UploadTask uploadTask = storageRef
        .child('images/users/userProfile_$uniquePhotoId.jpg')
        .putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // static Future<String> uploadProfilePicture(String url, File imageFile) async {
  //   String uniquePhotoId = Uuid().v4();
  //   File image = await compressImage(uniquePhotoId, imageFile);
  //
  //   UploadTask uploadTask = storageRef
  //       .child('images/users/userprofile_$uniquePhotoId.jpg')
  //       .putFile(image);
  //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  // static Future<String> uploadCoverPicture(String url, File imageFile) async {
  //   String uniquePhotoId = Uuid().v4();
  //   File image = await compressImage(uniquePhotoId, imageFile);
  //
  //   UploadTask uploadTask = storageRef
  //       .child('images/users/cover_$uniquePhotoId.jpg')
  //       .putFile(image);
  //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  static Future<String> uploadCoverPicture(String url, File imageFile) async {
    String? uniquePhotoId = Uuid().v4();
    File image = await compressImage(uniquePhotoId, imageFile);

    if (url.isNotEmpty) {
      RegExp exp = RegExp(r'userCover_(.*).jpg');
      uniquePhotoId = exp.firstMatch(url)![1];
    }
    UploadTask uploadTask = storageRef
        .child('images/users/userCover_$uniquePhotoId.jpg')
        .putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<String> uploadPostPicture(File imageFile) async {
    String uniquePhotoId = Uuid().v4();
    File image = await compressImage(uniquePhotoId, imageFile);

    UploadTask uploadTask = storageRef
        .child('images/posts/post_$uniquePhotoId.jpg')
        .putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  static Future<File> compressImage(String photoId, File image) async {
    try {
      final tempDirectory = await getTemporaryDirectory();
      final path = tempDirectory.path;

      File compressedImage = (await FlutterImageCompress.compressAndGetFile(
        image.absolute.path,
        '$path/img_$photoId.jpg',
        quality: 70,
      )) as File;

      return compressedImage;
    } catch (e) {
      print('Error compressing image: $e');
      throw e; // Re-throw the error to handle it elsewhere if needed
    }
  }
}