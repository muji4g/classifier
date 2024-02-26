import 'package:flutter/material.dart';
import 'package:xray_classifier_tb/theme/colors.dart';

class txtFormfields extends StatefulWidget {
  TextEditingController controller;
  bool isHidden = false;
  final String hinttxt;
  final IconData icon;
  IconButton? suffixButton;

  txtFormfields({
    super.key,
    required this.controller,
    required this.icon,
    required this.isHidden,
    required this.hinttxt,
    this.suffixButton,
  });

  @override
  State<txtFormfields> createState() => _txtFormfieldsState();
}

class _txtFormfieldsState extends State<txtFormfields> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: txtfieldclr,
        border: null,
        borderRadius: BorderRadius.circular(12),
      ),
      width: size.width * .7,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          obscureText: widget.isHidden,
          controller: widget.controller,
          decoration: InputDecoration(
              suffixIcon: widget.suffixButton,
              prefixIcon: Icon(
                widget.icon,
                color: iconColor,
              ),
              hintText: widget.hinttxt,
              hintStyle: TextStyle(color: Color.fromARGB(255, 59, 59, 59)),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
