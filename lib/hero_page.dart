import 'package:flutter/material.dart';

import 'main.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
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
                      // Navigator.of(context).pop();
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
      ),
    );
  }
}
