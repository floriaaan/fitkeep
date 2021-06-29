import 'package:fitkeep_flutter/services/auth.dart';
import 'package:fitkeep_flutter/shared/constants.dart';
import 'package:fitkeep_flutter/shared/google_sign_in_button.dart';
import 'package:fitkeep_flutter/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Spacer(flex: 3),
                  FlutterLogo(
                    size: 100,
                  ),
                  Spacer(flex: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: DefaultPadding / 2),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  labelText: "Email",
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? "Enter an email" : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    labelText: "Password"),
                                validator: (val) => val!.length < 6
                                    ? "Enter a password 6+ chars long"
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ))),
                                    icon: Icon(Icons.person_outline),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "Could not sign in with those credentials";
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                    label: Text(
                                      'Sign in',
                                    )),
                              ),
                            ),
                            FittedBox(
                              child: TextButton(
                                  onPressed: () => widget.toggleView(),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_add_alt_outlined,
                                        size: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(0.8),
                                      ),
                                      SizedBox(width: DefaultPadding / 4),
                                      Text(
                                        "You don't have an account?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color!
                                                  .withOpacity(0.8),
                                            ),
                                      ),
                                    ],
                                  )),
                            ),
                            Center(
                              child: GoogleSignInButton(),
                            ),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                  Spacer(
                    flex: 7,
                  )
                ],
              ),
            ),
          );
  }
}
