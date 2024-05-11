import 'package:dietandfitness/Widgets/Round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


class CountdownScreen extends StatefulWidget {
  final String duration;

  const CountdownScreen({
    Key? key,
    required this.duration
  }) : super(key: key);

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen>
    with TickerProviderStateMixin{
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed?
        '${controller.duration!.inHours}: '
        '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        :'${count.inHours}: '
        '${(count.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if(countText == '0:00:00'){
      final ringtonePlayer = FlutterRingtonePlayer();
      ringtonePlayer.playNotification();
    }// true if countdown go to 0:00:00
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    try {
      final durationInSeconds = int.parse(widget.duration);
      controller = AnimationController(
        vsync: this,
        duration: Duration(minutes: durationInSeconds),
      );
    } catch (e) {
      print('Error parsing duration: $e');
    }

    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }

    controller.addListener(() {
      if (controller.isAnimating){
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false; //change pause to play after 0
        });
      }
      notify();
    });
  }

  @override
  void dispose(){
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade400,
                      value: progress,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if (controller.isDismissed){ // to restrict user from picking duration while running
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  controller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                        countText,
                        style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                   onTap: () {
                     if(controller.isAnimating){
                       controller.stop();
                       setState(() {
                         isPlaying = false;
                       });
                     }
                     else {
                       controller.reverse(
                           from: controller.value == 0? 1.0
                               : controller.value);
                       setState(() {
                         isPlaying = true;
                       });
                     }
                     },
                   child: RoundButton(
                     icon: isPlaying == true ? Icons.pause :
                     Icons.play_arrow,
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     controller.reset();
                     setState(() {
                       isPlaying = false;
                     });
                    },
                   child: RoundButton(
                     icon: Icons.stop,
                   ),
                 )
               ],
             ),
           ),
        ],
      ),
    );
  }
}
