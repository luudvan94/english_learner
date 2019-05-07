import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/appearance.dart';
import '../../common/element_style.dart';

class TopicLoading extends StatelessWidget {

  Color base =Appearance.set2.background;
  Color highlight =Appearance.set1.background;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: MediaQuery.of(context).padding,
        color: Appearance.set1.background,
        child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, i) {
            if (i == 0) {
              return  Container(
              alignment: Alignment(0.0, 0.0),
              child: ElementStyle.topicListTitle()
            );
            }
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 0, height: 20.0),
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
                        width: 100.0,
                        height: 30.0,
                      ),
                ),
              ),
              SizedBox(width: 0, height: 10),
              Container(
                child: Shimmer.fromColors(
                  baseColor: base,
                  highlightColor: highlight,
                  child: Container(
                        decoration:new BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 300.0,
                        height: 15.0,
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
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 300.0,
                        height: 15.0,
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
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 300.0,
                        height: 15.0,
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
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          color: highlight 
                        ),
                        // color: Colors.white,
                        width: 200.0,
                        height: 15.0,
                      ),
                ),
              ),
              SizedBox(width: 0, height: 25),
                ],
              ),
              );

            },
            itemCount: 5,
        )
      );
  }
}