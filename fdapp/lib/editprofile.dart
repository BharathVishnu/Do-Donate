// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class editprofile
//  extends StatelessWidget {
//   const editprofile
//   ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:fdapp/donations.dart';
import 'package:fdapp/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class editprofile extends StatefulWidget {
  const editprofile({Key? key}) : super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  final blood = ['0-', 'o+'];

  final CollectionReference userprofile =
      FirebaseFirestore.instance.collection('userprofile');
  TextEditingController name = TextEditingController();
  TextEditingController organization = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  void addprofile() {
    final data = {
      'name': name.text,
      'organization': organization.text,
      'city': city.text,
      'address': address.text,
      'phone': phone.text
    };
    userprofile.add(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 148, 148, 1),
          title: Text("Create Profile ")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Name")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: organization,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Organization")),
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
                controller: address,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Address")),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone")),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => profile()));
                  addprofile();
                },
                style: ButtonStyle(
                    maximumSize:
                        MaterialStateProperty.all(Size(double.infinity, 60)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 148, 148, 1))),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
