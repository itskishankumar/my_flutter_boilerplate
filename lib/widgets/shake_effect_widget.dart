import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import '../utils/number_utils.dart';

class ShakeEffectWidget extends StatelessWidget {
  final Widget child;

  const ShakeEffectWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      key: key,
      duration: Duration(milliseconds: getRandomNumber(2700, 3000)),
      shakeConstant: CustomShakeDefaultConstant(),
      autoPlay: true,
      child: child,
    );
  }
}

class CustomShakeDefaultConstant implements ShakeConstant {
  @override
  List<int> get interval => [2];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        .5,
        -0.5,
        .5,
        .5,
        0.5,
        -0.5,
        .5,
        .5,
        0.5,
        0.5,
        .5,
        -0.5,
        0.5,
        0.5,
        .5,
        0.5,
        0.5,
        -0.5,
        -0.5,
        0.5,
        .5,
        .5,
        0.5,
        -0.5,
        -0.5,
        -0.5,
        0.5,
        -0.5,
        .5,
        -0.5,
        -0.5,
        .5,
        .5,
        .5,
        .5,
        0.5,
        .5,
        0.5,
        .5,
        -0.5,
        -0.5,
        -0.5,
        0.5,
        0.5,
        0.5,
        -0.5,
        .5,
        0.5,
        -0.5,
        0
      ];

  @override
  List<Offset> get translate => const [
        Offset(.5, .5),
        Offset(.5, -.5),
        Offset(-.5, -.5),
        Offset(-.5, .5),
      ];

  @override
  Duration get duration => const Duration(milliseconds: 100);
}
