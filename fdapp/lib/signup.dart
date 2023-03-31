import 'package:fdapp/editprofile.dart';
import 'package:fdapp/signinnew.dart';
import 'package:flutter/material.dart';
import 'package:fdapp/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "./editprofile.dart";

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');

  void adduser() {
    final data = {'user': _userNameTextController.text};
    user.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Do Donate.png'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientText(
                      text: 'SIGN UP',
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromRGBO(255, 148, 148, 1)
                      ]),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      )),
                  verticalSpacing(40),
                  Container(
                    height: 50,
                    width: 278,
                    child: TextFormField(
                      controller: _userNameTextController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(100, 97, 97, 97),
                          label: Text("Name",
                              style: TextStyle(color: Colors.white)),
                          icon: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  verticalSpacing(30),
                  Container(
                    height: 50,
                    width: 278,
                    child: TextFormField(
                      controller: _emailTextController,
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
                  verticalSpacing(30),
                  Container(
                    height: 50,
                    width: 278,
                    child: TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(100, 97, 97, 97),
                          label: Text("Password",
                              style: TextStyle(color: Colors.white)),
                          icon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  verticalSpacing(30),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editprofile()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                      adduser();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 148, 148, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 20,
                            ),
                            child: Center(
                                child: Text("Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                  ),
                ],
              ),
            )));
  }
}
