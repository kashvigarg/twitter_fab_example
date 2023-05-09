import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_fab_example/controllers/screen_controller.dart';
import 'package:twitter_fab_example/pages/chat_screen.dart';
import 'package:twitter_fab_example/pages/home_screen.dart';
import 'package:twitter_fab_example/pages/space_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenController screenController = Get.put(ScreenController());

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(
          Icons.airplane_ticket_sharp,
          color: Colors.blue,
          size: 40,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() => _pages[screenController.currPage.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: _items,
          currentIndex: screenController.currPage.value,
          onTap: (value) => screenController.setPage(value),
        ),
      ),
    ));
  }
}

List<BottomNavigationBarItem> _items = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.mic), label: "Spaces"),
  BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat")
];

List<Widget> _pages = const [HomeScreen(), SpaceScreen(), ChatScreen()];
