import 'package:events_manager/screens/home_screen.dart';
import 'package:events_manager/screens/login_screen.dart';
import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final List<Icon> bnbItems = [];

  final List<Widget> screensList = [
    HomeScreen(),
    LoginScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  late Widget selectedItem;
  IconData? selectedIcon;
  @override
  void initState() {
    selectedItem = screensList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60, // desired width
        height: 60,
        child: FloatingActionButton(
          backgroundColor: seedColor,
          splashColor: Colors.red,
          shape: CircleBorder(side: BorderSide(color: Colors.white, width: 4)),
          onPressed: () {
            //  TODO
          },
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
      body: selectedItem,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // creates the notch
        notchMargin: 6.0,
        color: seedColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            babItem(
              _BottomNavBarItem(
                icon: Icons.home_rounded,
                label: "Home",
                index: 0,
              ),
            ),
            babItem(
              _BottomNavBarItem(
                icon: Icons.location_on_outlined,
                label: "Map",
                index: 1,
              ),
            ),
            SizedBox(width: 32),
            babItem(
              _BottomNavBarItem(
                icon: Icons.favorite_outline_rounded,
                label: "Favorite",
                index: 2,
              ),
            ),

            babItem(
              _BottomNavBarItem(
                icon: Icons.person_outline_sharp,
                label: "Profile",
                index: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget babItem(_BottomNavBarItem item) => InkWell(
    splashColor: Colors.transparent,
    onTap: () {
      setState(() {
        selectedItem = screensList[item.index];
        selectedIcon = item.icon;
      });
    },
    highlightColor: Colors.transparent,

    child: SizedBox(
      width: 80,
      height: 80,
      child: Column(
        children: [
          Icon(
            item.icon,
            color: Colors.white,
            size: selectedIcon == item.icon ? 32 : 28,
          ),
          Text(
            item.label,
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  (selectedIcon == item.icon)
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}

class _BottomNavBarItem {
  _BottomNavBarItem({
    required this.icon,
    required this.label,
    required this.index,
  });

  final IconData icon;
  final String label;
  final int index;
}
