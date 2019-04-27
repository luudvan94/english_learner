import 'package:flutter/material.dart';
import '../../common/appearance.dart';
import '../../common/element_style.dart';
import '../../models/topic.dart';
import '../../blocs/topic_bloc.dart';
import '../word/word_screen.dart';
import 'topic_loading.dart';

class TopicScreen extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    return _TopicScreenState();
  }
}
class _TopicScreenState extends State<TopicScreen> with TickerProviderStateMixin {

  List<Topic> topicList;

  //ANIMATION
  AnimationController _controller;
  Animation<double> _animation;
  Animation _curve;

  @override
  void initState() {
    
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_curve);

    super.initState();
  }

  _handlerData(List<Topic> topicList) {
    this.topicList =topicList;

    // _controller.forward();

    // setState(() {
      
    // });
  }

  @override
  Widget build(BuildContext context) {
    topicBloc.fetchTopicList();
    return MaterialApp(
      home: StreamBuilder(
        stream: topicBloc.topicList,
        builder: (context, AsyncSnapshot<List<Topic>> snapshot) {

          if (snapshot.hasData) {
            this._handlerData(snapshot.data);


            return Container(
              padding: MediaQuery.of(context).padding,
              child: _buildListTopic(),
              // color: Colors.white,
            );
          }

          return TopicLoading();
        }
       )
    );
    
    
  }

  Widget _buildListTopic() {
    return Container(
      color: Appearance.currentSet.background,
      child: ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        if (i == 0) {

          return Container(
            alignment: Alignment(0.0, 0.0),
            child: ElementStyle.topicListTitle()
          );
        } 

        Topic topic =topicList[i - 1];
        Color color =topic.isDownloaded ? Appearance.currentSet.openButton :Appearance.currentSet.getButton;
        String title = topic.isDownloaded ? "open" :"get";
        Text textTitle = Text(title);
        return Container(
          padding: EdgeInsets.fromLTRB(10, 20, 5, 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElementStyle.topic(topic.name),
            ElementStyle.topicDescription(topic.description),
            RaisedButton(
              color: color,
              textColor: Appearance.currentSet.word,
              elevation: 0.0,
              onPressed: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => new WordScreen(topic: topic,)
                  )
                );
              },
              child: textTitle,
            ),
            
          ],
        )
        );
         
      },
      itemCount: topicList.length + 1,
    ),
    );
    
  }

  _handleTopicGet(Topic topic, BuildContext context) {
   
    // debugPrint(topic.name)
  }
}