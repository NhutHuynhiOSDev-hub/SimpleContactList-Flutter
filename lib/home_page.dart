import 'package:contact_list/helper/Constants.dart';
import 'package:contact_list/models/record.dart';
import 'package:contact_list/models/record_list.dart';
import 'package:contact_list/models/record_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final TextEditingController _filter = new TextEditingController();

  List<Record> _records = new List.empty();
  List<Record> _filterRecords = new List.empty();

  String _searchText = "";
  Widget _appBarTitle = new Text(appTitle);
  Icon _searchIcon = new Icon(Icons.search);

  void _getRecords() async {

    RecordList records = await RecordService().loadRecords();

    setState(() {

      this._records = records.records;
      this._filterRecords = records.records;
    });
  }

  @override
  void initState() {
    super.initState();

    _getRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appDarkGreyColor,
          centerTitle: true,
          title: _appBarTitle,
          leading: new IconButton(
            icon: _searchIcon,
            onPressed: () {},
          )),
      backgroundColor: appDarkGreyColor,
      resizeToAvoidBottomInset: false,
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    if (_searchText.isNotEmpty) {
      _filterRecords = new List<Record>.empty();
      for (int i = 0; i < _records.length; i++) {
        if (_records[i].name
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            _records[i].address
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _filterRecords.add(_records[i]);
        }
      }
    }

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this
          ._filterRecords
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Hero(
                  tag: "avatar_" + record.name,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(record.photo),
                  ))),
          title: Text(
            record.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: record.address,
                        style: TextStyle(color: Colors.white),
                      ),
                      maxLines: 3,
                      softWrap: true,
                    )
                  ]))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {},
        ),
      ),
    );
  }
}
