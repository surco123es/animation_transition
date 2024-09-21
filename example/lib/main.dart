// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:animation_transition/animation_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation transition',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

int tokenI = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ListView(
        children: [
          for (TransitionType t in TransitionType.values)
            TextButton(
                onPressed: () {
                  transitionAnimation.transitionPageRoute(
                    pageGo: AnimationData(
                      child: PageAnimation(
                        name: t.name,
                        type: t,
                      ),
                      //
                      transition: TransitionType.ZoomIn,
                      duration: Duration(milliseconds: 200),
                      onStart: (token) {
                        tokenI = token;
                      },
                    ),
                    context: context,
                  );
                },
                child: Text(t.name)),

          //muestra todas las transiciones
          TextButton(
              onPressed: () {
                transitionAnimation.transitionPageRoute(
                  pageGo: AnimationData(
                    child: AllTransicion(),
                    //
                    transition: TransitionType.ZoomIn,
                    duration: Duration(milliseconds: 200),
                    onStart: (token) {
                      tokenI = token;
                    },
                  ),
                  context: context,
                );
              },
              child: const Text(
                'All Transicion',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class AllTransicion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                transitionAnimation.backPage(token: tokenI, context: context);
              },
              child: const Text('Atras'))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (TransitionType t in TransitionType.values)
              transitionAnimation.start(
                data: AnimationData(
                  type: TypeTransition.repeat,
                  transition: t,
                  duration: const Duration(milliseconds: 1000),
                  child: Content(
                    name: t.name,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class PageAnimation extends StatelessWidget {
  String name;
  TransitionType type;
  PageAnimation({
    super.key,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                transitionAnimation.backPage(token: tokenI, context: context);
              },
              child: const Text('Atras'))
        ],
      ),
      body: Center(
        child: transitionAnimation.start(
          data: AnimationData(
            type: TypeTransition.repeat,
            transition: type,
            duration: const Duration(milliseconds: 1000),
            child: Content(
              name: name,
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  String name;
  Content({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.amber,
      height: 250,
      width: 250,
      child: Column(
        children: [
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
