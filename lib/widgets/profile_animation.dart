
import 'package:flutter/material.dart';

import '../global/app_assets.dart';

class ProfileAnimation extends StatefulWidget {
  const ProfileAnimation({super.key});

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation> with TickerProviderStateMixin{
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
    ..repeat(reverse: true);

    _animation = Tween(begin: Offset(0,0.0), end: const Offset(0, 0.1)).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation,
    child: Image.asset(AppAssets.profile1,
      width: 400,
      height: 400,),
    );
  }
}