import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CoreButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color lineColor;
  final Color textColor;
  final VoidCallback? onTap;
  final double textSize;

  const CoreButton({super.key, required this.text, this.onTap, required this.backgroundColor, required this.lineColor, required this.textColor, required this.textSize});

  @override
  _CoreButtonState createState() => _CoreButtonState();
}

class _CoreButtonState extends State<CoreButton>
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
    final textStyle = GoogleFonts.robotoMono(
      fontSize: widget.textSize,
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
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1.5, color:  widget.lineColor)
          ),
          child: Center(
            child:

            Text( widget.text, style: textStyle, textAlign: TextAlign.center,),

          ),
        ),
      ),
    );
  }
}