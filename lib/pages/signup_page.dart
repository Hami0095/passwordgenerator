import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var _pwdController = TextEditingController();
    var _emailController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 12, 12, 11),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image for the loginPage
              SizedBox(
                height: h * 0.35,
                width: w,
                child: Image.asset('assets/images/signup.jpg'),
              ),
              // Text + TextField1: email
              Container(
                // padding: const EdgeInsets.all(40.0),
                margin: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Your Own Password Manager',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 3,
                            offset: const Offset(2, 1),
                            color: Colors.grey.withOpacity(0.15),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Color.fromARGB(255, 9, 98, 170),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            gapPadding: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 3,
                            offset: const Offset(2, 1),
                            color: Colors.grey.withOpacity(0.15),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: _pwdController,
                        decoration: InputDecoration(
                          hintText: 'Create your Password',
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Color.fromARGB(255, 9, 98, 170),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            gapPadding: 5.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text: Forgotten Password?
              const SizedBox(
                height: 10,
              ),
              // Btn: signUp->
              GestureDetector(
                onTap: () {
                  // AuthController.instace.register(
                  //     emailController.text.trim(), pwdContoller.text.trim());
                },
                child: Container(
                  height: h * 0.025,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 20),
                        blurRadius: 2.5,
                        spreadRadius: -10,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.1,
              ),
              // Already Have an Account?
              RichText(
                text: TextSpan(
                  text: "Already have an Account?",
                  style: Theme.of(context).textTheme.bodySmall,
                  // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                ),
              ),
              SizedBox(
                height: w * 0.1,
              ),
              // TextSpan : Don't have an account? Create
              RichText(
                text: const TextSpan(
                  text: "SignUp using one of the following methods?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              // Showing the icons of google
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // AuthController.instace.googleLogin();
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1Nl9otEDi23qnVEQXPJuKQHaHa%26pid%3DApi%26h%3D160&f=1',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
