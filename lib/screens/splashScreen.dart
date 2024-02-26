import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xray_classifier_tb/screens/Loginscreen.dart';
import 'package:xray_classifier_tb/screens/SignUp.dart';
import 'package:xray_classifier_tb/theme/TextStyles.dart';
import 'package:xray_classifier_tb/theme/colors.dart';
import 'package:xray_classifier_tb/widgets/appButtons.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with SingleTickerProviderStateMixin {
  bool _showLoader = true;
  bool _showButtons = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showButtons = true;
        _showLoader = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //to achieve responsiveness
    return Container(
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //   Color.fromARGB(255, 101, 201, 39),
          //   Color.fromARGB(255, 177, 228, 132), // Third color
          // ]),
          color: backgroundColor),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            AnimatedOpacity(
              opacity: _showLoader ? 1 : 0,
              duration: Duration(milliseconds: 300),
              child: Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: iconColor, size: 40),
              ),
            ),
            Positioned(
              top: 50,
              left: 5,
              child: AnimatedOpacity(
                  opacity: _showButtons ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: backgroundColor,
                              title: Text(
                                'Close App?',
                                style: titleStyle,
                              ),
                              content: Text(
                                'Are you sure you want to close the Applicaiton?',
                                style: secondaryStyle,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'))
                              ],
                            );
                          },
                        );
                      },
                      icon: Row(
                        children: [
                          const Icon(
                            Ionicons.arrow_back,
                            color: iconColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              'Exit',
                              style: secondaryStyle.copyWith(
                                  fontSize: size.width * .0012),
                            ),
                          )
                        ],
                      ))),
            ),
            AnimatedOpacity(
                opacity: _showButtons ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * 0.35,
                      left: size.width * 0.02,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.6,
                            child: Image.asset(
                              'assets/images/pa_logo.png',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: size.height * 2,
            ),
            Positioned(
              top: size.height * 0.52,
              left: size.width * 0.10,
              child: AnimatedOpacity(
                opacity: _showButtons ? 1 : 0,
                duration: Duration(seconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TB Classifier',
                      style: titleStyle.copyWith(fontSize: size.width * 0.08),
                    ),
                    Text(
                      'Predict TB Accurately \nusing DeepLearning',
                      style:
                          secondaryStyle.copyWith(fontSize: size.width * 0.035),
                    )
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
                opacity: _showButtons ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: size.height * 0.71 - 20,
                      child: Column(
                        children: [
                          primarybtn(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginApp()),
                                  (route) => false);
                            },
                            txtBtn: 'LOGIN',
                            containerColor: containerBtn,
                            ShadowColor: Color.fromARGB(255, 134, 175, 128),
                            btntxtStyle: btntxtStyle1,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          primarybtn(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginApp()),
                                  (route) => false);
                            },
                            txtBtn: 'SignUp',
                            containerColor: containerBtn2,
                            ShadowColor: Color.fromARGB(255, 65, 63, 63),
                            btntxtStyle: btntxtStyle2,
                          ),
                          SizedBox(
                            height: size.height * .015,
                          ),
                          forgotbtn(
                            onPressed: () {},
                          ), //for you password button
                        ],
                      ),
                    )
                  ],
                ))
          ])),
    );
  }
}
