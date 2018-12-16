import 'package:xml/xml.dart' as xml;

class XSignal {

  String id;
  String tag;
  String description;
  String interface;
  String type;
  String unit;
  String address;

  XSignal(xml.XmlElement element){

    id = element.getAttribute("id");
    description = element.findElements("Description").first.text;
    tag = element.findElements("Tag").first.text;
    interface = element.findElements("Interface").first.text;
    type = element.findElements("SignalType").first.text;
    unit = element.findElements("Unit").first.text;
    address = element.findElements("InterfaceAddress").first.text;

  }
}