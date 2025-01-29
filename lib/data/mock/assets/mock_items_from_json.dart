import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<List<dynamic>> loadMockDataList(String fileName) async {
  final String response = await rootBundle.loadString('assets/data/$fileName');
  return json.decode(response);
}

Future<Map<String, dynamic>> loadMockDataItem(String fileName) async {
  try {
    final String response = await rootBundle.loadString('assets/data/$fileName');
    final Map<String, dynamic> jsonData = json.decode(response);
    return jsonData;
  } catch (e) {
    debugPrint("Error loading mock data for item: $e");
    return {};
  }
}