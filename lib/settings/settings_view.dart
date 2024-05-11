import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/settings/setting_switch_row.dart';
import 'package:flutter/material.dart';

import '../common/common_widget/settings/setting_select_row.dart';
import 'connect_view.dart';
import 'select_language_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  List settingArr = [
    {
      "name": "Reminders",
      "type": "switch",
      "Value": "false"
    },
    {
      "name": "Language",
      "type": "select",
      "Value": "English"
    },
    {
      "name": "Connected",
      "type": "select",
      "Value": "facebook"
    },
    {
      "name": "Apple Health",
      "type": "switch",
      "Value": "true"
    },
    {
      "name": "Warm-Up",
      "type": "switch",
      "Value": "false"
    },
    {
      "name": "Cool-Down",
      "type": "switch",
      "Value": "false"
    },
    {
      "name": "Auto Push",
      "type": "switch",
      "Value": "false"
    },
    {
      "name": "Pause for Running",
      "type": "switch",
      "Value": "false"
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

            if ( tObj["type"] == "switch" ){
              return SettingSwitchRow(
                tObj: tObj,
                onChanged: (newVal){
                  settingArr[index]["value"] = newVal
                      ? "true"
                      : "false";
                  setState(() {

                  });
                });
            } else if (tObj["type"] == "select"){
              return SettingSelectRow (
                tObj: tObj,
                onPressed: (){
                  if (tObj["name"] == "Language"){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectLanguageView(didSelect: (newVal){})));
                  }
                  else  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> ConnectView(didSelect: (newVal) {})));
                  }
                });
            }
            else {
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
