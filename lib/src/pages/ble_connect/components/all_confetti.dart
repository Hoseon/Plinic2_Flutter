import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AllConfettiWidget extends StatefulWidget {
  final Widget child;
  AllConfettiWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AllConfettiWidget> createState() => _AllConfettiWidgetState();
}

class _AllConfettiWidgetState extends State<AllConfettiWidget> {
  ConfettiController? controller;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: Duration(seconds: 2));
    controller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller!,
            colors: [
              Color(0xfffef08a),
              Color(0xffa7f3d0),
              Color(0xffc4b5fd),
              Color(0xfffca5a5),
              Color(0xfffef08a),
              Color(0xffd0f0ff)
            ],
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            gravity: 0.5,
          ),
        ),
        widget.child
      ],
    );
  }
}
