import 'package:flutter/material.dart';

class DailyChallengeHint extends StatefulWidget {
  final String hintMessage;

  const DailyChallengeHint({super.key, required this.hintMessage});

  @override
  State<DailyChallengeHint> createState() => _DailyChallengeHintState();
}

class _DailyChallengeHintState extends State<DailyChallengeHint>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Repeat the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                spreadRadius: 1.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.lightbulb_outline,
                color: Colors.white,
                size: 28.0,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  widget.hintMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
