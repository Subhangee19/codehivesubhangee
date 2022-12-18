import 'package:codehive/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/fav.dart';
import 'screens/home.dart';
import 'screens/post.dart';
import 'screens/userpage.dart';
import 'screens/mainscreen.dart';
import 'screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: CodeHiveApp()));
}
//
// void main() => runApp(MaterialApp(
//     home: Screens()
// )
// );

class CodeHiveApp extends StatefulWidget {
  const CodeHiveApp({Key? key}) : super(key: key);

  @override
  State<CodeHiveApp> createState() => _CodeHiveAppState();
}

class _CodeHiveAppState extends State<CodeHiveApp> {
  @override
  Widget build(BuildContext context) {
    print("${FirebaseAuth.instance.authStateChanges()} hello");
    return MaterialApp(
      home : StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if( snapshot.hasData ) {
            return Screens();
          } else {
            return Screens();
          }
        },
      )
    );
  }
}


class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Fav(),
    Post(),
    Login(),
  ];

  dynamic _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: Icon(Icons.camera),
        ),
        appBar: AppBar(
          title: Text('CodeHive'),
          centerTitle: false,
          backgroundColor: Colors.orange[700],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.orange[700],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favourite',
              backgroundColor: Colors.orange[700],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'feed',
              backgroundColor: Colors.orange[700],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.orange[700],
            ),
          ],
        ));
  }
}
