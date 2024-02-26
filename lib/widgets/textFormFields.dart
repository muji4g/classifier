import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:xray_classifier_tb/theme/colors.dart';

class txtFormfields extends StatefulWidget {
  TextEditingController usernamecontroller;
  TextEditingController passwordcontroller;

  txtFormfields(
      {super.key,
      required this.usernamecontroller,
      required this.passwordcontroller});

  @override
  State<txtFormfields> createState() => _txtFormfieldsState();
}

class _txtFormfieldsState extends State<txtFormfields> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width * 0.7,
          decoration: BoxDecoration(
            color: txtfieldclr,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 228, 205, 184), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 9, // Blur radius
                offset: Offset(0, 4), // Offset in the x and y direction
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: TextFormField(
              controller: widget.usernamecontroller,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Ionicons.mail,
                    color: iconColor,
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 59, 59, 59)),
                  border: InputBorder.none),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          width: size.width * 0.7,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 228, 205, 184), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 9, // Blur radius
                offset: Offset(0, 4), // Offset in the x and y direction
              ),
            ],
            color: txtfieldclr,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: TextField(
              obscureText: !isVisible,
              controller: widget.passwordcontroller,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: IconButton(
                      icon: Icon(isVisible ? Ionicons.eye : Ionicons.eye_off),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      color: iconColor,
                    ),
                  ),
                  prefixIcon: Icon(Ionicons.key, color: iconColor),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 59, 59, 59)),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
