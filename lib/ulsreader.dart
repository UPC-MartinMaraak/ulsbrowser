import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;
import 'xsignal.dart';

class UlsReader {

  static List<XSignal> getSignalList(){

    List<XSignal> tmp = new List();
    getFileData("assets/config.uls").then((String content){

      print("Ulsreader run");
      var document = xml.parse(content);

      for(var sigElement in document.findAllElements("Signal")){
        String tag = sigElement.findElements("Tag").first.text;
        String description = sigElement.findElements("Description").first.text;
        XSignal signal = new XSignal(sigElement);
        tmp.add(signal);
      }
    });

    return tmp;
  }

  static Future<String> getFileData(String path)  async{
    return await rootBundle.loadString(path);
  }
  
}