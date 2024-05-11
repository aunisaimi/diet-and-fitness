import 'package:dietandfitness/common/RoundButton.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/screens/Authentication/login/step_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int selectPage = 0;

  List pageArr = [
    {
      "title":"Track Your Goal",
      "subtitle": "Don't worry if you have trouble determining \nyour goals. We can help you determine \nyour goals and track your goals",
      "image":"assets/on_1.png",
    },
    {
      "title":"Get Burn",
      "subtitle": "Let’s keep burning, to achieve yours goals, \nit hurts only temporarily, if you give up\n now you will be in pain forever",
      "image":"assets/on_2.png",
    },
    {
      "title":"Eat Well",
      "subtitle": "Let's start a healthy lifestyle \nwith us, we can determine your \ndiet every day. healthy \neating is fun",
      "image":"assets/on_3.png",
    },
  ];

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;

      if(mounted){
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,//TColor.primary,
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/Vector.png",
          //   width: 410, //media.width,
          //   height: 490, //media.height,
          //   fit: BoxFit.cover,
          // ),

          SafeArea(
            child: PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context,index){
                var pObj = pageArr[index] as Map? ?? {};
                return Column(
                  children:[
                    const SizedBox(height: 5),
                    Text(
                      pObj["title"].toString(),
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //SizedBox(height: media.width * 0.1,),
                    const SizedBox(height: 10),
                    Image.asset(
                      pObj["image"].toString(),
                      // width: media.width*0.8,
                      // height: media.height*0.6,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: media.width * 0.25),

                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ],);
            }),
          ),

          SafeArea(
              child: Column(
                children: [
                  const Spacer(),

                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageArr.map((pObj){
                      var index = pageArr.indexOf(pObj);
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: selectPage == index ? TColor.primary
                              : TColor.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    }).toList(),
                  ),

                 // SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                    child: RoundButton(
                        title: "Start",
                        type: RoundButtonType.primaryText,
                        onPressed:(){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StepView()),
                                  (route) => false);
                        }),
                  ),

                  SizedBox(height: media.width * 0.07,),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
