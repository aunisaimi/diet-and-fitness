import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class YogaView extends StatefulWidget {
  const YogaView({super.key});

  @override
  State<YogaView> createState() => _YogaViewState();
}

class _YogaViewState extends State<YogaView> {
  List workArr = [
    {
      "name":"Running",
      "image":"assets/1.png",
    },
    {
      "name":"Squat",
      "image":"assets/squat.jpg",
    },
    {
      "name":"Plank",
      "image":"assets/plank.png",
    },
    {
      "name":"Sit Up",
      "image":"assets/situp.png",
    },
  ];

  List responseArr = [
    {
      "name": "Auni Afeeqah",
      "time": "1 day ago",
      "image": "assets/workingcats.jpg",
      "message": "None",
    },
    {
      "name": "Auni Afeeqah",
      "time": "12 day ago",
      "image": "assets/logo.png",
      "message": "None",
    },
    {
      "name": "Auni Afeeqah",
      "time": "14 day ago",
      "image": "assets/placeholder.png",
      "message": "None",
    },
    {
      "name": "Auni Afeeqah",
      "time": "54 day ago",
      "image": "assets/workingcats.jpg",
      "message": "None",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Yoga",
          style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/5.png",
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
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
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: TColor.primary,
                        ),
                        onRatingUpdate: (rating){
                          print(rating);
                        },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){},
                      icon: Image.asset(
                        "assets/like.png",
                        width: 20,
                        height: 20,
                      ),
                  ),
                  IconButton(
                    onPressed: (){},
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
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Text(
                "Tips",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Text(
                "Tips Here",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
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
                onTap: (){},
                child: Image.asset(
                  "assets/menu_running.png",
                  width: 25,
                  height: 25,),
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                  "assets/menu_meal_plan.png",
                  width: 25,
                  height: 25,),
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                  "assets/menu_home.png",
                  width: 25,
                  height: 25,),
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                  "assets/menu_weight.png",
                  width: 25,
                  height: 25,),
              ),
              InkWell(
                onTap: (){},
                child: Image.asset(
                  "assets/more.png",
                  width: 25,
                  height: 25,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
