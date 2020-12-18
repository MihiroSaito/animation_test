import 'package:animation_test/hero_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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


  //=====アニメーションアイコン=====================================

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

  //===================================================

  double _height = 20;

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

  double _opacity = 1;

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: animateIcons()
              ),
              AnimatedContainer(
                height: _height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                duration: Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
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
              ),
              SizedBox(height: 20,),
              Text('Click me ↓'),
              SizedBox(height: 10,),
              GestureDetector(
                child: Hero(
                  tag: 'image',
                  child: Stack(
                    overflow: Overflow.clip,
                    children: [
                      Positioned(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage('images/architecture.jpg'),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => HeroPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'a',
            child: Text('折メ'),
            onPressed: _onTap
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: 'b',
            child: Text('薄'),
            onPressed: _onTap2
          ),
        ],
      ),
    );
  }

  Widget animateIcons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          iconSize: 50,
          icon: Icon(isPlaying ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          onPressed: () {
            _onTap();
            _handleOnPressed();
          },
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.add_event,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.event_add,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.list_view,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.view_list,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
        IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.search_ellipsis,
            progress: _animationController,
          ),
          onPressed: () => _handleOnPressed(),
        ),
      ],
    );
  }
}