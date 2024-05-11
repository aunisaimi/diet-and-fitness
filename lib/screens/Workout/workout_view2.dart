import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/screens/Home/HomeView.dart';
import 'package:dietandfitness/screens/Weight/weight_view.dart';
import 'package:dietandfitness/screens/Workout/workout_view_detail.dart';
import 'package:dietandfitness/screens/meal/meal_plan_view.dart';
import 'package:dietandfitness/screens/running/running_view.dart';
import 'package:flutter/material.dart';

class WorkoutView2 extends StatefulWidget {
  const WorkoutView2({super.key});

  @override
  State<WorkoutView2> createState() => _WorkoutView2State();
}

class _WorkoutView2State extends State<WorkoutView2> {
  List workArr = [
    {
      "name": "Push-Up", "image": "assets/1.png"
    },
    {
      "name": "Leg-Extension", "image": "assets/leg_extension.jpg"
    },
    {
      "name": "Plank", "image": "assets/plank.png"
    },
    {
      "name": "Climber", "image": "assets/3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.2,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              },
            icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Workout",
          style: TextStyle(
              color: TColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: workArr.length,
          itemBuilder: (context,index){
          var wObj = workArr[index] as Map? ?? {};
          return Container(
            decoration: BoxDecoration(color: TColor.white),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      wObj["image"].toString(),
                      width: media.width,
                      height: media.width * 0.55
                      , fit: BoxFit.cover,
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.55,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const Icon(Icons.play_arrow,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        wObj["name"],
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WorkoutViewDetail(
                                          exerciseName: wObj['name'],
                                          exerciseImage: wObj["image"],
                                          exerciseDescription: wObj["description"],
                                          duration: '',
                                        ),
                                ),
                            );
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
          }),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RunningView()));
                },
                child: Image.asset(
                    "assets/menu_running.png",
                    width: 25,
                    height: 25),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MealPlanView()));
                },
                child: Image.asset(
                    "assets/menu_meal_plan.png",
                    width: 25,
                    height: 25),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeView()));
                },
                child: Image.asset(
                    "assets/menu_home.png",
                    width: 25,
                    height: 25),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeightView()));
                },
                child: Image.asset(
                    "assets/menu_weight.png",
                    width: 25,
                    height: 25),
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                    "assets/more.png",
                    width: 25,
                    height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
