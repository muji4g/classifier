//size widgets in the whole has been used to make the screen responsive!!!!!

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import 'package:xray_classifier_tb/app_config.dart';
import 'package:xray_classifier_tb/screens/splashScreen.dart';
import 'package:xray_classifier_tb/theme/TextStyles.dart';
import 'package:xray_classifier_tb/theme/colors.dart';
import 'package:xray_classifier_tb/userProvider.dart';
import 'package:xray_classifier_tb/widgets/appButtons.dart';
import 'package:xray_classifier_tb/widgets/textFormFields.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark));

    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus()
      }, //this function closes the keyboard whenver the user taps anywehre on the screen
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const splashScreen()));
                },
                icon: const Icon(
                  Ionicons.arrow_back,
                  color: iconColor,
                )),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Tuberculosis Detection \nUsing Deep Learning',
                  style: titleStyle.copyWith(fontSize: size.width * 0.04),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    width: size.width * 0.4,
                    child: Image.asset('assets/images/lungs_magnifying.png')),
                Text(
                  'Welcome',
                  style: titleStyle.copyWith(fontSize: size.width * 0.05),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                txtFormfields(
                    usernamecontroller: usernameController,
                    passwordcontroller: passwordController),
                SizedBox(
                  height: size.height * .005,
                ),
                forgotbtn(
                  onPressed: () {},
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                primarybtn(
                    onPressed: () async {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      if (username.isEmpty || password.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Error',
                                style: titleStyle,
                              ),
                              backgroundColor: backgroundColor,
                              content: Text(
                                  "Please enter username and password.",
                                  style: secondaryStyle),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text(
                                    "OK",
                                    style: secondaryStyle,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          // Create the request body for the POST request
                          Map<String, dynamic> requestBody = {
                            'username': username,
                            'pwd': password,
                            'status': 1, // Set the status field to 1
                          };

                          // Convert the request body to JSON
                          String requestBodyJson = json.encode(requestBody);

                          // Make the POST request
                          Uri postUrl = Uri.parse(
                              Config.domain1 + '/imgproject/isvaliduser_m/');
                          http.Response postResponse = await http.post(
                            postUrl,
                            headers: {'Content-Type': 'application/json'},
                            body: requestBodyJson,
                          );

                          if (postResponse.statusCode == 200) {
                            dynamic responseJson =
                                json.decode(postResponse.body);
                            print(responseJson);
                            if (responseJson[0]['status'] == "1") {
                              String username = responseJson[0][
                                  'username']; // Extract the username from the responseJson
                              // Set the username in the UserProvider
                              Provider.of<UserProvider>(context, listen: false)
                                  .setUsername(username);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => splashScreen(),
                                ),
                              );
                            } else {
                              // Invalid username or password
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "Invalid username or password."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            // Invalid username or password
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("Invalid"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } catch (error) {
                          print('Error: $error');
                          // Handle error here
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    txtBtn: !isLoading ? 'LOGIN' : 'Please Wait...',
                    containerColor: !isLoading ? containerBtn : containerBtn2,
                    ShadowColor: !isLoading
                        ? const Color.fromARGB(255, 134, 175, 128)
                        : containerBtn2,
                    btntxtStyle: btntxtStyle2),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
