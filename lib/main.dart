import 'package:flutter/material.dart';
import 'dart:developer';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  Offset controlPoint;
  Offset prevPoint;
  bool dragFromRight;

  //ANIMATION
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation _curve;

  @override
  void initState() {
    super.initState();
    controlPoint = Offset(0, 0);
    dragFromRight = true;
  }

  void _handleDragStart(ForcePressDetails details) {
    debugPrint("drag start");
    double width = MediaQuery.of(context).size.width;
    double dx = details.globalPosition.dx;
    if (dx < width/2) {
      setState(() {
        prevPoint = details.globalPosition;
        controlPoint = Offset(0, details.globalPosition.dy);
        dragFromRight = false;
      });
    } else {
      setState(() {
        prevPoint = details.globalPosition;
        controlPoint = Offset(width, details.globalPosition.dy);
        dragFromRight = true;
      });
    }
  }

  void _handleDragUpdate(ForcePressDetails details) {
    debugPrint("drag update");
    double dxOffset = details.globalPosition.dx - prevPoint.dx;
    setState(() {
      prevPoint = details.globalPosition;
      controlPoint = Offset(controlPoint.dx + dxOffset, details.globalPosition.dy);
    });
  }

  void _handleDragEnd(ForcePressDetails details) {
    debugPrint("drag end");
    Offset endPoint;
    Size size = MediaQuery.of(context).size;
    if (dragFromRight) {
      endPoint = Offset(size.width, size.height/2);
    } else {
      endPoint = Offset(0, size.height/2);
    }
    _controller = AnimationController(
        duration: const Duration(milliseconds: 380), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _animation = Tween<Offset>(
      begin: controlPoint,
      end: endPoint,
    ).animate(_curve);

    _animation.addListener(() {
      setState(() {
        controlPoint = _animation.value;
      });
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onForcePressStart: this._handleDragStart,
      onForcePressUpdate: this._handleDragUpdate,
      onForcePressEnd: this._handleDragEnd,
      child: CustomPaint(
        painter: CustomBackground(controlPoint: controlPoint, fromRight: dragFromRight),
      ),
    );
  }
}

class CustomBackground extends CustomPainter {

  CustomBackground({Key key, this.controlPoint = const Offset(0, 0), this.fromRight = true});

  Offset controlPoint;
  bool fromRight;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    var path = new Path();
    Offset startPoint;
    Offset endPoint;
    if (fromRight) {
      startPoint = Offset(size.width, 0);
      endPoint = Offset(size.width, size.height);

    } else {
      startPoint = Offset(0, 0);
      endPoint = Offset(0, size.height);
    }

    var firstControlPoint = Offset(controlPoint.dx, controlPoint.dy - 20);
    var secondControlPoint = Offset(controlPoint.dx, controlPoint.dy - 20);
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(firstControlPoint.dx, firstControlPoint.dy, secondControlPoint.dx, secondControlPoint.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
    canvas.drawColor(Colors.blueAccent, BlendMode.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
