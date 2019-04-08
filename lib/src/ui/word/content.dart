import 'package:flutter/material.dart';
import '../../common/appearance.dart';
import '../../common/element_style.dart';


class WordContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WordContentState();
  }
}

class _WordContentState extends State<WordContent> with TickerProviderStateMixin {

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
    dragFromRight = false;

    
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

  void _onTap() {
    debugPrint("tap");
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onForcePressStart: this._handleDragStart,
      onForcePressUpdate: this._handleDragUpdate,
      onForcePressEnd: this._handleDragEnd,
      child: ClipPath(
      child: Container(
        padding: MediaQuery.of(context).padding,
        color: Appearance.darkSet1.background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElementStyle.word("Apple"),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ElementStyle.pronounce('/k\u00e6mp\u0259s/'),
                ),
              ),
              // SizedBox(height: 10),
              // Expanded(
              //   flex: 3,
              //   child: Container(),
              // ),
              SizedBox(height: 10),
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    ElementStyle.definition("*apple is a kind of fruit, it is eatable"),
                    SizedBox(height: 5.0),
                    ElementStyle.example(" -->This is my apple, i just bought it from school.", "apple"),
                    SizedBox(height: 25.0),
                    ElementStyle.definition("*apple is a kind of fruit, it is eatable"),
                    SizedBox(height: 5.0),
                    ElementStyle.example(" -->This is my apple, i just bought it from school.", "apple"),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
      clipper: CustomBackground(controlPoint: controlPoint, fromRight: dragFromRight),
    ),
    );
     
  }
}

class CustomBackground extends CustomClipper<Path> {

  CustomBackground({Animation<Offset> animation, this.controlPoint = const Offset(0, 0), this.fromRight = false}) : animation = animation, super(reclip:animation);

  final Offset controlPoint;
  final bool fromRight;
  final Animation<Offset> animation;

  @override
  Path getClip(Size size) {
    var path = new Path();

    bool isControlPointChanged() {
      return this.controlPoint.dx != 0 && this.controlPoint.dy != 0;
    }

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    if (!isControlPointChanged()) {

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

    }

    var firstControlPoint = Offset(controlPoint.dx, controlPoint.dy - 20);
    var secondControlPoint = Offset(controlPoint.dx, controlPoint.dy + 20);

    if (this.fromRight && isControlPointChanged()) {
      
      
      path.cubicTo(firstControlPoint.dx, firstControlPoint.dy, secondControlPoint.dx, secondControlPoint.dy, size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else {

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.cubicTo(firstControlPoint.dx, firstControlPoint.dy, secondControlPoint.dx, secondControlPoint.dy, 0, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}