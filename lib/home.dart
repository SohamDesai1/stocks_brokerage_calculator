import 'screens/delivery.dart';
import 'screens/fno.dart';
import 'screens/intraday.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int _index = 0;
  static final List _widgets = [
    const Intraday(),
    const FNO(),
    const Delivery(),
  ];
  void itemTapped(int index) {
    setState(() {
      _index = index;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 31, 128, 224),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined), label: 'Intraday'),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page_outlined), label: 'F&O'),
          BottomNavigationBarItem(
              icon: Icon(Icons.house_outlined), label: 'Delivery'),
        ],
        currentIndex: _index,
        onTap: itemTapped,
      ),
      body: _widgets.elementAt(_index),
    );
  }
}
