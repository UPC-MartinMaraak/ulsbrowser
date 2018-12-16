import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'ulsreader.dart' as UlsReader;
import 'xsignal.dart';
import 'signalpage.dart';

void main() {
  runApp(MaterialApp(
      title: "X-Connect config browser",
      home: SignalsPage()

  ));
}


class SignalsPage extends StatefulWidget{

  @override
  _SignalsPageState createState() => new _SignalsPageState();

}

class _SignalsPageState extends State<SignalsPage> {

  final TextEditingController _filter = new TextEditingController();
  List<XSignal> signalList = new List();
  List<XSignal> filteredList = new List();
  Icon _searchIcon = new Icon(Icons.search);
  String _searchText = "";
  Widget appBarText = new Text("X-Connect signals");

  _SignalsPageState() {
    _getSignalList();

    _filter.addListener((){
      if(_filter.text.isEmpty){
        setState(() {
          _searchText = "";
          filteredList = signalList;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      )

    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: appBarText,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList(){
    if( !(_searchText.isEmpty)){
      List tempList = new List();
      for (int i=0;i<signalList.length;i++){
        if(signalList[i].toString().toLowerCase().contains(_searchText.toLowerCase())){
          tempList.add(signalList[i]);
        }
      }
      filteredList = tempList;
    }

    return ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context,int i){
          String txt = filteredList[i].tag +" - " + filteredList[i].description;

          return new ListTile(
            title: Text(txt + " Signal " +i.toString()),
            onTap: () {_listTapped(filteredList[i]);},
          );
        });
  }

  _listTapped(XSignal signal){
    print(signal.description + " tapped");
    if(signal != null) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignalPage(signal)));
    }
  }

  void _searchPressed(){
    print("search pressed");
    setState(() {
      if(this._searchIcon.icon == Icons.search){
        this._searchIcon = new Icon(Icons.close);
        this.appBarText = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      }else{
        this._searchIcon = new Icon(Icons.search);
        this.appBarText = new Text("X-Connect signals");
        filteredList = signalList;
        _filter.clear();
      }
    });

  }

  void _getSignalList() async {
    signalList = UlsReader.UlsReader.getSignalList();
    filteredList = signalList;

  }
}




