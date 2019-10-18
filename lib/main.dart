import 'package:flutter/material.dart';
import './Screens/HomeScreen.dart';
import './Screens/TasksScreen.dart';
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
     Text('Item 2'),
     Tasks(),
     Text('Item 4'),
     Text('Item 5'),
   ];
   
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Niquit',
          home: Scaffold(
          appBar: AppBar(
            title: Text(
                'Niquit',
                style: TextStyle(
                    fontSize: 31,
                    fontFamily: 'Cairo'
                )
            ),
            backgroundColor: Color(0xff1ec8c8),
            centerTitle: true,
            elevation: 0,
          ),
            body: _pageOptions[_selectedPage],
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
            //canvasColor: Colors.green,
            primaryColor: Color(0xff1ec8c8),
            textTheme: Theme
            .of(context)
            .textTheme
            .copyWith()),
              child: new BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState((){
                  _selectedPage = index;
                });
              },
              items: [
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
              ],
            ),
            ),
          ),
        );
    }
}
