import 'package:fixfinder/Pages/Home.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'HomeWeb.dart';
import 'Network/InfoData.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    kIsWeb ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAtnSOF0uGNmPLUlhPNej0Gs3A6zm9456s", // Only if necessary
      appId: "1:120600345237:web:786fe5d124af60be99b99c",
      messagingSenderId: "G-CK435X03C3",
      projectId: "fixfinder-d83f2",
    ),
  ): await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static InfoData infoData = InfoData();


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "FixFinder",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  kIsWeb ? HomeWeb():  Home() ,

      ),
    );
  }
}
