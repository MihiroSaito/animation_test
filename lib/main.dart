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
                  child: Container(
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
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => HeroPage()),
                  );
                },
              ),
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
            child: Text('薄濃'),
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







// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// // リストを表示してるページ
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('リストページ'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           child: Card(
//             margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
//             elevation: 4.0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0)),
//             clipBehavior: Clip.antiAlias,
//             child: Stack(
//               children: <Widget>[
//                 Hero(
//                   tag: 'background' + list[0].id,
//                   child: Container(
//                     color: list[0].backgroundColor,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Hero(
//                         tag: 'image' + list[0].id,
//                         child: Image.network(list[0].imagePath,fit: BoxFit.fitWidth,height: 100,),
//                       ),
//                       Hero(
//                         tag: 'title' + list[0].id,
//                         child: Material(
//                           color: Colors.transparent,
//                           child: Text(
//                             list[0].title,
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Hero(
//                         tag: 'subtitle' + list[0].id,
//                         child: Material(
//                           color: Colors.transparent,
//                           child: Text(
//                             list[0].subtitle,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           onTap: (){
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //     fullscreenDialog: true,
//             //     builder: (BuildContext context) => DetailPage(
//             //       item: list[0],
//             //     ),
//             //   ),
//             // );
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                   transitionDuration: Duration(milliseconds: 5050),
//                   pageBuilder: (_, __, ___) => DetailPage(item: list[0],)),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // 詳細ページ
// class DetailPage extends StatelessWidget {
//   final ItemModel item;
//   DetailPage({this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white.withOpacity(0),
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         children: <Widget>[
//           Hero(
//             tag: 'background' + item.id,
//             child: Container(
//             ),
//           ),
//           Center(
//             child: Column(
//               children: <Widget>[
//                 Hero(
//                   tag: 'image' + item.id,
//                   child: Image.network(item.imagePath,fit: BoxFit.fitWidth,height: 300,),
//                 ),
//                 Text('アポロ計画（アポロけいかく、Apollo program）は、アメリカ航空宇宙局（NASA）による人類初の月への有人宇宙飛行計画である。1961年から1972年にかけて実施され、全6回の有人月面着陸に成功した。アポロ計画（特に月面着陸）は、人類が初めて有人宇宙船により地球以外の天体に到達した事業である。これは宇宙開発史において画期的な出来事であっただけではなく、人類史における科学技術の偉大な業績としてもしばしば引用される。')
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // リストに表示するデータ
// final list = [
//   ItemModel(
//     id: '1',
//     title: 'タイトル1',
//     subtitle: 'サブタイトル1',
//     imagePath: 'https://cdn.pixabay.com/photo/2017/05/16/21/24/gorilla-2318998_1280.jpg',
//     backgroundColor: Colors.amber,
//   ),
//   ItemModel(
//     id: '2',
//     title: 'タイトル2',
//     subtitle: 'サブタイトル2',
//     imagePath: 'https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg',
//     backgroundColor: Colors.cyan,
//   ),
//   ItemModel(
//     id: '3',
//     title: 'タイトル3',
//     subtitle: 'サブタイトル3',
//     imagePath: 'https://cdn.pixabay.com/photo/2015/03/26/09/54/pug-690566_1280.jpg',
//     backgroundColor: Colors.redAccent,
//   ),
// ];
//
// // リストに表示するデータモデル
// class ItemModel {
//   String id;
//   String title;
//   String subtitle;
//   String imagePath;
//   Color backgroundColor;
//
//   ItemModel({
//     this.id,
//     this.title,
//     this.subtitle,
//     this.imagePath,
//     this.backgroundColor,
//   });
// }