import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: _currentIndex == 0
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: _currentIndex == 1
                ? Icon(Icons.music_note)
                : Icon(Icons.music_note_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Places',
            icon: _currentIndex == 2
                ? Icon(Icons.location_on)
                : Icon(Icons.location_on_outlined),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: _currentIndex == 3
                ? Icon(Icons.library_books)
                : Icon(Icons.library_books_outlined),
          ),
        ],
      ),
    );
  }
}
