import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietandfitness/common/color_extension.dart';
import 'package:dietandfitness/screens/Authentication/login/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  //final String backgroundImagePath;
  final Function()? onTap;
  const RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  String? _selectHeight;
  String? _selectWeight;

  bool isPasswordVisible = false;
  String? emailError;
  String? passwordError;

  // Heights and weights options
  List<String> heightRange = ["145 cm", "150 cm", "155 cm", "160 cm", "165 cm", "170 cm", "175 cm", "180 cm", "185 cm", "190 cm", "195 cm", "200 cm"];
  List<String> weightRange = ["45 kg", "50 kg", "55 kg", "60 kg", "65 kg", "70 kg", "75 kg", "80 kg", "85 kg", "90 kg", "95 kg", "100 kg", "105 kg", "110 kg", "115 kg", "120 kg", "125 kg", "130 kg", "135 kg", "140 kg", "145 kg", "150 kg", "155 kg", "160 kg", "165 kg", "170 kg", "175 kg", "180 kg", "185 kg", "190 kg", "195 kg", "200 kg", "205 kg", "210 kg", "215 kg", "220 kg", "225 kg", "230 kg", "235 kg", "240 kg", "245 kg", "250 kg"];

  // register method
  void userSignUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try to register
    try {
      // validate email
      emailError = validateEmail(_emailController.text);
      if (emailError != null) {
        showErrorMessage(emailError!);
        return; // don't proceed with register if email is invalid
      }

      // validate password
      passwordError = validatePassword(_passwordController.text);
      if (passwordError != null) {
        showErrorMessage(passwordError!);
        return;
      }

      // check if password entered is same
      if (_passwordController.text == _confirmpasswordController.text) {
        // create a new user in Firebase authentication
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // create a new document in Firestore for users
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'email': _emailController.text,
          'height': _selectHeight,
          'weight': _selectWeight,
        });

        // navigate to next page if success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingView()),
        );
      } else {
        showErrorMessage("Passwords do not match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.message ?? "An unknown error occurred");
    } catch (e) {
      Navigator.pop(context);
      showErrorMessage("Please try again. Error: $e");
    }
  }

  // Error message
  void showErrorMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Register Failed'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // Pop loading circle after showing the error message
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  bool isValidEmail(String email) {
    // Define a regular expression pattern for a valid email address
    final pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

    // Create a regular expression object
    final regex = RegExp(pattern);

    // Use the regex to match the email address
    return regex.hasMatch(email);
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  List<String> generateWeightRange(int start, int end, int step){
    List<String> range =[];
    for(int i = start; i<=end; i+=step){
      range.add("$i kg");
    }
    return range;
  }

  List<String> generateHeightRange(int start, int end, int step){
    List<String> range =[];
    for(int i = start; i<=end; i+=step){
      range.add("$i cm");
    }
    return range;
  }

  @override
  Widget build(BuildContext context) {
    List<String> weightRange = generateWeightRange(45, 250, 1);
    List<String> heightRange = generateHeightRange(145, 200, 1);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  "assets/logo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: TColor.primary,
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !isPasswordVisible,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: TColor.primary,
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.cyan,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      errorText: passwordError,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _confirmpasswordController,
                    obscureText: !isPasswordVisible,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: TColor.primary,
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.cyan,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      errorText: passwordError,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectHeight,
                        onChanged: (newValue) {
                          setState(() {
                            _selectHeight = newValue;
                          });
                        },
                        items: heightRange.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black), // Adjust font color here
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: 'Height',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: TColor.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),

                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectWeight,
                        onChanged: (newValue) {
                          setState(() {
                            _selectWeight = newValue;
                          });
                        },
                        items: weightRange.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black), // Adjust font color here
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: 'Weight',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: TColor.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: userSignUp,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
