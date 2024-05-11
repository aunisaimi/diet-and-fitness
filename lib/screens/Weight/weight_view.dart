import 'package:carousel_slider/carousel_slider.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/border_button.dart';
import 'package:flutter/material.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {

  List myWeightArr = [
    {
        "name":"Monday, APR 29",
        "image":"assets/w_1.png",
    },
    {
      "name":"Tuesday, MAY 6",
      "image":"assets/w_2.png",
    },
    {
      "name":"Wednesday, MAY 13",
      "image":"assets/w_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.12,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Check your Progress",
          style: TextStyle(
              color: TColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: BorderButton(
                        title: "Check Progress",
                        type: BorderButtonType.inactive,
                        onPressed: (){},
                      ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                      child: BorderButton(
                          title: "My Weight",
                          onPressed: (){},
                      ),
                  ),
                ],
              ),
            ),
            Padding(
                padding:  const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Text(
                "Add more photo to control your progress",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    //fontWeight: FontWeight.w700
                ),
              ),
            ),
            Padding(
                padding:  const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: media.width,
                height: media.width * 0.90,
                child: CarouselSlider.builder(
                  options:CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 0.5,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.65,
                    enlargeFactor: 0.4,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                    itemCount: myWeightArr.length,
                    itemBuilder: (BuildContext context, int itemIndex, int index){
                    var dObj = myWeightArr[index] as Map ? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade700,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          dObj["image"].toString(),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                      child: Text(
                        "Monday, APR 29",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            Container(
              padding:  const EdgeInsets.symmetric(vertical: 8),
              width: 160,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: TColor.gray.withOpacity(0.5),
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "74 kg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: Text(
                "Hi there",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),),
            )
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
