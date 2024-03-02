// main.dart

import 'package:flutter/material.dart';
import 'package:stumer/widget/todo.dart';
import 'package:stumer/widget/Userpage.dart';
import 'package:stumer/widget/TimerAppPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 5,
          backgroundColor: Colors.white,
          title: const Icon(
            Icons.face_2_rounded,
            size: 1,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 16, 24, 59),
          ),
        ),
        body: _buildScreen(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 16, 24, 59),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rounded),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const TimerApp();
      case 1:
        return const TodoApp();
      case 2:
        return const UserPage();
      default:
        return Container();
    }
  }
}
