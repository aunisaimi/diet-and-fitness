// import 'package:dietandfitness/Widgets/RoundedButton.dart';
// import 'package:dietandfitness/screens/Authentication/LoginScreen.dart';
// import 'package:dietandfitness/services/authService.dart';
// import 'package:flutter/material.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   late String _email;
//   late String _password;
//   late String _name;
//
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'REGISTRATION',
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//
//               const SizedBox(height: 40),
//
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter your email',
//                   border:  OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   labelText: 'Email',
//                 ),
//                 onChanged: (value) {
//                   _email = value;
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 40),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter your password',
//                   border:  OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   labelText: 'Password',
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
//                 ),
//                 onChanged: (value) {
//                   _password = value;
//                 },
//                 obscureText: !isPasswordVisible,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 40),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter your name',
//                   border:  OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.cyan),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   labelText: 'Name',
//                 ),
//                 onChanged: (value) {
//                   _name = value;
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//
//               const SizedBox(height: 40),
//               RoundedButton(
//                 btnText: 'Register Now',
//                 onBtnPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     bool isValid = await AuthService.signUp(
//                       _name,
//                       _email,
//                       _password,
//                     );
//                     if (isValid) {
//                       //Navigator.pop(context);
//
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text('Success Register'),
//                               content: const Text('Click OK to Login'),
//                               actions: <Widget>[
//                                 TextButton(
//                                     onPressed: () => Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => const LoginScreen()),
//                                     ),
//                                     child: const Text('OK'),
//                                 ),
//                               ],
//                             );
//                           },
//                       );
//                     } else {
//                       print('something wrong');
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
