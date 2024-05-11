// import 'package:dietandfitness/Widgets/custom_icon_btn.dart';
// import 'package:dietandfitness/utils/size_utils.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController welcomemessageController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   String radioGroup = "";
//
//   List<String> radioList = [
//     "msg_keep_me_signed_in",
//     "msg_email_me_about_fitness_diet"
//   ];
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           extendBody: true,
//           extendBodyBehindAppBar: true,
//           backgroundColor: Colors.cyan.shade700,
//           resizeToAvoidBottomInset: false,
//           body: Container(
//             width: SizeUtils.width,
//             height: SizeUtils.height,
//             decoration: BoxDecoration(
//               color: Colors.cyan.shade700,
//               image: const DecorationImage(
//                 image: AssetImage('assets/exercise.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: SingleChildScrollView(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   width: double.maxFinite,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 25.h,
//                     vertical: 24.v,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 24.v),
//                       Image(
//                         image: const AssetImage('assets/exercise.jpg'),
//                         height: 139.v,
//                         width: 175.h,
//                       ),
//                       const Text(
//                         'Your Fitness and Diet Companion',
//                         style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 24
//                         ),
//                       ),
//                        SizedBox(height: 66.v),
//                       const Text(
//                         "Sign Up For Free!",
//                         style: TextStyle(
//                             color: Colors.green,
//                           fontSize: 26
//                         ),
//                       ),
//                       SizedBox(height: 43.v),
//                      // _buildWelcomemessage(context),
//                       SizedBox(height: 12.v),
//                       //_buildEmail(context),
//                       SizedBox(height:12.v),
//                       //_buildPassword(context),
//                       SizedBox(height: 19.v),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Row(
//                           children: [
//                             CustomIconButton()
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
