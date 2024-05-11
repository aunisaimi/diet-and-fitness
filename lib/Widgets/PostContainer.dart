import 'package:dietandfitness/Models/Post.dart';
import 'package:dietandfitness/Models/UserModel.dart';
import 'package:dietandfitness/services/DatabaseService.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatefulWidget {
  final Post post;
  final UserModel author;
  final String currentUserId;

  const PostContainer({
    Key? key,
    required this.post,
    required this.author,
    required this.currentUserId}): super(key: key);

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {

  int _likesCount = 0;
  bool _isLiked= false;

  initPostLikes() async {
    bool isLiked = await DatabaseServices.isLikePost(widget.currentUserId, widget.post);
    setState(() {
      _isLiked = isLiked;
    });
  }

  likePost(){
    if(_isLiked){
      DatabaseServices.unlikePost(widget.currentUserId,widget.post);
      setState(() {
        _isLiked = false;
        _likesCount--;
      });
    } else {
      DatabaseServices.likePost(widget.currentUserId,widget.post);
      setState(() {
        _isLiked = true;
        _likesCount++;
      });
    }
  }

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: widget.author.profilePicture.isEmpty
                    ? const AssetImage('assets/placeholder.png')
                    : NetworkImage(widget.author.profilePicture)
                as ImageProvider<Object>,
              ),
              const SizedBox(width: 10),
              Text(
                widget.author.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            widget.post.text,
            style: const TextStyle(
                fontSize: 15
            ),
          ),

          widget.post.image.isEmpty
              ? const SizedBox.shrink()
              : Column(
                children: [
                  const SizedBox(height: 15),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade700,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.post.image)
                      ),
                    ),
                  )
                ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                      color: _isLiked? Colors.cyan: Colors.black,
                    ),
                      onPressed: likePost,
                  ),
                  Text(
                    widget.post.likes.toString() + 'Likes',
                  //_likesCount.toString() + 'Likes',
                  )
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                          Icons.repeat
                      ),
                        onPressed: (){},
                    ),
                    Text(
                      widget.post.reposts.toString() + 'Reposts',
                    )
                  ],
                ),
              ],
             ),
              Text(
                widget.post.timestamp.toDate().toString().substring(0,19),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider()
        ],
      ),
      )
    );
  }
}
