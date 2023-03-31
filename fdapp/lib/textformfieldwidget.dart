import "package:flutter/material.dart";

class LabelAndTextFormField extends StatefulWidget {
  final String labelText;
  final String defaultText;

  LabelAndTextFormField({required this.labelText, required this.defaultText});

  @override
  _LabelAndTextFormFieldState createState() => _LabelAndTextFormFieldState();
}

class _LabelAndTextFormFieldState extends State<LabelAndTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Color.fromRGBO(246, 219, 219, 1.000),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            Text(
              widget.labelText,
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            Text(
              widget.defaultText,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//                   height: 50,
//                   width: 278,
//                   child: TextFormField(
//                     controller: _emailController,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color.fromARGB(100, 97, 97, 97),
//                         icon: Icon(
//                           Icons.email,
//                           color: Colors.white,
//                         ),
//                         label: Text("Email",
//                             style: TextStyle(color: Colors.white)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         )),
//                   ),
//                 ),