//
// import 'package:dietandfitness/Widgets/RoundedButton.dart';
// import 'package:dietandfitness/screens/FeedScreen.dart';
// import 'package:dietandfitness/services/authService.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // late TextEditingController _emailController = TextEditingController();
//   // late TextEditingController _passwordController = TextEditingController();
//   late String _email;
//   late String _password;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   String _errorMessage = '';
//   bool isPasswordVisible = false;
//
//   void _handleLogin() async {
//     if(_formKey.currentState!.validate()) { try {
//       setState(() => _isLoading = true);
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _email,
//         password: _password,
//       );
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => const LoginScreen(),
//         // RegisteredVehiclesView
//         // builder: (context) => PatrolScheduleScreen(),
//       ));
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         _errorMessage = e.message ?? 'Login failed';
//         _isLoading = false;
//       });
//     }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//         'LOG IN',
//         style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold),
//         ),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //SizedBox(height: 20,),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Enter your email',
//                     border:  OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.cyan),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.cyan),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     labelText: 'Email',
//                   ),
//                   onChanged: (value){
//                     _email= value;
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 40,),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Enter your password',
//                     border:  OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.cyan),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.cyan),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     labelText: 'Password',
//                     prefixIcon: const Icon(Icons.lock, color: Colors.black,),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: (){
//                         setState(() {
//                           isPasswordVisible = !isPasswordVisible;
//                         });
//                       },)
//                   ),
//                   onChanged: (value){
//                     _password = value;
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                   obscureText: !isPasswordVisible,
//                 ),
//
//                 const SizedBox(height: 40,),
//
//                 RoundedButton(
//                     btnText: 'LOG IN',
//                     onBtnPressed: () async {
//                       if(_formKey.currentState!.validate()) {
//                         bool isValid = await AuthService.login(_email, _password);
//                         if (isValid) {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('Success Login'),
//                                 content: const Text('Click OK to proceed'),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     onPressed: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const FeedScreen(currentUserId: '',)),
//                                     ),
//                                     child: const Text('OK'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         }
//                         else {
//                           print ('Something is wrong');
//                         }
//                       }
//                       }
//                 ),
//
//                 if(_isLoading)
//                   const CircularProgressIndicator(),
//
//                 if(_errorMessage.isNotEmpty)
//                   Padding(
//                       padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     _errorMessage,
//                     style: const TextStyle(
//                       color: Colors.red
//                     ),
//                     textAlign: TextAlign.center,
//                   ),)
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }
