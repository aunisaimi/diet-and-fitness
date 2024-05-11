import 'package:dietandfitness/common/RoundButton.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/select_datetime.dart';
import 'package:dietandfitness/common/common_widget/select_picker.dart';
import 'package:dietandfitness/screens/menu/MenuView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Step3View extends StatefulWidget {
  const Step3View({Key? key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  bool isAppleHealth = true;
  DateTime? selectDate;
  String? selectHeight;
  String? selectWeight;
  bool isMale = true;
  String? selectedBodyPart;

  List<String> bodyParts = [
    'Legs',
    'Chest',
    'Back',
    'Arms',
    'Shoulders',
    'Abs',
    'Full Body'
  ];

  List<String> generateWeightRange(int start, int end, int step) {
    List<String> range = [];
    for (int i = start; i <= end; i += step) {
      range.add("$i kg");
    }
    return range;
  }

  List<String> generateHeightRange(int start, int end, int step) {
    List<String> range = [];
    for (int i = start; i <= end; i += step) {
      range.add("$i cm");
    }
    return range;
  }

  @override
  Widget build(BuildContext context) {
    List<String> weightRange = generateWeightRange(45, 250, 1);
    List<String> heightRange = generateHeightRange(145, 200, 1);
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Step 3 of 3",
          style: TextStyle(
            color: TColor.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Which part of your body are you planning to focus on?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: bodyParts.length,
                    itemBuilder: (context, index) {
                      final bodyPart = bodyParts[index];
                      return ListTile(
                        title: Text(bodyPart),
                        onTap: () {
                          setState(() {
                            selectedBodyPart = bodyPart;
                          });
                        },
                        tileColor: selectedBodyPart == bodyPart
                            ? TColor.primary.withOpacity(0.5)
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: RoundButton(
                title: "Start",
                onPressed: () {
                  if (selectedBodyPart != null) {
                    // Navigate to menu view with selected body part
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuView(
                          selectedBodyPart: selectedBodyPart!,
                        ),
                      ),
                          (route) => false,
                    );
                  } else {
                    // Show a message to select a body part
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Please Select a Body Part"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2, 3].map((pObj) {
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
