// import 'package:dietandfitness/common/RoundButton.dart';
// import 'package:dietandfitness/common/color_extension.dart';
// import 'package:dietandfitness/common/common_widget/tab_button.dart';
// import 'package:dietandfitness/screens/Workout/workout_view_detail.dart';
// import 'package:flutter/material.dart';
//
// class ExerciseView extends StatefulWidget {
//   const ExerciseView({super.key});
//
//   @override
//   State<ExerciseView> createState() => _ExerciseViewState();
// }
//
// class _ExerciseViewState extends State<ExerciseView> {
//   int isActiveTab = 0;
//
//   List workArr = [
//     {
//       "name": "Climber",
//       "image": "assets/1.png",
//       "title": "workout",
//       "subtitle": "Personalized workouts will help\nyou gain strength",
//     },
//     {
//       "name": "Climber",
//       "image": "assets/2.png",
//       "title": "workout",
//       "subtitle": "Personalized workouts will help\nyou gain strength",
//     },
//     {
//       "name": "Climber",
//       "image": "assets/3.png",
//       "title": "workout",
//       "subtitle": "Personalized workouts will help\nyou gain strength",
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: TColor.primary,
//         centerTitle: true,
//         elevation: 1,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Text(
//           "Exercise",
//           style: TextStyle(
//             color: TColor.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: TColor.white,
//               boxShadow: const [
//                 BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 2,
//                     offset: Offset(0, 2),
//                 )
//               ]
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: TabButton(
//                       title: "Full Body",
//                       isActive: isActiveTab == 0,
//                       onPressed: (){
//                         setState(() {
//                           isActiveTab = 0;
//                         });
//                       },
//                     ),
//                 ),
//                 Expanded(
//                   child: TabButton(
//                     title: "Foot",
//                     isActive: isActiveTab == 1,
//                     onPressed: (){
//                       setState(() {
//                         isActiveTab = 1;
//                       });
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: TabButton(
//                     title: "Arm",
//                     isActive: isActiveTab == 2,
//                     onPressed: (){
//                       setState(() {
//                         isActiveTab = 2;
//                       });
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: TabButton(
//                     title: "Body",
//                     isActive: isActiveTab == 3,
//                     onPressed: (){
//                       setState(() {
//                         isActiveTab = 3;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//               child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
//                   itemCount: workArr.length,
//                   itemBuilder: (context, index){
//                   var wObj = workArr[index] as Map? ?? {};
//                   return Container (
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     height: media.width * 0.5,
//                     decoration: BoxDecoration(
//                       color: TColor.gray,
//                       borderRadius: BorderRadius.circular(10)),
//                     clipBehavior: Clip.antiAlias,
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           wObj["image"].toString(),
//                           width: media.width,
//                           height: media.width * 0.5,
//                           fit: BoxFit.cover,
//                         ),
//                         Container(
//                           width: media.width,
//                           height: media.width * 0.5,
//                           decoration: BoxDecoration(
//                             color: index % 2 == 0
//                                 ? Colors.black.withOpacity(0.7)
//                                 : TColor.gray.withOpacity(0.35),
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 25, horizontal: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 wObj["title"],
//                                 style: TextStyle(
//                                   color: TColor.primary,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 wObj["name"],
//                                 style: TextStyle(
//                                     color: TColor.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               Text(
//                                 wObj["subtitle"],
//                                 style: TextStyle(
//                                     color: TColor.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               const Spacer(),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                     width: 100,
//                                     height: 25,
//                                     child: RoundButton(
//                                       title: "See More",
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                       onPressed: (){
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     WorkoutViewDetail(
//                                                       exerciseName: wObj['name'],
//                                                       exerciseImage: wObj["image"],
//                                                 ),
//                                             ),
//                                         );
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                   }),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 1,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               InkWell(
//                 onTap: (){},
//                 child: Image.asset(
//                   "assets/menu_running.png",
//                   width: 25,
//                   height: 25,),
//               ),
//               InkWell(
//                 onTap: (){},
//                 child: Image.asset(
//                   "assets/menu_meal_plan.png",
//                   width: 25,
//                   height: 25,),
//               ),
//               InkWell(
//                 onTap: (){},
//                 child: Image.asset(
//                   "assets/menu_home.png",
//                   width: 25,
//                   height: 25,),
//               ),
//               InkWell(
//                 onTap: (){},
//                 child: Image.asset(
//                   "assets/menu_weight.png",
//                   width: 25,
//                   height: 25,),
//               ),
//               InkWell(
//                 onTap: (){},
//                 child: Image.asset(
//                   "assets/more.png",
//                   width: 25,
//                   height: 25,),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
