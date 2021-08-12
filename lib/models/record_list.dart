import 'package:contact_list/models/record.dart';

class RecordList {
  List<Record> records = new List.empty();

  RecordList({required this.records});

  factory RecordList.fromJson(List<dynamic> parsedJson) {

    List<Record> records = new List<Record>.empty();

    records = parsedJson.map((i) => Record.fromJson(i)).toList();

    return new RecordList(
      records: records,
    );
  }
}
