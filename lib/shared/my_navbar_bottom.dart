/*import 'package:flutter/material.dart';

class SampleNavigationBar extends StatefulWidget {
  @override
  _SampleNavigationBarState createState() => _SampleNavigationBarState();
}

class _SampleNavigationBarState extends State<SampleNavigationBar> {
  int _currentPageIndex = 0;

  void _setIndex(int i) {
    setState(() {
      _currentPageIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _currentPageIndex,
      labelBehavior: NavigationBarDestinationLabelBehavior.alwaysShow,
      onTap: _setIndex,
      destinations: [
        NavigationBarDestination(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        NavigationBarDestination(
          icon: Icon(Icons.commute),
          label: 'Commute',
        ),
        NavigationBarDestination(
          icon: Icon(Icons.bookmark),
          unselectedIcon: Icon(Icons.bookmark_border),
          label: 'Saved',
        ),
        NavigationBarDestination(
          icon: Icon(Icons.add_circle),
          unselectedIcon: Icon(Icons.add_circle_outline),
          label: 'Contribute',
        ),
        NavigationBarDestination(
          icon: Icon(Icons.notifications),
          unselectedIcon: Icon(Icons.notifications_none),
          label: 'Updates',
        ),
      ],
    );
  }
}

*/