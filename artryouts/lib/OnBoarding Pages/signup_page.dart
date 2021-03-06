import 'package:flutter/material.dart';
import 'package:artryouts/Main%20Screen%20Pages/home_page.dart';
import 'package:artryouts/OnBoarding%20Pages/tellusmore_page.dart';
import 'package:artryouts/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Main Screen Pages/main_page.dart';
import '../success_screen.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.1),
                // Logo
                logo(),
                SizedBox(height: screenHeight * 0.05),
                // Login Banner
                Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255,255, 255, 255),
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  child: Column(children: <Widget>[
                    // Email TextField
                    artryoutsTextField(
                      hint: "Email",
                      control: TextEditingController(),
                      textType: TextInputType.emailAddress,
                    ),
                    // Password TextField
                    artryoutsTextField(
                      hint: "Password",
                      control: TextEditingController(),
                      pswd: true,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    // ---------- or -----------
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 2,
                              color: Colors.black54,
                            ),
                          ),
                          Text("  or  ",
                              style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w500)),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: Colors.black54,
                            ),
                          ),
                        ]),
                  ]),
                ),
                // Signup with Google Button
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SuccessScreen(
                        nextPage: MainPage(),
                      ),
                    ));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenHeight * 0.09),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5)),
                        // width: screenHeight * 0.1,
                        height: screenHeight * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenHeight * 0.05,
                              height: screenHeight * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://img.icons8.com/color/48/000000/google-logo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Sign up with Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.02,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Login Button
                coolButton(
                    text: "Register",
                    // width: screenWidth * 0.5,
                    // height: screenHeight * 0.07,
                    // textSize: screenWidth * 0.04,
                    functionToComply: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TellUsMorePage()));
                    }),
                SizedBox(height: screenHeight * 0.02),
                // Dont have an account?
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account? "),
                      InkWell(
                          child: const Text("Login",
                              style: TextStyle(
                                color: Colors.teal,
                                decoration: TextDecoration.underline,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          })
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
