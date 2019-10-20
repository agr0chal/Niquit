import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:niquit/data/Tasks.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int counter = 0;
  int lungsNumber = 1;
  int taskIndex = 0;
  @override
  void initState() {
    super.initState();
    _CountCigsLoad();
  }
 
  _CountCigsLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('count_cigs') ?? 0);
      if (counter > 7) lungsNumber = 2;
      if (counter > 1.5 * 7) lungsNumber = 3;
    });
  }
 
  _CountCigsAdd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('count_cigs') ?? 0) + 1;
      if (counter > 7) lungsNumber = 2;
      if (counter > 1.5 * 7) lungsNumber = 3;
      prefs.setInt('count_cigs', counter);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: ThemeData(fontFamily: 'Montserrat'),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff1ec8c8),
                child: Center(
                    child: Image.asset(
                  'images/lungs$lungsNumber.png',
                  height: MediaQuery.of(context).size.width / 3.25,
                )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 4),
                height: MediaQuery.of(context).size.width / 5,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Text('You have smoked:',
                              style: TextStyle(fontFamily: 'Montserrat'))),
                      Container(
                          child: Text('$counter/7',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold))),
                      Container(
                          child: Text('cigarettes',
                              style: TextStyle(fontFamily: 'Montserrat')))
                    ],
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(10),
                      child: RaisedButton.icon(
                        onPressed: () {
                          _CountCigsAdd();
                        },
                        icon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.smoking_rooms,
                              color: Color(0xffffffff),
                            )),
                        label: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Text('Now',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffffffff)))),
                        color: Color(0xffff2626),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton.icon(
                          onPressed: () {
                            _CountCigsAdd();
                          },
                          icon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.smoking_rooms,
                                color: Color(0xffffffff),
                              )),
                          label: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              child: Text('Earlier',
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xffffffff)))),
                          color: Color(0xffffb726),
                        ))
                  ]),
              //Container(
              //height: MediaQuery.of(context).size.width/8,
              //),
              Container(
                child: Center(
                  child: Text('Actual tasks',
                      style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 5,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (taskIndex == 0)
                            taskIndex = 2;
                          else
                            taskIndex -= 1;
                        });
                      },
                      child: Image.asset('images/arrow.png'),
                      color: null,
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 2.8,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            tasks[taskIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        /* height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.width/1.5,*/
                        decoration: BoxDecoration(
                          color: Color(0xff1ec8c8),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 5,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (taskIndex == 2)
                            taskIndex = 0;
                          else
                            taskIndex += 1;
                        });
                      },
                      child: Image.asset('images/arrow2.png'),
                      color: null,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
