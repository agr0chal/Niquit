import 'package:flutter/material.dart';
import 'package:niquit/CigChart.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(fontFamily: 'Montserrat'),
        child: Padding(
          padding: const EdgeInsets.only(top:24,left:24,right:24),
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Charts',
                  style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
              const SizedBox(height: 16),
              SimpleTimeSeriesChart.withData(),
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
                      style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.brightness_1,
                    color: Colors.red,
                    size: 16,
                  ),
                  const SizedBox(width: 3),
                  Text('Cigarettes',
                      style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')),
                ],
              ),
              const SizedBox(height: 20),
              Text('Savings',
                  style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
              const SizedBox(height: 3),
              Text('131.57 PLN',
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
                        border: Border.all(width:2),

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
