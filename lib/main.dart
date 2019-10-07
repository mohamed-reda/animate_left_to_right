import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      title: 'Material Page Reveal',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
//  int _counter = 0;
  Animation a;
  bool b = true;
  AnimationController ac;

//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
  _incrementCounter() {
    setState(() {
//      ac.
//      a = Tween(begin: -1.0, end: 0.0)
//          .animate(CurvedAnimation(parent: ac, curve: Curves.fastOutSlowIn));
      if (b) {
        ac.reverse();
        b = false;
      } else {
        b = true;
        ac.forward();
      }
    });

//    a = Tween(begin: 0.0, end: -1.0)
//        .animate(CurvedAnimation(parent: ac, curve: Curves.fastOutSlowIn));
  }

  @override
  void initState() {
    super.initState();
    ac = AnimationController(duration: Duration(seconds: 3), vsync: this);
    a = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: ac, curve: Curves.fastOutSlowIn));
    //start the animation
    ac.forward();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: ac,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hello Animation'),
          ),
          body: Transform(
            transform: Matrix4.translationValues(a.value * width, 0.0, 0.0),
            child: Container(
              child: Center(
                child: Text(
                  'You have pushed the button this many times:',
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
