import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = 'None Clicked';
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        key: drawerKey,
        endDrawer: Drawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.car_repair),
              ),
              Tab(
                icon: Icon(Icons.home_repair_service),
              ),
              Tab(
                icon: Icon(Icons.room_service),
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          title: Text('AppBar and TabBar'),
          actions: [
            IconButton(
              splashRadius: 50,
              onPressed: () {
                setState(() {
                  text = 'Cast Clicked';
                });
              },
              icon: Icon(Icons.cast),
            ),
            IconButton(
              splashRadius: 50,
              onPressed: () {
                setState(() {
                  text = 'Profile Clicked';
                  drawerKey.currentState!.openEndDrawer();
                });
              },
              icon: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg')),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Car repair - $text'),
            ),
            Center(
              child: Text('Home repair - $text'),
            ),
            Center(
              child: Text('Room service - $text'),
            ),
          ],
        ),
      ),
    );
  }
}
