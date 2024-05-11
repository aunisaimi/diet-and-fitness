import 'package:dietandfitness/Models/Post.dart';
import 'package:dietandfitness/Models/UserModel.dart';
import 'package:dietandfitness/Widgets/PostContainer.dart';
import 'package:dietandfitness/constants/constants.dart';
import 'package:dietandfitness/screens/CreatePostScreen.dart';
import 'package:dietandfitness/screens/WorkoutScreen.dart';
import 'package:dietandfitness/services/DatabaseService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String currentUserId;

  const HomeScreen({super.key, required this.currentUserId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _followingPosts = [];
  bool _loading = false;
  int _selectedIndex = 0;
  String profilePicture ='';
  String name ="";
  String email ="";

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  buildPosts(Post post, UserModel author){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: PostContainer(
        post: post,
        author: author,
        currentUserId: widget.currentUserId,
      ),
    );
  }

  showFollowingPosts(String currentUserId){
    List<Widget> followingPostsList=[];
    for(Post post in _followingPosts){
      followingPostsList.add(
        FutureBuilder(
            future: usersRef.doc(post.authorId).get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                UserModel author = UserModel.fromDoc(snapshot.data);
                return buildPosts(post, author);
              } else {
                return const SizedBox.shrink();
              }
            })
      );
    }
    return followingPostsList;
  }

  setupFollowingPosts () async{
    setState(() {
      _loading = true;
    });
    List followingPosts = await DatabaseServices
        .getUserPosts(widget.currentUserId);
    if(mounted){
      setState(() {
        _followingPosts = followingPosts;
        _loading = false;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    setupFollowingPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Image.network('https://i.pinimg.com/originals/34/9c/8f/349c8f0432cd0cda8aa32ad72683a0d4.gif'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreatePostScreen(
                      currentUserId: widget.currentUserId)),
            );
          },
        ),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          // leading: Container(
          //   height: 40,
          //   child: Image.asset('assets/logo.png'),
          // ),
          title: Text(
            'Home Screen',
            style: TextStyle(
              color: Colors.cyan.shade700,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.cyan.shade700,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
               DrawerHeader(
                  child: Row(
                    children: [
                      Expanded(
                          child:
                         Image.asset(
                           'assets/logo.png',
                           // height: 100,
                           // width: 100,
                         )
                      ),
                      
                      const SizedBox(width: 5),
                       
                       // const Padding(
                       //  padding: EdgeInsets.symmetric(horizontal: 8),
                       //  child: Column(
                       //    crossAxisAlignment: CrossAxisAlignment.start,
                       //    mainAxisAlignment: MainAxisAlignment.center,
                       //    children: [
                       //      Text(
                       //        'What is Next',
                       //          style: TextStyle(
                       //              fontSize: 20,
                       //              color: Colors.white)
                       //      )
                       //    ],
                       //  ),
                       // )
                    ],
                  ),
              ),
              const SizedBox(height: 5),
              
               ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  'Workout Plan',
                  style: TextStyle(
                      fontSize: 20,
                    color: Colors.white
                  ),
                ),
                selected: _selectedIndex == 0,
                onTap: (){
                  // update the state of the app
                  _onItemTapped(0);
                  // then close the drawer
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutScreen()
                      )
                  );
                },
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: ()=>setupFollowingPosts(),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              _loading ? const LinearProgressIndicator():const SizedBox.shrink(),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 5),
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Column(
                        children: _followingPosts.isEmpty && _loading == false?
                        [
                          const SizedBox(height: 5),
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'There is No New Post',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),)
                        ] : showFollowingPosts(widget.currentUserId),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
