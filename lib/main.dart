import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Niquit',
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Cairo'
            )
        ),
        backgroundColor: Color(0xff1ec8c8),
        centerTitle: true,
        elevation: 0,
      ),
      body: Theme(
          data: ThemeData(fontFamily: 'Montserrat'),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width/2.5,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff1ec8c8),
                child: Center(child: Image.asset('images/lungs4 1.png',height: MediaQuery.of(context).size.width/3.25,)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 4),
                height: MediaQuery.of(context).size.width/5,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Text('You have smoked:', style: TextStyle(fontFamily: 'Montserrat'))
                      ),
                      Container(
                          child: Text('$counter/7', style: TextStyle(fontSize: 30, fontFamily: 'Montserrat', fontWeight: FontWeight.bold))
                      ),
                      Container(
                          child: Text('cigarettes', style: TextStyle(fontFamily: 'Montserrat'))
                      )
                    ],
                  ),
                ),
              ),
              Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(10),
                      child:RaisedButton.icon(
                        onPressed: (){
                          setState(() {
                            counter++;
                          });
                        },
                        icon: Padding(padding: EdgeInsets.all(10),child: Icon(Icons.smoking_rooms, color: Color(0xffffffff),)),
                        label: Padding(padding: EdgeInsets.fromLTRB(0,10,10,10),child: Text('Now', style: TextStyle(fontSize: 20, color: Color(0xffffffff)))),
                        color: Color(0xffff2626),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton.icon(
                          onPressed: (){
                            setState(() {
                              counter++;
                            });
                          },
                          icon: Padding(padding: EdgeInsets.all(10),child: Icon(Icons.smoking_rooms, color: Color(0xffffffff),)),
                          label: Padding(padding: EdgeInsets.fromLTRB(0,10,10,10),child: Text('Earlier',style: TextStyle(fontSize: 20, color: Color(0xffffffff)))),
                          color: Color(0xffffb726),
                        )
                    )
                  ]
              ),
              //Container(
              //height: MediaQuery.of(context).size.width/8,
              //),
              Container(
                child: Center(
                  child: Text(
                      'Actual tasks',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat'
                      )
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0 ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width/6,
                    height: MediaQuery.of(context).size.height/5,
                    child: FlatButton(
                      onPressed: (){},
                      child: Image.asset('images/arrow.png'),
                      color: null,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                      color: Color(0xff1ec8c8),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/6,
                    height: MediaQuery.of(context).size.height/5,
                    child: FlatButton(
                      onPressed: (){},
                      child: Image.asset('images/arrow2.png'),
                      color: null,
                    ),
                  )
                ],
              )
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                title: Text('Stats')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_box),
                title: Text('Tasks')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text('Trophies')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze),
                title: Text('Menu')
            )
          ]
      ),
    );
  }
}
