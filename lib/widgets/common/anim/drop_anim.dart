import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class DropAnimation extends StatelessWidget {
  final double? delay;
  final Object? begin;
  final Widget child;

  const DropAnimation({Key? key, this.delay,this.begin, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0, end: 1),
          const Duration(milliseconds: 500))
      ..add(AniProps.translateY, Tween(begin: begin ?? -30, end: 1),
          const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: delay != null ? Duration(milliseconds: (50 * delay!).round()) : const Duration(seconds: 2),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity).toDouble(),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY).toDouble()),
            child: child),
      ),
    );
  }
}
