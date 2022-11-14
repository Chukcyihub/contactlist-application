import 'package:contactlist/widgets/favorite_widget.dart';
import 'package:contactlist/widgets/home_widget.dart';
import 'package:contactlist/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  _setindex(int index) => setState(() => _selectedIndex = index);
  final List<Widget> _myWidgets = const [
    HomeWidget(),
    FavoriteWidget(),
    ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My contacts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _myWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _setindex(value),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
