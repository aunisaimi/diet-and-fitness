import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/menu_cell.dart';
import 'package:dietandfitness/common/common_widget/plan_row.dart';
import 'package:dietandfitness/screens/Home/HomeView.dart';
import 'package:dietandfitness/screens/Weight/weight_view.dart';
import 'package:dietandfitness/screens/exercise/exercise_view.dart';
import 'package:dietandfitness/screens/exercise/exercise_view2.dart';
import 'package:dietandfitness/screens/menu/edit_profile.dart';
import 'package:dietandfitness/screens/menu/yoga_view.dart';
import 'package:dietandfitness/screens/running/running_view.dart';
import 'package:dietandfitness/screens/schedule/schedule_view.dart';
import 'package:dietandfitness/screens/tips/tips_view.dart';
import 'package:dietandfitness/services/authService.dart';
import 'package:dietandfitness/settings/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../meal/meal_plan_view.dart';

class MenuView extends StatefulWidget {
  final String? selectedBodyPart;
  MenuView({Key? key, this.selectedBodyPart}) : super(key: key);

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  TextEditingController _emailController = TextEditingController();
  String profilePicture ='';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService authService = AuthService();

  List planArr = [
    {
      "name": 'Running',
      "icon": "assets/running.jpg",
      "right_icon": "",
    },
    {
      "name": 'Yoga',
      "icon": "assets/yoga.jpg",
      "right_icon": "",
    },
    {
      "name": 'Workout',
      "icon": "assets/exercise.jpg",
      "right_icon": "",
    },
    {
      "name": 'Walking',
      "icon": "assets/walking.jpg",
      "right_icon": "",
    },
    {
      "name": 'Fitness',
      "icon": "assets/fitness.png",
      "right_icon": "",
    },
  ];

  List menuArr = [
    {
      "name": "Home",
      "image": "assets/menu_home.png",
      "tag": "1"
    },
    {
      "name": "Weight",
      "image": "assets/menu_weight.png",
      "tag": "2"
    },
    {
      "name": "Meal Plan",
      "image": "assets/menu_meal_plan.png",
      "tag": "5"
    },
    {
      "name": "Schedule",
      "image": "assets/menu_schedule.png",
      "tag": "6"
    },
    {
      "name": "Running",
      "image": "assets/menu_running.png",
      "tag": "7"
    },
    {
      "name": "Exercises",
      "image": "assets/menu_exercises.png",
      "tag": "8"
    },
    {
      "name": "Tips",
      "image": "assets/menu_tips.png",
      "tag": "9"
    },
  ];

  Future<void> fetchUserData() async {
    try {
      // Get the current user's ID
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // Fetch the user's document from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        // Extract and set user data to the respective TextEditingController
        setState(() {
          _emailController.text = userDoc['email'];
          profilePicture = userDoc['profilePicture'];
        });
        print("This is the current user id: ${_emailController}");
        print("This is the current profile picture: ${profilePicture}");
      } else {
        print("Data not exist");
      }
    } catch (e) {
      print("Error, please check: ${e}");
    }
  }

  // sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${_emailController.text}');
    fetchUserData(); // Fetch user data when the widget initializes
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        width: media.width,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Stack(
            children: [
              Container(
                width: media.width * 0.78,
                decoration: BoxDecoration(
                  color: TColor.white,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.5),
                                child: Image.asset(
                                  "assets/workout.jpg",
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  "Training Plan",
                                  style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            itemCount: planArr.length,
                            itemBuilder: (context, index) {
                              var itemObj = planArr[index] as Map? ?? {};

                              return PlanRow(
                                  mObj: itemObj,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (index == 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const YogaView()));
                                    }
                                  });
                            },
                          ),
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sign Out",
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight - 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/menu_close.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.6,
              collapsedHeight: kToolbarHeight + 20,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/workout_2.jpg",
                    width: media.width,
                    height: media.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.8,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfile()));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(27),
                            ),
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: profilePicture != null
                                  && profilePicture.isNotEmpty
                                  ? NetworkImage(profilePicture!)
                                  : const AssetImage('assets/logo.png')
                              as ImageProvider<Object>,
                              backgroundColor: Colors.teal,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${_emailController.text}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: TColor.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: TColor.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ];
        },
        body: GridView.builder(
            padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1),
            itemCount: menuArr.length,
            itemBuilder: (context, index) {
              var mObj = menuArr[index] as Map? ?? {};
              return MenuCell(
                mObj: mObj,
                onPressed: () {
                  switch (mObj["tag"].toString()) {
                    case "1":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
                      break;
                    case "2":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeightView()));
                      break;
                    case "5":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MealPlanView()));
                      break;
                    case "6":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScheduleView()));
                      break;
                    case "7":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RunningView()));
                      break;
                    case "8":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseView2()));
                      break;
                    case "9":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TipsView()));
                      break;
                  }
                },
              );
            }),
      ),
    );
  }
}
