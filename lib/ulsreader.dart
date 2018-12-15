import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;

class UlsReader {

  static List<String> getSignalList(){

    List<String> tmp = new List();
    getFileData("assets/config.uls").then((String content){

      print(content);
      var document = xml.parse(content);

      for(var sigElement in document.findAllElements("Signal")){
        String tag = sigElement.findElements("Tag").first.text;
        String description = sigElement.findElements("Description").first.text;
        tmp.add(sigElement.getAttribute("id") +": " +tag +" - " +description);
      }
    });

    return tmp;
  }

  static Future<String> getFileData(String path)  async{
    return await rootBundle.loadString(path);
  }
  
}