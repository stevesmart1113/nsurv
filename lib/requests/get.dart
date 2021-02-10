import 'dart:convert';

import 'package:nsurv/domain/form.dart';
import 'package:http/http.dart' as http;

Future<Form> fetchForms(agentCode) async {
  final response = await http.get('https://lemon.free.beeceptor.com/agents/$agentCode/form');
  if (response.statusCode == 200) {
    return Form.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}