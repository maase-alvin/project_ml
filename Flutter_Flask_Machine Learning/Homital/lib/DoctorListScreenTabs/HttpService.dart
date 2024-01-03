import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:homital/DoctorListScreenTabs/DiabetesandBP.dart';

class HttpService {
  static final _client = http.Client();
  static var _diabetesBpUrl = Uri.parse('');

  static var prediction;

  static set message(String message) {}

  static diabetesBpAi(glucose, bp, bmi, age) async {
    final _client = http.Client();
    var _diabetesBpUrl =
        Uri.parse('https://5aef-102-215-76-226.in.ngrok.io/predict');

    http.Response response = await _client.post(_diabetesBpUrl,
        body: {"glucose": glucose, "bp": bp, "bmi": bmi, "age": age});

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);
      prediction = json['prediction'];

      // ignore: unrelated_type_equality_checks
      if (prediction == '1') {
        message = "Your blood sugar and Blood pressue are normal";
      } else {
        message = "Your blood sugar and Blood pressue are out of range";
      }
    } else {
      print("There was an error in the server");
    }
  }
}
