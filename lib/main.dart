import 'package:dietandfitness/Widgets/hidden_drawer.dart';
import 'package:dietandfitness/screens/Authentication/login/login_page.dart';
import 'package:dietandfitness/screens/Authentication/login/on_boarding_view.dart';
import 'package:dietandfitness/screens/FeedScreen.dart';
import 'package:dietandfitness/screens/Home/HomeView.dart';
import 'package:dietandfitness/screens/WelcomeScreen.dart';
import 'package:dietandfitness/screens/countdown_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Widget getScreenId(){
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (BuildContext context, snapshot) {
  //         if(snapshot.hasData){
  //           return FeedScreen(currentUserId: snapshot.data!.uid);
  //         } else {
  //           return WelcomeScreen();
  //         }
  //       });
  // }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Quicksand"),
     // home: getScreenId(),
      //home: HiddenDrawer(currentUserId: '',),
      //home: OnBoardingView(),
      home: LoginPage(),
      //home: CountdownScreen(),
    );
  }
}

