import 'package:fixfinder/Pages/UserAboutAddress.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocationAnimation extends StatefulWidget {
  const LocationAnimation({super.key});

  @override
  _LocationAnimationState createState() => _LocationAnimationState();
}

class _LocationAnimationState extends State<LocationAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xfff7f7f7),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Lottie.asset(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              kIsWeb ?  "assets/briliant.json":'assets/location.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserAboutAddress()),
                  ));
              },
            ),
          ),
      ),
    );
  }
}