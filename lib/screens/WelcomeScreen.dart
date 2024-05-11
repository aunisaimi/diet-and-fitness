// import 'package:dietandfitness/Widgets/RoundedButton.dart';
// import 'package:dietandfitness/screens/Authentication/LoginScreen.dart';
// import 'package:dietandfitness/screens/Authentication/RegistrationScreen.dart';
// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   Image.asset(
//                     'assets/cat.jpg',
//                     height: 250,
//                     width: 250,
//                   ),
//                   const Text(
//                     "Lets workout",
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//               Column(
//                 children: [
//                   RoundedButton(
//                       btnText:'LOG IN',
//                       onBtnPressed:(){
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       }),
//                   const SizedBox(height: 30),
//                   RoundedButton(
//                       btnText:'Create Account',
//                       onBtnPressed:(){
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegistrationScreen()));
//                       }),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
