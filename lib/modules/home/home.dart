import 'package:flutter/material.dart';
import 'package:todolist/modules/archive/archived.dart';
import 'package:todolist/modules/auth/login.dart';
import 'package:todolist/modules/done/done.dart';
import 'package:todolist/modules/tasks/tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];

  Future<void> _logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: appBar(),
        body: _children[_currentIndex],
        bottomNavigationBar: bottomNavigationBar(),
        floatingActionButton: floatingActionButton(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('My App'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _logout(),
        ),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Done',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Archived',
        ),
      ],
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.white,
              child: const Center(
                child: Text('This is a bottom sheet'),
              ),
            );
          },
        );
      },
    );
  }

  // Create DB
  // Create Tables
  // Open DB
  // Insert to DB
  // Get from DB
  // Update in DB
  // Delete from DB
}
