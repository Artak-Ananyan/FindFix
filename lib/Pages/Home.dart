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
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 0, top: 60, right: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Category("Roof Repair", "assets/home.png", 180, 170, 12),
              Category("Gutter Services", "assets/gutter.png", 180, 170, 12)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category("Fence Repair", "assets/fence.png", 180, 170, 12),
                Category("Electrician & Plumber", "assets/drel.png", 180, 170, 12),
                ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category("Appliance Repair & Service", "assets/loundry.png", 180, 170, 12),
                Category("AC Service & Repair", "assets/ac.png", 180, 170, 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category("Decks & Porches", "assets/decks.png", 180, 170, 12),
                Category("Plumbing", "assets/krant.png", 180, 170, 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category("Home Painting", "assets/painting.png", 180, 170, 12),
                Category("Bethroom & Kitchen Cleaning", "assets/shower.png", 180, 170, 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Category("Full Home Cleaning", "assets/armcheer.png", 180, 170, 12),
                Category("Pest Control", "assets/spider.png", 180, 170, 12),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
