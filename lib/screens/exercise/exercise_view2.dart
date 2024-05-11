import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/tab_button.dart';
import 'package:dietandfitness/screens/Home/HomeView.dart';
import 'package:dietandfitness/screens/Weight/weight_view.dart';
import 'package:dietandfitness/screens/Workout/workout_view_detail.dart';
import 'package:dietandfitness/screens/meal/meal_plan_view.dart';
import 'package:dietandfitness/screens/running/running_view.dart';
import 'package:flutter/material.dart';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({Key? key}) : super(key: key);

  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  late String selectedDifficulty = 'beginner';

  final Map<String, String> difficultyDurations = {
    'beginner': '25',
    'intermediate': '50',
    'advanced': '120',
  };

  int isActiveTab = 0;

  List workArr = [
    {
      "category": "Full Body",
      "routine": [
        {
          "name": "Push-up",
          "image": "assets/push_up.jpg",
          "description": "Push-ups are a great exercise for building chest and tricep strength."
        },
        {
          "name": "Sit-up",
          "image": "assets/situp.jpg",
          "description":"Sit-ups are a great exercise for building abdominal strength."
        },
        {
          "name": "Leg-extension",
          "image": "assets/leg_extension.jpg",
          "description": "Leg-extensions are a great exercise for building leg strength.",
        },
        {
          "name": "Running",
          "image": "assets/running_ill.jpg",
          "description": "Running is a great exercise for building cardiovascular endurance.",
        },
      ],
    },
    {
      "category": "Legs",
      "routine": [
        {
          "name": "Squat",
          "image": "assets/squat.jpg",
          "description": "Squats are a great exercise for building leg strength.",
        },
        {
          "name": "Imaginary Chair",
          "image": "assets/imaginary_chair.jpg",
          "description": "Imaginary chair exercises are great for building leg strength.",
        },
        {
          "name": "Donkey Kicks",
          "image": "assets/donkey_kicks.jpg",
          "description": "Donkey kicks are a great exercise for building glute strength.",
        },
        {
          "name": "Explosive Jump",
          "image": "assets/explosive_jump_m.jpg",
          "description": "Explosive jumps are a great exercise for building leg strength and power.",
        },
      ],
    },
    {
      "category": "Arm",
      "routine": [
        {
          "name": "Push-Up",
          "image": "assets/push_up.jpg",
          "description": "Push-ups are a great exercise for building chest and tricep strength.",
        },
        {
          "name": "Wall Push-Up",
          "image": "assets/wall-pushups.jpg",
          "description": "Wall push-ups are a great exercise for building chest and tricep strength.",
        },
      ],
    },
    {
      "category": "Abs",
      "routine": [
        {
          "name": "Crunch",
          "image": "assets/crunch.jpg",
          "description": "Crunches are a great exercise for building abdominal strength.",
        },
        {
          "name": "Plank",
          "image": "assets/plank.png",
          "description": "Planks are a great exercise for building core strength.",
        },
        {
          "name": "Bicycle Crunch",
          "image": "assets/bicycle_crunch.jpg",
          "description": "Bicycle crunches are a great exercise for building abdominal strength.",
        },
        {
          "name": "Bear Crawl",
          "image": "assets/bear_crawl.jpg",
          "description": "Bear crawls are a great exercise for building core strength.",
        },
        {
          "name": "Copenhagen Plank",
          "image": "assets/copenhagen_plank.jpg",
          "description": "Copenhagen planks are a great exercise for building core strength.",

        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Exercise Routines",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                for (int i = 0; i < workArr.length; i++)
                  Expanded(
                    child: TabButton2(
                      title: workArr[i]["category"],
                      isActive: isActiveTab == i,
                      onPressed: () {
                        setState(() {
                          isActiveTab = i;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: workArr[isActiveTab]["routine"].length,
              itemBuilder: (context, index) {
                var wObj = workArr[isActiveTab]["routine"][index];
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            wObj["image"].toString(),
                            width: media.width,
                            height: media.width * 0.55,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: media.width,
                            height: media.width * 0.55,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const Icon(Icons.play_arrow),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              wObj["name"],
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WorkoutViewDetail(
                                          exerciseName: wObj["name"],
                                          exerciseImage: wObj["image"],
                                          exerciseDescription: wObj["description"],
                                          duration: difficultyDurations[
                                          selectedDifficulty] ?? '10',
                                        ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RunningView(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/menu_running.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPlanView(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/menu_meal_plan.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/menu_home.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeightView(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/menu_weight.png",
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/more.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}