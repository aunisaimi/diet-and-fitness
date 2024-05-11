import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RunningTimerView extends StatefulWidget {
  final double height;
  const RunningTimerView({super.key, required this.height});

  @override
  State<RunningTimerView> createState() => _RunningTimerViewState();
}

class _RunningTimerViewState extends State<RunningTimerView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SizedBox(
     height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Time",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),

              Stack(
                alignment: Alignment.center,
                children: [
                  SimpleCircularProgressBar(
                    size: MediaQuery.sizeOf(context).width * 0.8,
                    mergeMode: true,
                    animationDuration: 1,
                    backColor: const Color(0xffE6E6E6),
                    progressColors: [TColor.primary],
                    progressStrokeWidth: 15,
                    backStrokeWidth: 15,
                    startAngle: 45,
                  ),

                  Positioned(
                    child: Text(
                      "15:10",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 65,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                ],
              ),





              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Min 50",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Max 150",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              Container(
                  height: 100,
                  child: Slider(
                      activeColor: TColor.primary,
                      inactiveColor: const Color(0xffE6E6E6),
                      value: 0.5,
                      onChanged: (newVal) {
                        setState(() {});
                      } )
              ),
            ],
          ),
        ],
      ),
    );
  }
}