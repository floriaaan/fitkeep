import 'package:fitkeep_flutter/models/user.dart';
import 'package:fitkeep_flutter/screens/home/home.dart';
import 'package:fitkeep_flutter/screens/home/keeps.dart';
import 'package:fitkeep_flutter/screens/home/profile.dart';
import 'package:fitkeep_flutter/screens/home/stats.dart';
import 'package:fitkeep_flutter/services/auth.dart';
// import 'package:fitkeep_flutter/shared/navbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  final AuthService _auth = AuthService();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    List<Widget> navWidgets = [
      HomeScreen(),
      KeepsScreen(),
      StatsScreen(),
      ProfileScreen(),
    ];

    String _title = "Home";

    void displayBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/avatar.png',
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(user!.email.toString()),
                        ),
                      ],
                    ),
                    Divider(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _auth.signOut();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Log out',
                              style: TextStyle(
                                // fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.person_off_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('FitKeep',
      //       style:
      //           TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: <Widget>[
      //     TextButton.icon(
      //         onPressed: () async {
      //           await _auth.signOut();
      //         },
      //         icon: Icon(
      //           Icons.person_off_outlined,
      //           color: Colors.black38,
      //         ),
      //         label: Text(
      //           'Log out',
      //           style: TextStyle(color: Colors.black38),
      //         ))
      //   ],
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _title,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: navWidgets[selectedIndex],
          )
        ],
      ),
      // body: SafeArea(
      //     child: Padding(
      //   padding: const EdgeInsets.only(top: 40),
      //   child: HomeScreen(),
      // )),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(1),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/images/avatar.png'),
              // iconSize: 50,
              onPressed: () => displayBottomSheet(context),
            )
          ],
        ),
      ),
    );
  }
}


/*
// bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: this.selectedIndex,
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //   selectedItemColor: Colors.teal.shade800,
      //   unselectedItemColor: Colors.grey.shade800,
      //   backgroundColor: Colors.grey.shade100,
      //   iconSize: 32,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       activeIcon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.note_alt_outlined),
      //       activeIcon: Icon(Icons.note_alt),
      //       label: "Keeps",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bubble_chart_outlined),
      //       activeIcon: Icon(Icons.bubble_chart),
      //       label: "Stats",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       activeIcon: Icon(Icons.person),
      //       label: "Profile",
      //     )
      //   ],
      //   onTap: (int index) {
      //     setState(() {
      //       selectedIndex = index;
      //       if (index == 0) setState(() => _title = "Home");
      //       if (index == 1) setState(() => _title = "Keeps");
      //       if (index == 2) setState(() => _title = "Stats");
      //       if (index == 3) setState(() => _title = "Profile");
      //     });
      //   },
      // )
*/

/*
Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
              width: 80,
              child: Icon(
                Icons.home_filled,
                size: 32,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(
              height: 32,
              width: 80,
              child: Icon(
                Icons.favorite_border_outlined,
                size: 32,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: 32,
              width: 80,
              child: Icon(
                Icons.bubble_chart_outlined,
                size: 32,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: 32,
              width: 80,
              child: Icon(
                Icons.person_outline,
                size: 32,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
*/