import 'package:flutter/material.dart';
import 'package:test2/services/auth.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Welcome to Mercom'),
        backgroundColor: Colors.green[800],
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
    );
  }
}
