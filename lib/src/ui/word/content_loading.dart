import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/appearance.dart';
import '../../common/element_style.dart';

class ContentLoading extends StatelessWidget {

  Color base =Color.fromRGBO(0, 25, 33, 1);
  Color highlight =Color.fromRGBO(0, 43, 54, 1);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: MediaQuery.of(context).padding,
        color: Appearance.currentSet.background,
        child: Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).padding.top * 2,
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Shimmer.fromColors(
                      baseColor: base,
                      highlightColor: highlight,
                      child: Container(
                        decoration:new BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 80.0,
                        height: 20.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Shimmer.fromColors(
                      baseColor: base,
                      highlightColor: highlight,
                      child: Container(
                            decoration:new BoxDecoration(
                              borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                              color: Colors.white 
                            ),
                            // color: Colors.white,
                            width: 150.0,
                            height: 50.0,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Shimmer.fromColors(
                      baseColor: base,
                      highlightColor: highlight,
                      child: Container(
                        decoration:new BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 80.0,
                        height: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  flex: 0,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      child: Shimmer.fromColors(
                        baseColor: base,
                        highlightColor: highlight,
                        child: Container(
                          decoration:new BoxDecoration(
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: highlight 
                          ),
                          // color: Colors.white,
                          width: 60.0,
                          height: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Shimmer.fromColors(
                          baseColor: base,
                          highlightColor: highlight,
                          child: Container(
                                decoration:new BoxDecoration(
                                  borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                                  color: Colors.white 
                                ),
                                // color: Colors.white,
                                // width: 100.0,
                                height: 25.0,
                              ),
                        ),
                      ),
                      SizedBox(width: 0, height: 5),
                      Container(
                        child: Shimmer.fromColors(
                          baseColor: base,
                          highlightColor: highlight,
                          child: Container(
                                decoration:new BoxDecoration(
                                  borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                                  color: Colors.white 
                                ),
                                // color: Colors.white,
                                // width: 100.0,
                                height: 25.0,
                              ),
                        ),
                      ),
                      SizedBox(width: 0, height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                          child: Shimmer.fromColors(
                            baseColor: base,
                            highlightColor: highlight,
                            child: Container(
                                  decoration:new BoxDecoration(
                                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                    color: highlight 
                                  ),
                                  height: 15.0,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0, height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                          child: Shimmer.fromColors(
                            baseColor: base,
                            highlightColor: highlight,
                            child: Container(
                                  decoration:new BoxDecoration(
                                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                    color: highlight 
                                  ),
                                  height: 15.0,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0, height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                          child: Shimmer.fromColors(
                            baseColor: base,
                            highlightColor: highlight,
                            child: Container(
                                  decoration:new BoxDecoration(
                                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                    color: highlight 
                                  ),
                                  height: 15.0,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0, height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                          child: Shimmer.fromColors(
                            baseColor: base,
                            highlightColor: highlight,
                            child: Container(
                                  decoration:new BoxDecoration(
                                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                    color: highlight 
                                  ),
                                  height: 15.0,
                                ),
                          ),
                        ),
                      )
                      
                    ],
                  ),
                )
              ],
            ),
            )
      );
  }
}