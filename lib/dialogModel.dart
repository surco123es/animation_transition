// ignore_for_file: constant_identifier_names, camel_case_types, unused_element, library_private_types_in_public_api
import 'dart:math';

import 'package:animation_transition/require.dart';
import 'package:animation_transition/transition.dart';
import 'package:flutter/material.dart';

class _Animation {
  AnimationController? animation;
  TypeTransition type;
  Status status;
  bool transition, forPage;
  _Animation({
    this.animation,
    this.transition = false,
    required this.forPage,
    this.status = Status.start,
    this.type = TypeTransition.line,
  });
}

class PageController {
  bool active;
  OverlayEntry page;
  PageController({
    required this.active,
    required this.page,
  });
}

class _controllerGoALert {
  final Map<int, _Animation> _controll = {};
  final Map<int, PageController> _pageControll = {};
  int token() {
    Random random = Random();
    int max = 9999999;
    int min = 1000000;
    int token = min + random.nextInt((max + 1) - 1);
    return token;
  }

  addController({required int token, required AnimationController controller}) {
    _controll[token]!.animation = controller;
  }

  Future<bool> reverse({
    required int token,
  }) async {
    if (!_controll[token]!.transition) {
      _controll[token]!.transition = true;
      _controll[token]!.status = _controll[token]!.status == Status.reverse
          ? Status.start
          : Status.reverse;
      if (_controll[token]!.status == Status.start) {
        await _controll[token]!.animation?.forward();
      } else {
        await _controll[token]!.animation?.reverse();
      }
      _controll[token]!.transition = false;
      if (_controll[token]!.type == TypeTransition.repeat) {
        reverse(token: token);
      } else {
        if (_controll[token]!.status == Status.reverse) {
          reverse(token: token);
        }
      }
      return true;
    } else {
      return false;
    }
  }

  repeat({
    required int token,
    required TypeTransition type,
  }) {
    if (_controll[token]!.type != type) {
      _controll[token]!.type = type;
    }
    if (type == TypeTransition.repeat) {
      reverse(token: token);
    }
  }

  Future<bool> close({required int token}) async {
    if (_controll.containsKey(token)) {
      if (!_controll[token]!.forPage) {
        await reverse(token: token);
      }
      _controll[token]!.animation!.dispose();
      _controll.remove(token);
      return true;
    } else {
      return false;
    }
  }

  Widget start({required AnimationData data}) {
    if (data.token == 0) {
      data.token = token();
    }
    _controll.addAll({
      data.token: _Animation(
        type: data.type,
        forPage: data.forPage,
      )
    });
    return TransitionPage(data: data);
  }

  transitionPageRoute({
    required AnimationData pageGo,
    required BuildContext context,
  }) {
    if (pageGo.token == 0) {
      pageGo.token = token();
    }
    pageGo.forPage = true;
    _pageControll.addAll({
      pageGo.token: PageController(
        active: true,
        page: OverlayEntry(
          builder: (context) {
            return Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: start(
                data: pageGo,
              ),
            );
          },
        ),
      )
    });
    Overlay.of(context).insert(_pageControll[pageGo.token]!.page);
  }

  backPage({required int token, required BuildContext context}) async {
    if (_controll[token]!.forPage) {
      await _controll[token]!.animation?.reverse();
    }
  }

  clearToken({required int token}) {
    _pageControll[token]!.page.remove();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        _controll.remove(token);
        _pageControll.remove(token);
      },
    );
  }
}

_controllerGoALert transitionAnimation = _controllerGoALert();
