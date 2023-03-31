// import 'package:flutter/material.dart';

// class donate extends StatefulWidget {
//   const donate({super.key});

//   @override
//   State<donate> createState() => _donateState();
// }

// class _donateState extends State<donate> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage("assets/Donate header.png"),
//         fit: BoxFit.cover,
//       )),
//     );
//   }
// }
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './globals.dart ' as global;

class donate extends StatefulWidget {
  const donate({Key? key}) : super(key: key);

  @override
  State<donate> createState() => _donateState();
}

class _donateState extends State<donate> {
  @override
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  void donate(docid) {
    donor.doc(docid).delete();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 148, 148, 1),
          title: Center(
              child: Text(
            "DONATE",
            style: TextStyle(fontSize: 25),
          ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.pink,
                        //       blurRadius: 10,
                        //       spreadRadius: 10),
                        // ]),
                        color: Color.fromRGBO(246, 219, 219, 1.000),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Address :  ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['address'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "City :  ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['city'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Date :  ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['date'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Quantity :  ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['quantity'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Phone No :  ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['phone'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {});

                                      donate(donorSnap.id);
                                    },
                                    style: ButtonStyle(
                                        maximumSize: MaterialStateProperty.all(
                                            Size(double.infinity, 60)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 247, 145, 138))),
                                    child: Text('DONATE')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
