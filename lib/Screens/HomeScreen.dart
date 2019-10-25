import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:niquit/data/Tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './../data/CigModel.dart';
import './../data/Database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int lungsNumber = 1;
  int taskIndex = 0;
  Duration timeAgo;
  var _result;


  Duration initialtimer = new Duration();
  int selectitem = 1;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    var amt = DBProvider.db.getAmt(now.year, now.month, now.day);
    amt.then((val) {
      setState(() {
        _result = val;
      });
    });
  }

  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ACTION NOT ALLOWED",
      desc: "You can't add cigarettes smoked on the previous day",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  _onAlertButtonPressedNotChanged(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ACTION NOT ALLOWED",
      desc: "Please use the \"Now\" button to add cigarettes, which you have smoked less than 5 minutes ago",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  _countCigsAdd() async {
    setState(() {
      DateTime now = DateTime.now();
      Cigs cig = Cigs(
          id: 69,
          year: now.year,
          month: now.month,
          day: now.day,
          hour: now.hour,
          minute: now.minute);
      DBProvider.db.newCig(cig);
      _result += 1;
    });
  }

  _countCigsAddSpec(id, year, month, day, hour, minute) {
    setState(() {
      Cigs cig = Cigs(
          id: id,
          year: year,
          month: month,
          day: day,
          hour: hour,
          minute: minute);
      DBProvider.db.newCig(cig);
      _result += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool changed = false;
    if (_result == null) {
      return new Center(
          child: CupertinoActivityIndicator(animating: true, radius: 10));
    }
    if (_result > 7) lungsNumber = 2;
    if (_result > 1.5 * 7) lungsNumber = 3;
    return Scaffold(
      body: Theme(
          data: ThemeData(fontFamily: 'Montserrat'),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Image.asset(
                  'images/lungs$lungsNumber.png',
                  height: MediaQuery.of(context).size.width / 3.25,
                )),
                color: Color(0xff1ec8c8),
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
                          //child: UsingStreamBuilder()
                          child: Text('$_result/7',
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
                          _countCigsAdd();
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton.icon(
                          onPressed: () {
                            //_CountCigsAdd();
                            initialtimer = Duration(hours: 0, minutes: 0);
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext builder) {
                                  return SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        (36 / 17),
                                    width: double.infinity,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .copyWith()
                                                  .size
                                                  .height /
                                              9,
                                          child: Center(
                                            child: Text(
                                              "How long ago have you smoked?",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .copyWith()
                                                  .size
                                                  .height /
                                              4,
                                          child: CupertinoTimerPicker(
                                            mode: CupertinoTimerPickerMode.hm,
                                            minuteInterval: 5,
                                            initialTimerDuration: initialtimer,
                                            onTimerDurationChanged:
                                                (Duration changedtimer) {
                                              setState(() {
                                                initialtimer = changedtimer;
                                                timeAgo = changedtimer;
                                                changed=true;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .copyWith()
                                                  .size
                                                  .height /
                                              9,
                                          child: FlatButton(
                                            child: Icon(
                                              Icons.check,
                                              color: Color(0xffffffff),
                                            ),
                                            color: Colors.green,
                                            onPressed: () {
                                              DateTime now = DateTime.now();
                                              if (timeAgo != null) {
                                                int hourAgo =
                                                    now.hour - timeAgo.inHours;
                                                int minuteAgo = now.minute -
                                                    (timeAgo.inMinutes % 60);
                                                if((initialtimer.inHours==0&&initialtimer.inMinutes%60==0)||changed==false){
                                                  _onAlertButtonPressedNotChanged(context);
                                                } else if (hourAgo < 0 ||
                                                    (hourAgo == 0 &&
                                                        minuteAgo < 0)) {
                                                  _onAlertButtonPressed(
                                                      context);
                                                  changed=false;
                                                } else if (hourAgo > 0 &&
                                                    minuteAgo < 0) {
                                                  hourAgo -= 1;
                                                  minuteAgo = 60 + minuteAgo;
                                                  _countCigsAddSpec(
                                                      69,
                                                      now.year,
                                                      now.month,
                                                      now.day,
                                                      hourAgo,
                                                      minuteAgo);
                                                  changed=false;
                                                  Navigator.pop(context);
                                                } else {
                                                  _countCigsAddSpec(
                                                      69,
                                                      now.year,
                                                      now.month,
                                                      now.day,
                                                      hourAgo,
                                                      minuteAgo);
                                                  changed=false;
                                                  Navigator.pop(context);
                                                }
                                              }else{
                                                _onAlertButtonPressedNotChanged(context);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (taskIndex == 0)
                            taskIndex = 2;
                          else
                            taskIndex -= 1;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 50,
                        color: Color(0xff008585),
                      ),
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (taskIndex == 2)
                            taskIndex = 0;
                          else
                            taskIndex += 1;
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 50, color: Color(0xff008585)),
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