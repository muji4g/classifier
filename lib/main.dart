import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xray_classifier_tb/screens/splashScreen.dart';
import 'package:xray_classifier_tb/userProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TB Xray Classifier',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const splashScreen());
  }
}
