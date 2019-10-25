/// Example of a stacked area chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:niquit/CigSeries.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  const SimpleTimeSeriesChart(this.seriesList);

  factory SimpleTimeSeriesChart.withData(List<int> cigsData, List<int> cureData) {
    return SimpleTimeSeriesChart(
      _getData(cigsData, cureData),
    );
  }

  final List<charts.Series<CigSeries, DateTime>> seriesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: charts.TimeSeriesChart(
        seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: false),
        animate: true,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        domainAxis: charts.DateTimeAxisSpec(
          tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
            day: charts.TimeFormatterSpec(
              format: 'EEE',
              transitionFormat: 'EEE',
            ),
          ),
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<CigSeries, DateTime>> _getData(List<int> cigsData, List<int> cureData) {
    DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);

    final List<CigSeries> cigs = <CigSeries>[
      CigSeries(date.subtract(Duration(days: 3)), cigsData[0]),
      CigSeries(date.subtract(Duration(days: 2)), cigsData[1]),
      CigSeries(date.subtract(Duration(days: 1)), cigsData[2]),
      CigSeries(date, cigsData[3]),
      /*CigSeries(date.add(new Duration(days: 1)), 0),
      CigSeries(date.add(new Duration(days: 2)), 0),
      CigSeries(date.add(new Duration(days: 3)), 0),*/
    ];
    final List<CigSeries> curation = <CigSeries>[
      CigSeries(date.subtract(Duration(days: 3)), cureData[0]),
      CigSeries(date.subtract(Duration(days: 2)), cureData[1]),
      CigSeries(date.subtract(Duration(days: 1)), cureData[2]),
      CigSeries(date, cureData[3]),
      CigSeries(date.add(Duration(days: 1)), cureData[4]),
      CigSeries(date.add(Duration(days: 2)), cureData[5]),
      CigSeries(date.add(Duration(days: 3)), cureData[6]),
    ];

    return <charts.Series<CigSeries, DateTime>>[
      charts.Series<CigSeries, DateTime>(
        id: 'Curation',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (CigSeries data, _) => data.time,
        measureFn: (CigSeries data, _) => data.cigs,
        data: curation,
      ),
      charts.Series<CigSeries, DateTime>(
        id: 'Cigarettes',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (CigSeries data, _) => data.time,
        measureFn: (CigSeries data, _) => data.cigs,
        data: cigs,
      )
    ];
  }
}
