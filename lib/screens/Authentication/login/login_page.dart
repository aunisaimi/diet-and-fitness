import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/constants/components/my_textfield.dart';
import 'package:dietandfitness/screens/Authentication/login/on_boarding_view.dart';
import 'package:dietandfitness/screens/Authentication/login/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordVisible = false;

  // login method:
  void userLogin() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try to login
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text);

      // pop loading circle before user logged in
      // Navigator.pop(context);
      //
      // // Navigate to Welcome Screen
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => OnBoardingView()));
    } catch (e){
      Navigator.of(context).pop();

      if (e is FirebaseAuthException){
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(
                content: Text(
                    "Firebase Auth Error: ${e.message}")
            ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(
                content: Text(
                    "General Error: ${e.toString()}"),
            ));
      }
    }
    // Navigate to OnBoardingView after successfully login
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const OnBoardingView()));
  }

  // show error message to user
  void showErrorMessage(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: TColor.primary,
            title: const Text(
              "Login Failed :(",
              style: TextStyle(
                color: Colors.white),
            ),
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white),
            ),
            actions: [
              TextButton(
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pop(context);
                  //pop loading circle after show error message
                  Navigator.pop(context);
                },)
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/Vector.png",
            width: 410, //media.width,
            height: 490, //media.height,
            fit: BoxFit.cover,
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 230,
                  height: 230,
                ),

                const SizedBox(height: 20),
                // Adjust the spacing as needed
                 const Text(
                  "Welcome Back! \nReady for some actions?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 25),

                // email
                MyTextField(
                  //hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                  labelText: 'Email',
                ),

                const SizedBox(height: 10),

                // password
                MyTextField(
                  //hintText: "Password",
                  obscureText: true,
                  controller: _passwordController,
                  labelText: 'Password',
                ),

                const SizedBox(height: 10),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),

                ),

                const SizedBox(height: 25),

                // login button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TColor.primary,
                        elevation: 10,
                        shape: const StadiumBorder()
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: (){
                      userLogin();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()));
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // dont have account
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account?",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(width: 4),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
