import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color lineColor;
  final Color textColor;
  final VoidCallback? onTap;
  final int index;
  final double textSize;
  final int maxIndex;
  final selected;
  const QuestionButton({super.key, required this.text, this.onTap, required this.backgroundColor, required this.lineColor, required this.textColor,
  required this.maxIndex, required this.index, required this.selected, required this.textSize});

  @override
  _QuestionButtonState createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
      setState(() => _scaleTransformValue = 1 - animationController.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
          () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 31; // Scale font size based on screen width


    final textStyle = GoogleFonts.robotoMono(
      fontSize:  fontSize,
      fontWeight: FontWeight.bold,
      textStyle: Theme.of(context).textTheme.displayLarge,
      color: widget.textColor,
    );
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: widget.index == 0 ?
            Border(
              top: BorderSide(color: Colors.green, width: 1), // Only top left
              right: BorderSide(color: Colors.green, width: 1), // Only top right
              left: BorderSide(color: Colors.green, width: 1), // Only top right
            ): widget.index == widget.maxIndex ?
            Border(
              top: BorderSide(color: Colors.green, width: 1), // Only top left
              bottom: BorderSide(color: Colors.green, width: 1), // Only top left
              right: BorderSide(color: Colors.green, width: 1), // Only top right
              left: BorderSide(color: Colors.green, width: 1), // Only top right
            ) :
            Border(
              top: BorderSide(color: Colors.green, width: 1),
              right: BorderSide(color: Colors.green, width: 1), // Only top right
              left: BorderSide(color: Colors.green, width: 1), // Only top right
            ),


            borderRadius: widget.index == 0 ?
            BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            ) : widget.index == widget.maxIndex ?
            BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0)
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 20,),
              Icon(widget.selected ? Icons.check_circle_rounded:Icons.circle_outlined, color: Colors.green),
              Expanded(
                child: Center(
                  child:  Text(widget.text, style: textStyle, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}