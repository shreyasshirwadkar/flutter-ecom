import 'package:ecom/common/widgets/custom_button.dart';
import 'package:ecom/common/widgets/custom_textfield.dart';
import 'package:ecom/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AuthScreen
    extends StatefulWidget {
  static const String routeName =
      '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() =>
      _AuthScreenState();
}

class _AuthScreenState
    extends State<AuthScreen> {
  final TextEditingController
  _emailController =
      TextEditingController();
  final TextEditingController
  _passwordController =
      TextEditingController();
  final TextEditingController
  _nameController =
      TextEditingController();
  final _signUpFormKey =
      GlobalKey<FormState>();
  final _signInFormKey =
      GlobalKey<FormState>();

  bool _isSignIn = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          GlobalVariables
              .greyBackgroundCOlor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center,
            children: [
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 50),
              Text(
                _isSignIn
                    ? "Welcome Back"
                    : "Welcome back you've been missed!",
                style: TextStyle(
                  color:
                      Colors.grey[800],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 25),
              Text(
                _isSignIn
                    ? "Sign In"
                    : "Create Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Form(
                key:
                    _isSignIn
                        ? _signInFormKey
                        : _signUpFormKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                  child: Column(
                    children: [
                      if (!_isSignIn)
                        Column(
                          children: [
                            CustomTextfield(
                              controller:
                                  _nameController,
                              hintText:
                                  "Enter Name",
                              obscureText:
                                  false,
                            ),
                            SizedBox(
                              height:
                                  10,
                            ),
                          ],
                        ),
                      CustomTextfield(
                        controller:
                            _emailController,
                        hintText:
                            "Enter email",
                        obscureText:
                            false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        controller:
                            _passwordController,
                        hintText:
                            "Enter password",
                        obscureText:
                            true,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        text:
                            _isSignIn
                                ? "Sign In"
                                : "Sign Up",
                        onTap: () {
                          if (_isSignIn) {
                            if (_signInFormKey
                                .currentState!
                                .validate()) {
                              //handle sign in
                            } else {
                              if (_signUpFormKey
                                  .currentState!
                                  .validate()) {
                                //handle sign up
                              }
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  Text(
                    _isSignIn
                        ? "Don't have an account?"
                        : "Already have an account? ",
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSignIn =
                            !_isSignIn;
                      });
                    },
                    child: Text(
                      _isSignIn
                          ? "Sign Up"
                          : "Sign In",
                      style: TextStyle(
                        color:
                            Colors.blue,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
