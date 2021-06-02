import 'package:fitkeep_flutter/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(backgroundColor: Colors.amber,elevation: 0.0, title: Text('Sign in to FitKeep'),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(child: Text('Anon Sign'), onPressed: () async {
          dynamic result = await _auth.signInAnon();
          if(result == null) {
            print('An error occured on function: signInAnon on: sign_in.dart');
          } else {
            print('Signed in');
            print(result.uid);
          }
        },),
      )
    );
  }
}