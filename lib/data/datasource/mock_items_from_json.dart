


import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<dynamic>> loadMockData(String fileName) async {
  final String response = await rootBundle.loadString('assets/data/$fileName');
  return json.decode(response);
}