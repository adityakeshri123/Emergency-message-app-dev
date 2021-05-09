import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/services/auth.dart';
import 'package:test2/wrapper.dart';
import 'package:test2/model/user.dart';

class Provide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: Wrapper(),
    );
  }
}
