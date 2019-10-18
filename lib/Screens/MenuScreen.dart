import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(fontFamily: 'Montserrat'),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 48),
            // INKWELL DO KLIKNIEC (MOZE) 
            Container(
              decoration: firstBoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('About project',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat')),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: myBoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Authors',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat')),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: myBoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Donate',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat')),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              decoration: firstBoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Settings',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat')),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff5a5a5a),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: myBoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Clear data',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat',color: Colors.red,)),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.red,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Color(0xfffbfbfb),
      border: Border(
        bottom: BorderSide(
          color: Color(0xff5a5a5a),
          width: 0.9,
        ),
      ),
    );
  }

  BoxDecoration firstBoxDecoration() {
    return BoxDecoration(
      color: Color(0xfffbfbfb),
      border: Border(
        bottom: BorderSide(
          color: Color(0xff5a5a5a),
          width: 0.9,
        ),
        top: BorderSide(
          color: Color(0xff5a5a5a),
          width: 0.9,
        ),
      ),
    );
  }
}
