import 'package:ecom/common/widgets/bottom_bar.dart';
import 'package:ecom/features/auth/screens/auth_screen.dart';
import 'package:ecom/constants/global_variables.dart';
import 'package:ecom/features/auth/services/auth_service.dart';
import 'package:ecom/providers/user_provider.dart';
import 'package:ecom/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (context) =>
                  UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService =
      AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
          authService.getUserData(
            context: context,
          );
        });
  }

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
      home:
          Provider.of<UserProvider>(
                context,
              ).user.token.isNotEmpty
              ? const BottomBar()
              : const AuthScreen(),
    );
  }
}
