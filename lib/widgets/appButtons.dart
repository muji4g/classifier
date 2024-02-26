import 'package:flutter/material.dart';
import 'package:xray_classifier_tb/theme/TextStyles.dart';
import 'package:xray_classifier_tb/theme/colors.dart';

class primarybtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String txtBtn;
  final Color containerColor;

  Color? ShadowColor;
  final TextStyle btntxtStyle;

  primarybtn(
      {super.key,
      required this.onPressed,
      required this.txtBtn,
      required this.containerColor,
      this.ShadowColor,
      required this.btntxtStyle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //to achieve responsiveness
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: ShadowColor!, // Shadow color
            spreadRadius: 3, // Spread radius
            blurRadius: 9, // Blur radius
            offset: Offset(0, 6), // Offset in the x and y direction
          ),
        ],
      ),
      width: size.width * .40,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          txtBtn.toUpperCase(),
          style: btntxtStyle,
        ),
      ),
    );
  }
}

class forgotbtn extends StatelessWidget {
  final onPressed;
  const forgotbtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                // Color when pressed
                return txtfieldclr; // Change this to your desired color
              }
              // Color when not pressed
              return Colors.transparent; // Use the default overlay color
            },
          ),
        ),
        child: Text(
          'Forgot Your Password?',
          style: secondaryStyle.copyWith(fontSize: size.width * 0.04),
        ));
  }
}
