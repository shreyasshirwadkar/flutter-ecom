import 'package:ecom/auth/screens/auth_screen.dart';
import 'package:ecom/constants/global_variables.dart';
import 'package:ecom/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecom',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary:
              GlobalVariables
                  .secondaryColor,
        ),
        scaffoldBackgroundColor:
            GlobalVariables
                .backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute:
          (settings) =>
              generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
