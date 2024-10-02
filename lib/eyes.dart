import 'package:flutter/material.dart';

class EyeWidget extends StatefulWidget {
  final bool isEyeOpen;
  const EyeWidget({Key? key, required this.isEyeOpen}) : super(key: key);
  @override
  EyeWidgetState createState() => EyeWidgetState();
}

class EyeWidgetState extends State<EyeWidget> with SingleTickerProviderStateMixin {
  bool isBlinking = false;
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(covariant EyeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Trigger open/close animation when the state changes
    if (widget.isEyeOpen != oldWidget.isEyeOpen) {
      if (widget.isEyeOpen) {
        _controller.reverse(); // Open the eye
      } else {
        _controller.forward(); // Close the eye
      }
    }
  }

  void blink() {
    if (!isBlinking) {
      setState(() {
        isBlinking = true;
      });
      if (widget.isEyeOpen) {
        // If the eye is open, close it
        _controller.forward().then((_) {
          setState(() {
             // Eye is now closed
            isBlinking = false;
          });
        });
      } else {
        // If the eye is closed, open it
        _controller.reverse().then((_) {
          setState(() {
             // Eye is now open
            isBlinking = false;
          });
        });
      }
      // _controller.forward().then((_) {
      //   _controller.reverse().then((_) {
      //     setState(() {
      //       isBlinking = false;
      //     });
      //   });
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: blink,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // White part of the eye (eyeball)
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 4),
            ),
          ),
          // Iris (colored part of the eye)
          Positioned(
            top: 30,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ),
          // Pupil
          Positioned(
            top: 40,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
          // Eyelid
          Positioned(
            top: -10 + _animation.value * -80,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}