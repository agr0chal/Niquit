import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:niquit/data/Tasks.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    _countCigsLoad();
  }

  _countCigsLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('count_cigs') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(fontFamily: 'Montserrat'),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Active tasks',
                  style: TextStyle(fontSize: 24, fontFamily: 'Montserrat')),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: double.infinity,
                child: Center(
                  child: Text(
                    tasks[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1.0,
                        offset: Offset(0.0, 1.0)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: double.infinity,
                child: Center(
                  child: Text(
                    tasks[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1.0,
                        offset: Offset(0.0, 1.0)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: double.infinity,
                child: Center(
                  child: Text(
                    tasks[2],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1.0,
                        offset: Offset(0.0, 1.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
