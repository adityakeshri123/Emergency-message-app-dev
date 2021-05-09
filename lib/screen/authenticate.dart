import 'package:flutter/material.dart';
import 'package:test2/screen/register.dart';
import 'package:test2/screen/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool IsSignIn = true;
  void toggleView() {
    setState(() => IsSignIn = !IsSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (IsSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
