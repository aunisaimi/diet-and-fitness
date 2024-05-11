import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/screens/Home/HomeView.dart';
import 'package:dietandfitness/screens/Weight/weight_view.dart';
import 'package:dietandfitness/screens/running/running_view.dart';
import 'package:dietandfitness/screens/meal/meal_plan_view.dart';

import '../countdown_screen.dart';

class WorkoutViewDetail extends StatefulWidget {
  final String exerciseName;
  final String exerciseImage;
  final String exerciseDescription;
  final String duration;

  const WorkoutViewDetail({
    Key? key,
    required this.exerciseName,
    required this.exerciseImage,
    required this.duration,
    required this.exerciseDescription,
  }) : super(key: key);

  @override
  State<WorkoutViewDetail> createState() => _WorkoutViewDetailState();
}

class _WorkoutViewDetailState extends State<WorkoutViewDetail> {
  late String difficultyLevel = 'Beginner'; // default

  final Map<String, dynamic> exerciseDetails = {
    'Beginner': {
      'duration': '25 seconds',
      'steps': [
        "Step 1: Place your hands on the floor shoulder-width apart.",
        "Step 2: Lower your body until your chest nearly touches the floor.",
        "Step 3: Push yourself back up to the starting position.",
      ],
      'intensity': 'Low',
    },
    'Intermediate': {
      'duration': '50 seconds',
      'steps': [
        "Step 1: Place your hands on the floor shoulder-width apart.",
        "Step 2: Lower your body until your chest nearly touches the floor.",
        "Step 3: Push yourself back up to the starting position.",
        "Step 4: Repeat",
      ],
      'intensity': 'Medium',
    },
    'Advanced': {
      'duration': '2 minutes',
      'steps': [
        "Step 1: Place your hands on the floor shoulder-width apart.",
        "Step 2: Lower your body until your chest nearly touches the floor.",
        "Step 3: Push yourself back up to the starting position.",
        "Step 4: Repeat",
      ],
      'intensity': 'High',
    },
  };

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.exerciseName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select Difficulty Level'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Beginner'),
                          onTap: () {
                            setState(() {
                              difficultyLevel = 'Beginner';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Intermediate'),
                          onTap: () {
                            setState(() {
                              difficultyLevel = 'Intermediate';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Advanced'),
                          onTap: () {
                            setState(() {
                              difficultyLevel = 'Advanced';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_horiz_sharp, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.exerciseImage,
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Description:\n${widget.exerciseDescription}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/like.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/share.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Exercise Details",
                style: TextStyle(
                  color: TColor.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Duration: ${exerciseDetails[difficultyLevel]['duration']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Steps:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Column(
                    children: exerciseDetails[difficultyLevel]['steps']
                        .map<Widget>((step) {
                      return Text(
                        step,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Intensity: ${exerciseDetails[difficultyLevel]['intensity']}',
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                      builder: (context) => const RunningView(),
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
                      builder: (context) => const MealPlanView(),
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
                      builder: (context) => const HomeView(),
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
                      builder: (context) => const WeightView(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CountdownScreen(
                duration: '10',
              ),
            ),
          );
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

