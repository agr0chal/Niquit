import 'package:flutter/material.dart';
import './Screens/HomeScreen.dart';
import './Screens/TasksScreen.dart';
import './Screens/MenuScreen.dart';
import './Screens/StatsScreen.dart';
import 'package:flutter/services.dart';
import 'data/Database.dart';
import 'data/CigModel.dart';
import 'data/globals.dart' as globals;
import 'data/Algorithm.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    Home(),
    Stats(),
    Tasks(),
    MenuScreen(),
  ];
  @override
  void initState() {
    super.initState();
    int _war;
    var all = DBProvider.db.getAll();
    all.then((val) {
      setState(() {
        _war = val;
      });
    });
 
    Cigs cig;
    var obj = DBProvider.db.getCig(1);
    obj.then((tmp) {
      setState(() {
        cig = tmp;
        String day = cig.day.toString();
        String month = cig.month.toString();
        String year = cig.year.toString();
        var parsedDate = DateTime.parse('$year-$month-$day');
        DateTime now = DateTime.now();
        DateTime date = DateTime(now.year, now.month, now.day);
        var phase = date.subtract(Duration(days: 6));
        int diffDays = parsedDate.difference(phase).inDays;
        if (diffDays >= 0) {
          //dodanie warunku czy już istnieje
          int average = (_war / 5).round();
          algorithm(average);
        }
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niquit',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Niquit',
              style: TextStyle(fontSize: 31, fontFamily: 'Cairo')),
          backgroundColor: Color(0xff1ec8c8),
          centerTitle: true,
          elevation: 0,
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              //canvasColor: Colors.green,
              primaryColor: Color(0xff1ec8c8),
              textTheme: Theme.of(context).textTheme.copyWith()),
          child: new BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart), title: Text('Stats')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box), title: Text('Tasks')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dehaze), title: Text('Menu'))
            ],
          ),
        ),
      ),
    );
  }
}
