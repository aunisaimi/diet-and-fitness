import 'package:dietandfitness/common/RoundButton.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/screens/Authentication/login/step2_view.dart';
import 'package:flutter/material.dart';

class StepView extends StatefulWidget {
  const StepView({super.key});

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primaryColor1,
        centerTitle: true,
        title: Text(
          "Step 1 of 3",
          style: TextStyle(
              color:TColor.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/couple.png",
              width: media.width * 0.6,
              height: media.width * 0.6,
              fit: BoxFit.contain,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Welcome to \nOni Diet and Fitness Application",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.cyan.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
            ),
            ),

            Text(
              "Personalized workouts will help you \ngain strength, get in better shape and \nembrace a healthy lifestyle",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),

            const Spacer(),

            Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: RoundButton(
              title: "Get Started",
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Step2View())
                );
              },
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1,2,3].map((pObj){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: 1 == pObj
                        ? TColor.primary
                        : TColor.gray.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6)
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
