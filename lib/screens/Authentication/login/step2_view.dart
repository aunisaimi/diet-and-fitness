import 'package:dietandfitness/common/RoundButton.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/fitness_selector.dart';
import 'package:dietandfitness/screens/Authentication/login/step3_view.dart';
import 'package:flutter/material.dart';

class Step2View extends StatefulWidget {
  const Step2View({super.key});

  @override
  State<Step2View> createState() => _Step2ViewState();
}

class _Step2ViewState extends State<Step2View> {
  var selectIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
        ),
        title: Text(
          "Step 2 of 3",
          style: TextStyle(
              color: TColor.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Select your fitness level",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),

            FitnessLevelSelector(
              title: "Beginner",
              subtitle: "You are new to this app",
              isSelect: selectIndex == 0,
              onPressed: (){
                setState(() {
                  selectIndex = 0;
                });
              }
            ),
            FitnessLevelSelector(
                title: "Intermediate",
                subtitle: "You are training regularly",
                isSelect: selectIndex == 1,
                onPressed: (){
                  setState(() {
                    selectIndex = 1;
                  });
                }
            ),
            FitnessLevelSelector(
                title: "Trainer",
                subtitle: "You are trained and advanced",
                isSelect: selectIndex == 2,
                onPressed: (){
                  setState(() {
                    selectIndex = 2;
                  });
                }
            ),

            const Spacer(),
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                child: RoundButton(
                title: "Next",
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const Step3View()));
                  },
                ),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1,2,3].map((pObj){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: 2 == pObj
                        ? TColor.primary
                        : TColor.gray.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
