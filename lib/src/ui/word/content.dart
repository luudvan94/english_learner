import 'package:flutter/material.dart';
import '../../common/appearance.dart';
import '../../models/word.dart';
import '../../models/definition.dart';
import 'package:flutter/scheduler.dart';
import '../../common/element_style.dart';

enum Direction {
  nextPage,
  previousPage,
  nextWord,
  previousWord,
  none
}

class WordContent extends StatefulWidget {


  WordContent({this.word, this.colorSet, this.nextWord, this.previousWord, this.playSound});

  final Word word;
  final ColorSet colorSet;

  final VoidCallback nextWord;
  final VoidCallback previousWord;
  VoidCallback playSound;

  @override
  State<StatefulWidget> createState() {
    return _WordContentState();
  }
}

class _WordContentState extends State<WordContent> with TickerProviderStateMixin {

  // _WordContentState(): currentPage = 0, numberOfPage = widget.word.definitions.length + 1;

  Offset controlPoint;
  Offset prevPoint;
  Offset startPoint;
  bool dragFromRight;

  int currentPage;
  int numberOfPage;

  //ANIMATION
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation _curve;

  // PAGE VIEW
  PageController _pageController;


  @override
  void initState() {
    super.initState();
    controlPoint = Offset(0, 0);
    dragFromRight = false;

    _pageController =PageController(initialPage: 0, keepPage: false);

     currentPage = 0;
     numberOfPage = widget.word.definitions.length + 1;
  }

  Direction shouldChange(Offset startPoint, Offset currentPoint) {
    double alPhaX =currentPoint.dx - startPoint.dx;
    double alPhaY =currentPoint.dy - startPoint.dy;

    if (alPhaX.abs() > alPhaY.abs()*2) {
      
      if (this.dragFromRight) {
      
        if (startPoint.dx < controlPoint.dx) {
          return Direction.none;
        }

        return alPhaX.abs() >= MediaQuery.of(context).size.width/5 ? Direction.nextWord :Direction.none;
      } else {

        if (startPoint.dx > controlPoint.dx) {
          return Direction.none;
        }
        
        return currentPoint.dx >= MediaQuery.of(context).size.width/5 ? Direction.previousWord :Direction.none;
      }
    }
    
    if (alPhaY < 0 && alPhaY.abs() > MediaQuery.of(context).size.height/10) {
      return Direction.nextPage;
    } else if (alPhaY > 0 && alPhaY.abs() > MediaQuery.of(context).size.height/10) {
      return Direction.previousPage;
    }

    return Direction.none;

  }

  void _handleDragStart(DragStartDetails details) {
    // debugPrint("drag start");
    // timerCount = 1;
    double width = MediaQuery.of(context).size.width;
    startPoint =details.globalPosition;
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
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

  void _handleDragUpdate(DragUpdateDetails details) {
    // debugPrint("drag update");

    double dxOffset = details.globalPosition.dx - prevPoint.dx;

      setState(() {
        prevPoint = details.globalPosition;
        controlPoint = Offset(controlPoint.dx + dxOffset, details.globalPosition.dy);
      });
    // }
    

  }

  void _handleDragEnd(DragEndDetails details) {
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

    Direction rs =shouldChange(startPoint, controlPoint);
    _handleChange(rs);
  }

  _handleChange(Direction direction) {
    switch (direction) {

      case Direction.nextWord:
      // print("next word");
      _pageController.jumpTo(0);
      widget.nextWord();
      return;

      case Direction.previousWord:
      // print("previous word");
      _pageController.jumpTo(0);
      widget.previousWord();
      return;

      default:
      return;
    }
  }

  void _handleLongPress(LongPressStartDetails details) {
    widget.playSound();
  }
  Container firstPageView(Word word) {

    content() {

      List<Widget> contentWidgets = [];
    
      contentWidgets.add(ElementStyle.definition(word.definitions[0].definition, false));

      if (word.imageLink ==null) {
        return 
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contentWidgets
              ),
            );
      } else {
        return 
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: contentWidgets
                    ),
                  ),
                ],
              )
            );
      }
    }

    return 
    Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child:FittedBox(
                  child: ElementStyle.word(word.name),
                  fit: BoxFit.scaleDown,
                )
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                alignment: Alignment.topCenter,
                child: ElementStyle.pronounce(word.pronounce),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 0,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: ElementStyle.type_word("*" + word.typeWord + "*"),
              ),
            ),
            SizedBox(height: 10),
            content()
            
          ],
        ),
    );
        
  }

  Container nextPageView(Definition defi, Word word) {
    List<Widget> contentWidgets = [];

    contentWidgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ElementStyle.smallWord(word.name),
          ElementStyle.smallTypeWord("*" + word.typeWord + "*")
        ],
      ));
  
  if (defi.definition.trim() != "") {
    contentWidgets.add(ElementStyle.definition(defi.definition, true));
  }
  
  List<Widget> examples = [];

  int exampleCount = 0;
   defi.examples.forEach((e) {

     if (exampleCount > 3) {
       return;
     }

      examples.add(SizedBox(height: 5.0));
      examples.add(ElementStyle.example(e.example, word.name));

      exampleCount += 1;
    });

    contentWidgets.add(new SizedBox(child: new Column(children:examples),));
    return Container(
      child: Container(
        // alignment: Alignment(1.0, 0.0),
        padding: MediaQuery.of(context).padding,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentWidgets,
      ),
      )
      
    );
  }

  List<Widget> listPages() {
    List<Widget> listPages = [];

    var word =widget.word;
    listPages.add(firstPageView(word));

    word.definitions.forEach((def) {
      listPages.add(nextPageView(def, word));
    });


    return listPages;
  }
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPressStart: this._handleLongPress,
      // onLongPressDragStart: this._handleLongPress,
      onPanStart: this._handleDragStart,
      onPanUpdate: this._handleDragUpdate,
      onPanEnd: this._handleDragEnd,
      child: ClipPath(
        child: Container(
          padding: MediaQuery.of(context).padding,
          color: widget.colorSet.background,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
            child:Column(
              children: <Widget>[
                Container(
                height: MediaQuery.of(context).padding.top * 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    ElementStyle.page((currentPage + 1).toString(), (widget.word.definitions.length + 1).toString())
                  ],
                ),
                ),
                Expanded(
                  flex: 1,
                  child:  PageView(
                    onPageChanged: (currentPage) {
                      setState(() {
                        this.currentPage =currentPage;
                      });
                    },
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: listPages(),
                  ),
                )
              ],
            )
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