import 'dart:async';

import 'package:flutter/material.dart';

import 'main.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 300), setOpacity);
  }

  void setOpacity(){
    setState(() {
      _opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'image',
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/architecture.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200]
                      ),
                      // child: Icon(Icons.close, size: 25, color: Colors.grey[600],),
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 550),
                                pageBuilder: (_, __, ___) => MyHomePage()),
                          );
                        },
                        icon: Icon(Icons.close, size: 30, color: Colors.grey[600],),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(milliseconds: 300),
                child: Text('シュパイヒャーシュタット（英語版） (Speicherstadt)はエルベ川の中洲に、19世紀以降発達した倉庫の建ち並ぶ地区である。自由港に形成された倉庫群で、19世紀末の時点では倉庫街として世界最大規模だった。その延べ床面積30万平方メートルは、まとまった倉庫群の規模としては、現代においても世界最大級である。')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
