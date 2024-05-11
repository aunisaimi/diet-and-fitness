import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/clock_tick.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class RunningHeartView extends StatefulWidget {
  final double height;
  const RunningHeartView({Key? key, required this.height}) : super(key: key);

  @override
  State<RunningHeartView> createState() => _RunningHeartViewState();
}

class _RunningHeartViewState extends State<RunningHeartView> {
  final List<Map<String, dynamic>> dataArr = List.generate(36, (index) {
    return {"no": index + 1, "val": 60 + index % 4 * 10};
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Heart",
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
                          "15:10",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 59,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "bpm",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: media.width * 0.7,
                      height: media.width * 0.7,
                      child: CustomPaint(
                        painter: ClockTick(),
                      ),
                    ),
                    SimpleCircularProgressBar(
                      size: media.width * 0.55,
                      mergeMode: true,
                      animationDuration: 2,
                      backColor: Colors.white,
                      progressColors: [TColor.primary],
                      progressStrokeWidth: 15,
                      backStrokeWidth: 15,
                      startAngle: 0,
                      valueNotifier: ValueNotifier(75),
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
                        "Max 50",
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
            SizedBox(height: 20),
            Container(
              height: 80,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: dataArr.map((valObj) {
                      var val = valObj["val"] as int; // Cast val to int
                      var index = valObj["no"] as int; // Cast index to int
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 2,
                        height: (val * 70) / 150,
                        decoration: BoxDecoration(
                          color: index > 12 && index < 18
                              ? TColor.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    height: 1,
                    color: Colors.white,
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
