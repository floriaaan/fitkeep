import 'package:fitkeep_flutter/components/block.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Block(
                  color: Colors.red.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.red.shade800),
                  ),
                ),
                Block(
                  color: Colors.green.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.green.shade800),
                  ),
                ),
                Block(
                  color: Colors.amber.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.amber.shade800),
                  ),
                ),
                Block(
                  color: Colors.blue.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
