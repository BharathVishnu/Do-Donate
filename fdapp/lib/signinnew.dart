import "package:flutter/material.dart";
import "./signup.dart";
import "package:flutter/gestures.dart";
import "./util.dart";
import './home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GradientText extends StatelessWidget {
  final String text;
  final LinearGradient gradient;
  final TextStyle style;

  GradientText(
      {required this.text, required this.gradient, required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 500),
          child: Text(text, style: style.copyWith(color: Colors.pinkAccent))),
    );
  }
}

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Do Donate.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 56),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientText(
                    text: 'SIGN IN',
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromRGBO(255, 148, 148, 1)
                    ]),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    )),
                verticalSpacing(30),
                Container(
                  height: 50,
                  width: 278,
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 97, 97, 97),
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        label: Text("Email",
                            style: TextStyle(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                verticalSpacing(20),
                Container(
                  height: 50,
                  width: 278,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 97, 97, 97),
                        icon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                verticalSpacing(20),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
                verticalSpacing(30),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => profile()));
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 148, 148, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70,
                            vertical: 13,
                          ),
                          child: Center(
                              child: Text("SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))))),
                ),
                verticalSpacing(30),
                Text(
                  'Don’t Have an account? ',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                verticalSpacing(6),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 148, 148, 1) ,
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
