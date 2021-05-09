import 'package:flutter/material.dart';
import 'package:test2/services/auth.dart';
import 'package:test2/shared/decorate.dart';
import 'package:test2/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text('Log in to Mercom'),
          backgroundColor: Colors.green[600],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            )
          ]),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: Decorate.copyWith(hintText: 'Email'),
                validator: (val) =>
                    val.isEmpty ? 'Please Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: Decorate.copyWith(hintText: 'Password'),
                validator: (val) =>
                    val.length < 6 ? 'Password length must be atleast 6' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.green[300],
                  child: Text('Log in'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result =
                          await _auth.SignInWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = ' Email is not Registered or Valid';
                          loading = false;
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red[900], fontSize: 14.0),
              ),
              SizedBox(height: 100.0),
              if (loading == true) Loading(),
            ])),
      ),
    );
  }
}
