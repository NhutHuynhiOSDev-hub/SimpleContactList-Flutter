import 'package:contact_list/models/record_list.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class RecordService {
  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('res/data/records.json');
  }

  Future<RecordList> loadRecords() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    RecordList records = new RecordList.fromJson(jsonResponse);
    return records;
  }
}
