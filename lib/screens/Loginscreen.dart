import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:xray_classifier_tb/screens/splashScreen.dart';
import 'package:xray_classifier_tb/theme/TextStyles.dart';
import 'package:xray_classifier_tb/theme/colors.dart';
import 'package:xray_classifier_tb/widgets/appButtons.dart';
import 'package:xray_classifier_tb/widgets/textFormFields.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    bool isVisible = false;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => splashScreen()));
                },
                icon: const Icon(
                  Ionicons.arrow_back,
                  color: iconColor,
                )),
          ),
          actions: []),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Tuberculosis Detection \nUsing Deep Learning',
                style: titleStyle.copyWith(fontSize: size.width * 0.05),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  width: size.width * 0.45,
                  child: Image.asset('assets/images/lungs_magnifying.png')),
              Text(
                'Welcome',
                style: titleStyle.copyWith(fontSize: size.width * 0.07),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              txtFormfields(
                controller: emailController,
                hinttxt: 'Email',
                isHidden: false,
                icon: Ionicons.mail_outline,
              ),
              SizedBox(
                height: size.height * .03,
              ),
              txtFormfields(
                controller: passwordController,
                hinttxt: 'Password',
                isHidden: isVisible,
                icon: Ionicons.key,
                suffixButton: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(Ionicons.eye)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              forgotbtn(
                onPressed: () {},
              ),
              SizedBox(
                height: size.height * .03,
              ),
              primarybtn(
                  onPressed: () {},
                  txtBtn: 'login',
                  containerColor:
                      containerBtn, //Colors.black is not working as well
                  ShadowColor: Color.fromARGB(255, 134, 175, 128),
                  btntxtStyle: btntxtStyle2),
            ]),
          ],
        ),
      ),
    );
  }
}
