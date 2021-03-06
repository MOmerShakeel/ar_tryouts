import 'package:flutter/material.dart';
import 'package:artryouts/OnBoarding%20Pages/forgotpsw.dart';
import 'package:artryouts/OnBoarding%20Pages/signup_page.dart';
import 'package:artryouts/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Main Screen Pages/main_page.dart';
import '../success_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              // Logo
              logo(),
              SizedBox(height: screenHeight * 0.03),
              // Login Banner
              Text(
                'Login',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255,255,255),
                  fontSize: screenHeight * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                width: screenHeight * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Email TextField
                    artryoutsTextField(
                        hint: "Email",
                        control: TextEditingController(),
                        textType: TextInputType.emailAddress),
                    // Password TextField
                    artryoutsTextField(
                      hint: "Password",
                      control: TextEditingController(),
                      pswd: true,
                    ),
                    // Forgot Password
                    forgetPassword(),
                  ]),
                ),
              ),
              // Login Button
              coolButton(
                  text: "Login",
                  functionToComply: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SuccessScreen(nextPage: MainPage()),
                        ));
                  }),
              const SizedBox(height: 10),
              // Dont have an account?
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account? "),
                    InkWell(
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        })
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgetPassword() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      InkWell(
          child: const Text(
            "Forget Password?",
            style: TextStyle(
                color: Colors.teal, decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => forgotpsw()));
          })
    ]);
  }
}
