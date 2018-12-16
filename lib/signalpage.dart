import 'package:flutter/material.dart';
import 'xsignal.dart';
import 'package:charts_flutter/flutter.dart';

class SignalPage extends StatelessWidget{

  XSignal _signal;

  SignalPage(XSignal signal){
    _signal = signal;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: new Text(_signal.description),
        ),
        body: Center(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Description: " +_signal.description),
              Text("Tag: " +_signal.tag),
              Text("Type: " +_signal.type),
              Text("Interface: " +_signal.interface),
              Text("Address: " +_signal.address),
              Text("Unit: " +_signal.unit),
              Container(
                margin: const EdgeInsets.all(4.0),
                height: 200,
                width: 400,
                child:
                TimeSeriesChart(_getSignalTimeSeriesData()),
              ),
            ],
          )
        ),
      );
  }

  List<Series<TimeSeriesSignal,DateTime>>_getSignalTimeSeriesData(){

    final exampleData = [
    new TimeSeriesSignal(new DateTime(2018,12,24,16,00,01), 10.0),
    new TimeSeriesSignal(new DateTime(2018,12,24,16,00,02), 20.0),
    new TimeSeriesSignal(new DateTime(2018,12,24,16,00,03), 30.0),
    new TimeSeriesSignal(new DateTime(2018,12,24,16,00,04), 25.0),
    new TimeSeriesSignal(new DateTime(2018,12,24,16,00,05), 6.0),

    ];

    return [
      new Series<TimeSeriesSignal,DateTime>(
        id: _signal.tag,
        data: exampleData,
        domainFn: (TimeSeriesSignal sig, _) => sig.time,
        measureFn: (TimeSeriesSignal sig, _) => sig.engValue)
    ];

  }

}

class TimeSeriesSignal {
  final DateTime time;
  final double engValue;

  TimeSeriesSignal(this.time,this.engValue);

}