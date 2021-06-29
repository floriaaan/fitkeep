import 'package:flutter/material.dart';

class KeepCreate extends StatefulWidget {
  const KeepCreate({Key? key}) : super(key: key);

  @override
  _KeepCreateState createState() => _KeepCreateState();
}

class _KeepCreateState extends State<KeepCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Container(
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
