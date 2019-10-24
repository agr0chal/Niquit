/// Example of a stacked area chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:niquit/CigSeries.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  const SimpleTimeSeriesChart(this.seriesList);

  factory SimpleTimeSeriesChart.withData() {
    return SimpleTimeSeriesChart(
      _getData(),
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
  static List<charts.Series<CigSeries, DateTime>> _getData() {
    DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);

    final List<CigSeries> cigs = <CigSeries>[
      CigSeries(date.subtract(Duration(days: 3)), 3),
      CigSeries(date.subtract(Duration(days: 2)), 5),
      CigSeries(date.subtract(Duration(days: 1)), 1),
      CigSeries(date, 2),
      /*CigSeries(date.add(new Duration(days: 1)), 0),
      CigSeries(date.add(new Duration(days: 2)), 0),
      CigSeries(date.add(new Duration(days: 3)), 0),*/
    ];
    final List<CigSeries> curation = <CigSeries>[
      CigSeries(date.subtract(Duration(days: 3)), 4),
      CigSeries(date.subtract(Duration(days: 2)), 4),
      CigSeries(date.subtract(Duration(days: 1)), 4),
      CigSeries(date, 3),
      CigSeries(date.add(Duration(days: 1)), 3),
      CigSeries(date.add(Duration(days: 2)), 2),
      CigSeries(date.add(Duration(days: 3)), 2),
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
