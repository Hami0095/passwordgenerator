import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../pages/signup_page.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/signIn';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _pwdFocus = FocusNode();

  Future<void> signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushNamed(HomePage.routeName);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 12, 12, 11),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.35,
                width: w,
                child: Image.asset(
                  'assets/images/singin.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Text(
                      "Login Page",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        //fontfamily:
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
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
                      child: TextFormField(
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
                            gapPadding: 5.0,
                          ),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_pwdFocus);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
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
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        focusNode: _pwdFocus,
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
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
                        onEditingComplete: signIn,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: signIn,
                child: Container(
                  height: h * 0.08,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 25),
                        blurRadius: 2.5,
                        spreadRadius: -35,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.04,
              ),
              const Divider(),
              SizedBox(
                height: w * 0.01,
              ),
              Center(
                child: Text(
                  "OR",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: w * 0.001,
              ),
              IconButton(
                onPressed: () {
                  // Do Sign in through google!
                  // TODO: GOOGLE LOGIN!
                },
                icon: Image.network(
                  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.ybCkn_y7YH0Ri_oAnCW3NAHaE8%26pid%3DApi%26h%3D160&f=1',
                  height: 120,
                ),
                iconSize: 90,
              ),
              SizedBox(
                height: w * 0.01,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: " Let's Create",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 90, 163),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context)
                            .pushNamed(SignUpPage.routeName),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
