import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String authorId;
  String text;
  String image;
  Timestamp timestamp;
  int likes;
  int reposts;

  Post({
    required this.id,
    required this.authorId,
    required this.text,
    required this.image,
    required this.timestamp,
    required this.likes,
    required this.reposts,
  });

  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      id: doc.id,
      authorId: doc['authorId'],
      text: doc['text'],
      image: doc['image'],
      timestamp: doc['timestamp'],
      likes: doc['likes'],
      reposts: doc['reposts'],
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      authorId: json['authorId'] ?? '',
      text: json['text'] ?? '',
      image: json['image'] ?? '',
      timestamp: json['timestamp'] != null
          ? (json['timestamp'] as Timestamp)
          : Timestamp.now(),
      likes: json['likes'] ?? 0,
      reposts: json['reposts'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Feed ID: $id, '
        'Author ID: $authorId, '
        'Text: $text, '
        'Image: $image, '
        'Timestamp: $timestamp, '
        'Likes: $likes, '
        'Reposts: $reposts';
  }
}
