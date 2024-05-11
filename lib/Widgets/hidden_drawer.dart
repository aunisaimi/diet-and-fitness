// import 'package:dietandfitness/screens/HomeScreen.dart';
// import 'package:dietandfitness/screens/WorkoutScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
//
// class HiddenDrawer extends StatefulWidget {
//   final String currentUserId;
//
//   const HiddenDrawer({
//     Key? key,
//     required this.currentUserId}) : super(key: key);
//
//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }
//
// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> _pages =[];
//
//   @override
//   void initState(){
//     super.initState();
//
//     _pages =[
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//             name: 'Home Screen',
//             baseStyle: const TextStyle(),
//             selectedStyle: const TextStyle(),
//           ),
//            HomeScreen(currentUserId: widget.currentUserId,),
//       )
//     ];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.cyan.shade700,
//       screens: _pages,
//       initPositionSelected: 0,
//     );
//   }
// }
