// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'dialogModel.dart';
import 'require.dart';
import 'transition/attention_seekers.dart';
import 'transition/bounces.dart';
import 'transition/elastics.dart';
import 'transition/fades.dart';
import 'transition/flips.dart';
import 'transition/slides.dart';
import 'transition/specials.dart';
import 'transition/zooms.dart';

class TransitionPage extends StatefulWidget {
  AnimationData data;
  TransitionPage({super.key, required this.data});

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  Widget wdAnimated = Text('');
  bool load = false;

  void addController(AnimationController p0) {
    transitionAnimation.addController(token: widget.data.token, controller: p0);
    widget.data.onStart(widget.data.token);
    p0.addStatusListener(
      (status) {
        if (status.isCompleted &&
            widget.data.type == TypeTransition.repeat &&
            !widget.data.forPage) {
          transitionAnimation.reverse(token: widget.data.token);
        }
        if (widget.data.forPage && status.isDismissed) {
          transitionAnimation.clearToken(token: widget.data.token);
        }
      },
    );
    if (widget.data.type == TypeTransition.repeat) {
      p0.repeat();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        wdAnimated = switch (widget.data.transition) {
          TransitionType.FadeIn => FadeIn(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInDown => FadeInDown(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInDownBig => FadeInDownBig(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInUp => FadeInUp(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInUpBig => FadeInUpBig(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInLeft => FadeInLeft(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInLeftBig => FadeInLeftBig(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInRight => FadeInRight(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FadeInRightBig => FadeInRightBig(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.BounceInDown => BounceInDown(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.BounceInUp => BounceInUp(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.BounceInLeft => BounceInLeft(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.BounceInRight => BounceInRight(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ElasticIn => ElasticIn(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ElasticInDown => ElasticInDown(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ElasticInUp => ElasticInUp(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ElasticInLeft => ElasticInLeft(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ElasticInRight => ElasticInRight(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.SlideInDown => SlideInDown(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.SlideInUp => SlideInUp(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.SlideInLeft => SlideInLeft(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.SlideInRight => SlideInRight(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FlipInX => FlipInX(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.FlipInY => FlipInY(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ZoomIn => ZoomIn(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.JelloIn => JelloIn(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Bounce => Bounce(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Dance => Dance(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Flash => Flash(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Pulse => Pulse(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Roulette => Roulette(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ShakeX => ShakeX(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.ShakeY => ShakeY(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Spin => Spin(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.SpinPerfect => SpinPerfect(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
          TransitionType.Swing => Swing(
              duration: widget.data.duration,
              delay: widget.data.onDelay,
              controller: (p0) {
                addController(p0);
              },
              child: widget.data.child,
            ),
        };
        setState(() {
          load = true;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.data.forPage
        ? wdAnimated
        : MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              widget.data.mouseEnter(widget.data.token);
            },
            onExit: (_) {
              widget.data.mouseExit(widget.data.token);
            },
            child: GestureDetector(
              child: wdAnimated,
              onTap: () {
                widget.data.onClick(widget.data.token);
              },
            ),
          );
  }
}
