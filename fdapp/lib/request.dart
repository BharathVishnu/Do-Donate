// import 'package:flutter/material.dart';

// class req extends StatelessWidget {
//   const req({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('REQUESTS'), backgroundColor: Colors.red),
//     );
//   }
// }
//import 'dart:js_util';

import 'package:fdapp/donations.dart';
import 'package:fdapp/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class adduser extends StatefulWidget {
  const adduser({Key? key}) : super(key: key);

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  @override
  final blood = ['0-', 'o+'];

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController city = TextEditingController();

  void adddonar() {
    final data = {
      'address': address.text,
      'date': date.text,
      'phone': phone.text,
      'quantity': quantity.text,
      'city': city.text
    };
    donor.add(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 145, 138),
          title: Center(
              child: Text(
            "REQUEST",
            style: TextStyle(fontSize: 25),
          ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: address,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Address")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: city,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("City")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone Number")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: quantity,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Quantity")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: date,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Date")),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => profile()));
                  adddonar();
                },
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all(Size(double.infinity, 60)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 148, 148, 1))),
                child: Text("submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
