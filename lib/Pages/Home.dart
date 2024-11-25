import 'package:fixfinder/Widgets/Category.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 60, right: 20, bottom: 20),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Category(1, "Roof Repair", "assets/home.png", 231, 150, 18),
                Category(50, "Fence Repair", "assets/fence.png",  231, 150, 18),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(106, "Decks & Porches", "assets/decks.png",  231, 150, 18),
                Category(380, "Home Painting", "assets/painting.png",  231, 150, 18),
                ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(413, "Gutter Services", "assets/gutter.png",  231, 150, 18),
                Category(117, "Plumbing", "assets/krant.png", 231, 150, 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(37, "Appliance Repair", "assets/loundry.png",  231, 150, 18),
                Category(155, "AC Service", "assets/ac.png",  231, 150, 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(330, "Home Cleaning", "assets/armcheer.png",  231, 150, 18),
                Category(10, "Cleaning", "assets/shower.png",  231, 150, 18),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category(39, "Pest Control", "assets/spider.png",  231, 150, 18),
                Category(349, "Electrician", "assets/drel.png",  231, 150, 18),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
