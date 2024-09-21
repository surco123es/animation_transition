// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

typedef TokenGetAnimation = void Function(int token);

enum TransitionType {
  FadeIn,
  FadeInDown,
  FadeInDownBig,
  FadeInUp,
  FadeInUpBig,
  FadeInLeft,
  FadeInLeftBig,
  FadeInRight,
  FadeInRightBig,
  BounceInDown,
  BounceInUp,
  BounceInLeft,
  BounceInRight,
  ElasticIn,
  ElasticInDown,
  ElasticInUp,
  ElasticInLeft,
  ElasticInRight,
  SlideInDown,
  SlideInUp,
  SlideInLeft,
  SlideInRight,
  FlipInX,
  FlipInY,
  ZoomIn,
  JelloIn,
  Bounce,
  Dance,
  Flash,
  Pulse,
  Roulette,
  ShakeX,
  ShakeY,
  Spin,
  SpinPerfect,
  Swing,
}

enum Status {
  start,
  show,
  finish,
  reverse,
}

enum TypeTransition {
  repeat,
  line,
}

_null(int tk) {}

class AnimationData {
  Duration duration, onDelay;
  TokenGetAnimation onStart, mouseEnter, mouseExit, onClick;
  TransitionType transition;
  int token;
  Widget child;
  TypeTransition type;
  bool forPage;
  AnimationData({
    this.duration = const Duration(milliseconds: 1000),
    this.onDelay = const Duration(milliseconds: 200),
    this.onStart = _null,
    this.mouseEnter = _null,
    this.mouseExit = _null,
    this.onClick = _null,
    this.token = 0,
    this.transition = TransitionType.FadeIn,
    this.type = TypeTransition.line,
    this.forPage = false,
    required this.child,
  });
}
