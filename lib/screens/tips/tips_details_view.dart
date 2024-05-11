import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';

class TipsDetailView extends StatefulWidget {
  final Map tObj;
  const TipsDetailView({super.key, required this.tObj});

  @override
  State<TipsDetailView> createState() => _TipsDetailViewState();
}

class _TipsDetailViewState extends State<TipsDetailView> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/1.png",
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tObj["name"],
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Padding(
                padding: const EdgeInsets.symmetric(
                vertical: 15,horizontal: 20),
              child: Text(
                "Test",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
                padding: const EdgeInsets.symmetric(
                vertical: 15,horizontal: 20),
              child: Text(
                "Calories",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15,horizontal: 20),
              child: Text(
                "Test",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
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
