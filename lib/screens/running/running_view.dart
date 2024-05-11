import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/running/running_density_view.dart';
import 'package:dietandfitness/common/common_widget/running/running_heart_view.dart';
import 'package:dietandfitness/common/common_widget/running/running_length_view.dart';
import 'package:dietandfitness/common/common_widget/running/running_speed_view.dart';
import 'package:dietandfitness/common/common_widget/running/running_timer_view.dart';
import 'package:dietandfitness/common/common_widget/running/running_top_button.dart';
import 'package:dietandfitness/screens/running/running_settings_view.dart';
import 'package:flutter/material.dart';

class RunningView extends StatefulWidget {
  const RunningView({super.key});

  @override
  State<RunningView> createState() => _RunningViewState();
}

class _RunningViewState extends State<RunningView> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white),
        ),
        title: Text(
          "Running",
          style: TextStyle(
              color: TColor.white,
              fontSize: 23,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            color: TColor.primary,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: media.width * 0.9,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xffF8F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  RunningTopButton(
                    icon: "assets/distance.png",
                    isActive: selectTab == 0,
                    onPressed: (){
                      setState(() {
                        selectTab = 0;
                      });
                    },
                  ),
                  Container(
                      width: 1,
                      height: 40,
                      color: TColor.gray),
                  RunningTopButton(
                    icon: "assets/dashboard-half.png",
                    isActive: selectTab == 1,
                    onPressed: (){
                      setState(() {
                        selectTab = 1;
                      });
                    },
                  ),
                  Container(
                      width: 1,
                      height: 40,
                      color: TColor.gray
                  ),

                  RunningTopButton(
                      icon: "assets/time-wall-clock.png",
                      isActive: selectTab ==2,
                      onPressed: (){
                        setState(() {
                          selectTab = 2;
                        });
                      }),

                  Container(
                      width: 1,
                      height: 40,
                      color: TColor.gray
                  ),

                  RunningTopButton(
                      icon: "assets/r_heartbeat.png",
                      isActive: selectTab == 3,
                      onPressed: (){
                        setState(() {
                          selectTab = 3;
                        });
                      }),

                  Container(
                      width: 1,
                      height: 40,
                      color: TColor.gray
                  ),

                  RunningTopButton(
                    icon: "assets/Group 1309.png",
                    isActive: selectTab == 4,
                    onPressed: (){
                      setState(() {
                        selectTab = 4;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: media.width * 0.9,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 1)),
                ]
            ),
            child: Column(
              children: [
                if (selectTab == 0)
                  RunningLengthView(height: media.width * 1.35),
                if (selectTab == 1)
                  RunningSpeedView(height: media.width * 1.35),
                if (selectTab == 2)
                  RunningTimerView(height: media.width * 1.35),
                if (selectTab == 3)
                  RunningHeartView(height: media.width * 1.35),
                if (selectTab == 4)
                  RunningDensityView(height: media.width * 1.35),
              ],
            ),
          ),


          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RunningSettingsView()));
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.settings),
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: media.width * 0.5,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.pause),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: const Column(
                    children: [
                      Icon(Icons.lock),
                      Text(
                        "Unlock",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
