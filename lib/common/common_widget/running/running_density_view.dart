import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../clock_tick.dart';

class RunningDensityView extends StatefulWidget {
  final double height;
  const RunningDensityView({Key? key, required this.height}) : super(key: key);

  @override
  State<RunningDensityView> createState() => _RunningDensityViewState();
}

class _RunningDensityViewState extends State<RunningDensityView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.height,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: media.width * 0.9, // Adjust the width here
              height: media.height * 0.6, // Adjust the height here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Density",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "250.2",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 59,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "kCal",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: media.width * 0.55,
                        height: media.width * 0.55,
                        child: CustomPaint(
                          painter: ClockTick(isAnti: true),
                        ),
                      ),
                      SimpleCircularProgressBar(
                        size: media.width * 0.65,
                        mergeMode: true,
                        animationDuration: 1,
                        backColor: const Color(0xffE6E6E6),
                        progressColors: [TColor.primary],
                        progressStrokeWidth: 15,
                        backStrokeWidth: 15,
                        startAngle: 270,
                        valueNotifier: ValueNotifier(25),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Min 50",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Max 156",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var valObj = 1; valObj <= 20; valObj++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 40,
                      decoration: BoxDecoration(
                        color: valObj > 10 ? const Color(0xffE6E6E6) : TColor.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
