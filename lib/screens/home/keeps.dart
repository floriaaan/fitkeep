import 'package:fitkeep_flutter/screens/keeps/create.dart';
import 'package:flutter/material.dart';

class KeepsScreen extends StatefulWidget {
  const KeepsScreen({Key? key}) : super(key: key);

  @override
  _KeepsScreenState createState() => _KeepsScreenState();
}

class _KeepsScreenState extends State<KeepsScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 600,
            child: Container(
              color: Colors.teal,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(32.0),
                        topRight: const Radius.circular(32.0)),
                  ),
                  builder: (context) {
                    final theme = Theme.of(context);
                    // Using Wrap makes the bottom sheet height the height of the content.
                    // Otherwise, the height will be half the height of the screen.
                    return new Container(
                      height: 500.0,
                      color: Colors.transparent,
                      child: new Container(
                          child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Column(
                          children: [
                            TextFormField(
                              initialValue: 'Input text',
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                );
              },
              child: Text('Create'))
        ],
      );
    });
  }
}
