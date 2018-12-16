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
            children: <Widget>[
              Text("Tag: " +_signal.tag),
              Text("Type: " +_signal.type),
              Text("Interface: " +_signal.interface),
              Text("Address: " +_signal.address),
              Text("Unit: " +_signal.unit),
            ],
          )
        ),
      );

  }


}