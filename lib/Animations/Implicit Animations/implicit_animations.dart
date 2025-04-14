import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations>
    with SingleTickerProviderStateMixin {
  bool isAnimate = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Duration of the animation
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animations
            // AnimatedContainer(
            //   duration: const Duration(seconds: 1),
            //   width: isAnimate ? 200 : 100,
            //   height: isAnimate ? 100 : 200,
            //   color: isAnimate ? Colors.red : Colors.green,
            // ),
            // AnimatedAlign(
            //   alignment:
            //       isAnimate ? Alignment.centerRight : Alignment.centerLeft,
            //   duration: const Duration(seconds: 1),
            //   child: const FlutterLogo(
            //     size: 100,
            //   ),
            // ),
            // AnimatedCrossFade(
            //   firstChild: Container(
            //     color: Colors.blue,
            //     width: 100,
            //     height: 100,
            //   ),
            //   secondChild: Container(
            //     color: Colors.yellow,
            //     width: 100,
            //     height: 100,
            //   ),
            //   crossFadeState: isAnimate
            //       ? CrossFadeState.showFirst
            //       : CrossFadeState.showSecond,
            //   duration: const Duration(seconds: 1),
            // ),
            // AnimatedDefaultTextStyle(
            //   duration: Duration(milliseconds: 300),
            //   style: isAnimate
            //       ? TextStyle(fontSize: 30, color: Colors.black)
            //       : TextStyle(fontSize: 15, color: Colors.black),
            //   child: Container(
            //     color: Colors.yellow,
            //     width: 100,
            //     height: 100,
            //     child: Text("Hello"),
            //   ),
            // ),
            // Expanded(
            //   child: AnimatedFractionallySizedBox(
            //     duration: const Duration(seconds: 1),
            //     widthFactor: isAnimate ? 0.5 : 0.2,
            //     heightFactor: isAnimate ? 0.5 : 0.2,
            //     child: Container(
            //       color: Colors.yellow,
            //       width: 100,
            //       height: 100,
            //     ),
            //   ),
            // ),
            // AnimatedIcon(icon: AnimatedIcons.home_menu, progress: _controller),
            SizedBox(
              height: 400,
              child: AnimatedModalBarrier(
                color: Tween<Color>(begin: Colors.black, end: Colors.blue)
                    .animate(_controller),
              ),
            ),
            // For Spacing
            const SizedBox(
              height: 10,
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAnimate = !isAnimate;
                });
                // setState(() {});
                if (_controller.isCompleted) {
                  _controller.reverse(); // Reverse the animation
                } else {
                  _controller.forward(); // Play the animation forward
                }
              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
