import 'package:flutter/material.dart';
import 'package:test2/provide.dart';
import 'package:test2/wrapper.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/provide': (context) => Provide(),
      '/wrapper': (context) => Wrapper(),
    },
  ));
}
