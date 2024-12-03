import 'package:fixfinder/Pages/Home.dart';
import 'package:fixfinder/Pages/SplashScreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'HomeWeb.dart';
import 'Network/InfoData.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    kIsWeb ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCYTzSA_GFMcH3ruhP2FPFPiOeq4RchhVE",
        authDomain: "fixfinder-d83f2.firebaseapp.com",
        projectId: "fixfinder-d83f2",
        storageBucket: "fixfinder-d83f2.firebasestorage.app",
        messagingSenderId: "120600345237",
        appId: "1:120600345237:web:786fe5d124af60be99b99c",
        measurementId: "G-CK435X03C3"
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
        body:  kIsWeb ? HomeWeb():  SplashScreen() ,

      ),
    );
  }
}
