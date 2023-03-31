import 'package:fdapp/request.dart';
import 'package:flutter/material.dart';
import "package:flutter/gestures.dart";
import './info.dart';
import "./donations.dart";
import "./CurrLocation/get_lat_long_address.dart";

class prof extends StatefulWidget {
  prof({super.key});

  @override
  State<prof> createState() => _profState();
}

class _profState extends State<prof> {
  final PageController _pageController = PageController();
  int don = 0;
  int _selectedIndex = 0;
  int don_req = 0;
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
      body: PageView(
        controller: _pageController,
        children: [
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage('assets/prof.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => info()));
                    },
                    child: Align(
                      alignment: Alignment(0, -.45),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/face.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              "ISAAC M",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 10, 10, 10)),
                            ),
                            Text("DEDO NGO Head")
                          ],
                        )),
                        width: 120,
                        height: 54,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(fontSize: 20),
                              ),
                              GetLatLong(),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_activity_rounded,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Donations Done",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '$don_s',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Donation Request",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '$don_req',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          donate(),
          adduser()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 214, 153, 169),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'donate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.back_hand_rounded), label: 'request')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 240, 8, 8),
        unselectedItemColor: Color.fromARGB(255, 10, 9, 9),
        onTap: onTapped,
      ),
    );
  }
}
