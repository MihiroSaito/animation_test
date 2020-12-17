import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  double _height = 20;
  double _opacity = 1;

  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  void _onTap() {
    if(_height == 200){
      setState(() {
        _height = 20;
      });
    } else {
      setState(() {
        _height = 200;
      });
    }
  }

  void _onTap2() {
    if(_opacity == 1){
      setState(() {
        _opacity = 0.1;
      });
    } else {
      setState(() {
        _opacity = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AnimatedContainer(
                height: _height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                child: Stack(
                  overflow: Overflow.clip,
                  children: [
                    Positioned(
                      top: 0,
                      child: Column(
                        children: [
                          Text('折りたたみメニュー', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                          Text("aaaaaaaaaaaaaaa"),
                          Text("bbbbbbbbbbbbbbb"),
                          Text("ccccccccccccccc"),
                          Text("aaaaaaaaaaaaaaa"),
                          Text("bbbbbbbbbbbbbbb"),
                          Text("ccccccccccccccc"),
                          Text("aaaaaaaaaaaaaaa"),
                          Text("bbbbbbbbbbbbbbb"),
                          Text("ccccccccccccccc"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(milliseconds: 500),
                child: Container(
                  color: Colors.blueAccent,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () => _handleOnPressed(),
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                    ),
                    onPressed: () => _handleOnPressed(),
                  ),
                ],
              ),
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  title: Text('横にスライドして'),
                  subtitle: Text('サブタイトル'),
                ),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () => print('Archive'),
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => print('Share'),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => print('More'),
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => print('Delete'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Text('折メ'),
            onPressed: _onTap
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            child: Text('薄'),
            onPressed: _onTap2
          ),
        ],
      ),
    );
  }
}
