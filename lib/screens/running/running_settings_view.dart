import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/settings/setting_slider_row.dart';
import 'package:dietandfitness/common/common_widget/settings/setting_switch_row.dart';
import 'package:flutter/material.dart';

class RunningSettingsView extends StatefulWidget {
  const RunningSettingsView({super.key});

  @override
  State<RunningSettingsView> createState() => _RunningSettingsViewState();
}

class _RunningSettingsViewState extends State<RunningSettingsView> {
  List settingArr = [
    {
      "name": "GPS",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Auto Push",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Pause run for calls",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Audio Feedback",
      "type": "slider",
      "value": "50",
    },
    {
      "name": "Time",
      "type": "slider",
      "value": "50",
    },
    {
      "name": "Distance",
      "type": "slider",
      "value": "50",
    },
    {
      "name": "Voice Volume",
      "type": "switch",
      "value": "true",
    },
    {
      "name": "Time",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Distance",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Pace",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Speed",
      "type": "switch",
      "value": "false",
    },
    {
      "name": "Calories",
      "type": "switch",
      "value": "false",
    },
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
          "Settings",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemBuilder: (context,index){
            var tObj = settingArr[index] as Map? ?? {};

            if (tObj["type"] == "switch"){
              return SettingSwitchRow(
                  tObj: tObj,
                  onChanged: (newVal){
                    settingArr[index]["value"] = newVal
                        ? "true"
                        : "false";
                    setState(() {});
                  });
            } else if (tObj["type"] == "slider") {
              return SettingSliderRow(
                  tObj: tObj,
                  onChanged: (newVal){
                    settingArr[index]["value"] = newVal.toString();
                    setState(() {});
                  });
            } else {
              return Container();
            }
          },
          separatorBuilder: (context,index){
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: settingArr.length),
    );
  }
}
