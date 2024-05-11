import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/tip_row.dart';
import 'package:dietandfitness/screens/tips/tips_details_view.dart';
import 'package:flutter/material.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});

  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  List tipsArr = [
    {"name": "About Traning"},
    {"name": "How to weight loss ?"},
    {"name": "Introducing about meal plan "},
    {"name": "Water and Food"},
    {"name": "Drink water"},
    {"name": "How many times a day to eat"},
    {"name": "Become stronger"},
    {"name": "Shoes To Training"},
    {"name": "Appeal Tips"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.3,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Tips",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index){
            var tObj = tipsArr[index] as Map? ?? {};
            return TipRow(
              tObj: tObj,
              isActive: index == 0,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TipsDetailView(tObj: tObj)));
              }
            );
          },
          separatorBuilder: (context,index){
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: tipsArr.length),
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
