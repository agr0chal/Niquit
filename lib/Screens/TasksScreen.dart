import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
                height: 70,
                width: double.infinity,
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 1.0)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 70,
                width: double.infinity,
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 1.0)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 70,
                width: double.infinity,
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color(0xffe2e2e2),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.0,
                      offset: Offset(0.0, 1.0)
                    ),
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