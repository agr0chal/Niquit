import 'package:flutter/material.dart';
import 'package:niquit/CigChart.dart';
import './../data/Database.dart';
import 'package:flutter/cupertino.dart';
import '../data/globals.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int counter = 0;
  int index = 0;
  int curdex = 0;
  List<int> cigsData = [-1,-1,-1,-1];
  List<int> cureData = [-1,-1,-1,-1,-1,-1,-1];
  int cigsAll;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    for (int i = 3; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));
      var amt = DBProvider.db.getAmt(date.year, date.month, date.day);
      amt.then((val) {
        setState(() {
          cigsData[index] = val;
          index++;
        });
      });
    }
  
    for (int i = 3; i >= -3; i--) {
      DateTime date = now.subtract(Duration(days: i));
      var amt = DBProvider.db.getSpecCure(date.year, date.month, date.day);
      amt.then((val) {
        setState(() {
          cureData[curdex] = val;
          curdex++;
        });
      });
    }

    var tmp=DBProvider.db.getAll();
    tmp.then((val){
      setState(() {
        cigsAll=val;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    double savings=0;
    if(diffDays>=5&&war!=null) savings=-1*(diffDays*war/5-cigsAll*1.50);
    if (cigsData[3] == -1||cureData[6] == -1) {
     // + czy jestesmy juz w kuracji
      return new Center(
          child: CupertinoActivityIndicator(animating: true, radius: 10));
    }
    return Scaffold(
      body: Theme(
        data: ThemeData(fontFamily: 'Montserrat'),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Charts',
                    style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
                const SizedBox(height: 16),
                SimpleTimeSeriesChart.withData(cigsData,cureData),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 5),
                    Icon(
                      Icons.brightness_1,
                      color: Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text('Curation',
                        style:
                            TextStyle(fontSize: 17, fontFamily: 'Montserrat')),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.brightness_1,
                      color: Colors.red,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text('Cigarettes',
                        style:
                            TextStyle(fontSize: 17, fontFamily: 'Montserrat')),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Savings',
                    style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
                const SizedBox(height: 3),
                Text('$savings',
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Montserrat',
                        color: Colors.green)),
                const SizedBox(height: 20),
                Text('Level',
                    style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
                const SizedBox(height: 10),
                /*Row(
              children: <Widget>[*/
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        width: 220,
                        height: 24.4,
                        top: 11,
                        left: 35,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 160,
                        height: 24.4,
                        top: 11,
                        left: 35,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xff1ec8c8),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(width: 2),
                        ),
                        child: Center(
                          child: Text('3',
                              style: TextStyle(
                                  fontSize: 32, fontFamily: 'Montserrat')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
