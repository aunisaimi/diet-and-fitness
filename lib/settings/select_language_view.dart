import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/common/common_widget/language_row.dart';
import 'package:flutter/material.dart';

class SelectLanguageView extends StatefulWidget {
  final Function(Map) didSelect;
  const SelectLanguageView({super.key, required this.didSelect});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  int selectIndex = 0;
  List langArr = [
    {
      "name":"English"
    },
    {
      "name":"Malaysian"
    },
    {
      "name":"Mandarin"
    },
    {
      "name":"Hindi"
    },
    {
      "name":"Japanese"
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
          "Language Settigns",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          itemBuilder: (context,index){
            var tObj = langArr[index] as Map? ?? {};

            return LanguageRow(
              tObj: tObj,
              isActive: selectIndex == index,
              onPressed: (){
                setState(() {
                  selectIndex == index;
                });
              },
            );
          },
          separatorBuilder: (context,index){
            return const Divider(
              color:Colors.black26,
              height:1,
            );
          },
          itemCount: langArr.length
      ),
    );
  }
}
