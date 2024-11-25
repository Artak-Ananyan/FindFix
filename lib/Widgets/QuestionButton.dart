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


    final textStyle = GoogleFonts.lato(
      fontSize:  widget.textSize,
      fontWeight: FontWeight.w700,
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


            borderRadius:
            const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
                bottomLeft:  Radius.circular(6),
                bottomRight:  Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20,),
              Stack(
                children: [
                  Container(child: const Icon(
                    Icons.circle,

                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        blurRadius: 1.0,
                      ),
                    ],

                    color:  Colors.white, size: 50,)),
                  Container(
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Icon(Icons.circle, color: widget.selected ? const Color(0xFFFF0083): Colors.white, size: 40,)),
                ],
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Text(widget.text, style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}