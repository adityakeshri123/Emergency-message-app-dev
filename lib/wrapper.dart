import 'package:flutter/material.dart';
import 'package:test2/final.dart';
import 'package:test2/model/user.dart';
import 'package:test2/screen/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return final or Authenticate

    if (user == null) {
      return Authenticate();
    } else {
      return Final();
    }
  }
}
