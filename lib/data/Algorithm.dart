import 'dart:math';
import 'CureModel.dart';
import 'Database.dart';
void algorithm (int b){
  int x0 = 0;
  int y;
  int y0=b;
  int y1 = min(6,(y0*0.2).round());
  int x1;
  if(y0<=10){
    x1=5;
  }
  else if(y0>=30){
    x1=15;
  }
  else{
    x1 = (y0/2).round();
  }
  for(int i=3;i>=1;i--){
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year,now.month,now.day);
    date = date.subtract(Duration(days: i));
    Cure cure = Cure(
          id: 69,
          year: date.year,
          month: date.month,
          day: date.day,
          amount: b);
    DBProvider.db.newCure(cure);
  }
  for(int i=0;i<=x1;i++){
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year,now.month,now.day);
    date = date.add(Duration(days: i));
    y=(((y1-y0)/(x1-x0)).round())*i+y0;
    Cure cure = Cure(
          id: 69,
          year: date.year,
          month: date.month,
          day: date.day,
          amount: y);
    DBProvider.db.newCure(cure);
  }


}