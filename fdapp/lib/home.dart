import 'package:fdapp/editprofile.dart';
import 'package:fdapp/request.dart';
import 'package:fdapp/signinnew.dart';
import 'package:fdapp/util.dart';
import 'package:flutter/material.dart';
import "package:flutter/gestures.dart";
import './info.dart';
import "./donations.dart";
import "./CurrLocation/get_lat_long_address.dart";
import './donations.dart';
import './globals.dart ' as global;
import "./textformfieldwidget.dart";

class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profState();
}

class _profState extends State<profile> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  int don = 0;
  int don_req = 0;

  void add_don() {
    don++;
  }

  void add_don_req() {
    don_req++;
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(microseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    String don_s = don.toString();
    return Scaffold(
      body: PageView(controller: _pageController, children: [
        Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/prof.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(0, -.55),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/face.jpg'),
                  ),
                ),
              ],
            ),
            Center(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            child: Center(
                                child: Column(
                          children: [
                            verticalSpacing(20),
                            LabelAndTextFormField(
                                labelText: "  Name:     ", defaultText: ""),
                            verticalSpacing(30),
                            // LabelAndTextFormField(
                            //     labelText: "Email:     ", defaultText: ""),
                            // verticalSpacing(10),
                            GetLatLong(),
                            verticalSpacing(30),
                            LabelAndTextFormField(
                                labelText: "  PhoneNo:     ", defaultText: "k"),
                            verticalSpacing(30),
                            LabelAndTextFormField(
                                labelText: "  City:     ", defaultText: "k"),
                            verticalSpacing(30),
                            LabelAndTextFormField(
                                labelText: "  Organization:     ",
                                defaultText: ""),
                            verticalSpacing(30),
                            LabelAndTextFormField(
                                labelText: "  Address:     ", defaultText: "k"),
                            verticalSpacing(30),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => editprofile()));
                              },
                              child: Container(
                                  height: 50,
                                  width: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 70,
                                        vertical: 13,
                                      ),
                                      child: Center(
                                          child: Text("Edit Profile",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ))))),
                            ),
                            verticalSpacing(30),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 70,
                                        vertical: 13,
                                      ),
                                      child: Center(
                                          child: Text("LOGOUT",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ))))),
                            ),
                            verticalSpacing(30),
                          ],
                        ))))
                  ]),
            ))
          ],
        ),
        donate(),
        adduser(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 148, 148, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'donate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.back_hand_rounded), label: 'request')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 240, 8, 8),
        unselectedItemColor: Color.fromARGB(255, 11, 10, 10),
        onTap: onTapped,
      ),
    );
  }
}
