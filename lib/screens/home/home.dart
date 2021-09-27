// import 'package:fitkeep_flutter/components/block.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: GridView.extent(
              maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(6),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                InkWell(
                    onTap: () {
                      print("Container clicked");
                    },
                    child: new Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('test')),
                    )),
              ],
            ))
      ],
    );
  }
}


/**
 * SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Block(
                  width: (MediaQuery.of(context).size.width) / 5,
                  color: Colors.red.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.red.shade800),
                  ),
                  onPress: () => print('test'),
                ),
                Block(
                  width: (MediaQuery.of(context).size.width) / 5,
                  color: Colors.green.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.green.shade800),
                  ),
                ),
                Block(
                  width: (MediaQuery.of(context).size.width) / 5,
                  color: Colors.amber.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.amber.shade800),
                  ),
                ),
                Block(
                  width: (MediaQuery.of(context).size.width) / 5,
                  color: Colors.blue.shade100,
                  child: Text(
                    'test',
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                )
              ],
            ),
          ),
 */