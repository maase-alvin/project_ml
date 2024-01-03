import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homital/Account/OTPScreen.dart';
import 'package:http/http.dart' as http;
import 'package:homital/DoctorListScreenTabs/HttpService.dart';

class DiabetesBP extends StatefulWidget {
  @override
  _DiabetesBPState createState() => _DiabetesBPState();
}

class _DiabetesBPState extends State<DiabetesBP> {
  final _glucoseController = TextEditingController();
  final _bpController = TextEditingController();
  final _bmiController = TextEditingController();
  final _ageController = TextEditingController();

  bool isButtonPressed = false;
  String message = "";
  final _formkey = GlobalKey<FormState>();

  Future<void> _savingData() async {
    final validation = _formkey.currentState.validate();

    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }

  // diabetesBpAi() async {
  //   final _client = http.Client();
  //   var _diabetesBpUrl =
  //       Uri.parse('https://5aef-102-215-76-226.in.ngrok.io/predict');

  //   http.Response response = await _client.post(_diabetesBpUrl,
  //       body: {"glucose": _glucose, "bp": _bp, "bmi": _bmi, "age": _age});

  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //     var json = jsonDecode(response.body);
  //     prediction = json['prediction'];

  //     if (prediction == '1') {
  //       setState(() {
  //         message = "Your blood sugar and Blood pressue are normal";
  //       });
  //     } else {
  //       setState(() {
  //         message = "Your blood sugar and Blood pressue are out of range";
  //       });
  //     }
  //   } else {
  //     print("There was an error in the server");
  //   }
  // }

  submit() async {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  refreshAi() async {
    setState(() {
      isButtonPressed = false;
    });
    setState(() {
      message = "";
    });
    _glucoseController.clear();
    _bpController.clear();
    _bmiController.clear();
    _ageController.clear();
  }

  @override
  void dispose() {
    _glucoseController.dispose();
    _bpController.dispose();
    _bmiController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5),
                        Container(
                          width: 350,
                          child: Form(
                              key: _formkey,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Fill in the form for the A.I to process',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 17.0)),
                                      Container(height: 20),
                                      TextFormField(
                                        controller: _glucoseController,
                                        keyboardType: TextInputType.number,
                                        // onSaved: (value) {
                                        //   glucose = value as num;
                                        // },
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.healing_sharp),
                                          contentPadding:
                                              EdgeInsets.only(left: 14),
                                          labelText: "Glucose Level",
                                          hintText: 'Enter your glucose level',
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color),
                                        ),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                      ),
                                      Container(height: 20),
                                      TextFormField(
                                        controller: _bpController,
                                        keyboardType: TextInputType.number,
                                        // onChanged: (value) {
                                        //   bp = value as num;
                                        // },
                                        decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.emergency_rounded),
                                          contentPadding:
                                              EdgeInsets.only(left: 14),
                                          labelText: "Blood Pressure",
                                          hintText: 'Enter your Blood Pressure',
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color),
                                        ),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                      ),
                                      Container(height: 20),
                                      TextFormField(
                                        controller: _bmiController,
                                        keyboardType: TextInputType.number,
                                        // onChanged: (value) {
                                        //   bmi = value as num;
                                        // },
                                        decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.health_and_safety_outlined),
                                          contentPadding:
                                              EdgeInsets.only(left: 14),
                                          labelText: "BMI",
                                          hintText: 'Enter your BMI',
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color),
                                        ),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                      ),
                                      Container(height: 20),
                                      TextFormField(
                                        controller: _ageController,
                                        keyboardType: TextInputType.number,
                                        // onChanged: (value) {
                                        //   age = value as num;
                                        // },
                                        decoration: InputDecoration(
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          contentPadding:
                                              EdgeInsets.only(left: 14),
                                          labelText: "Age",
                                          hintText: 'Enter your Age',
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "medium",
                                              color: Theme.of(context)
                                                  .accentTextTheme
                                                  .headline4
                                                  .color),
                                        ),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context)
                                                .accentTextTheme
                                                .headline2
                                                .color),
                                      ),
                                      //Submit
                                      Container(height: 20),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: MaterialButton(
                                                height: 44,
                                                onPressed: () async {
                                                  // _savingData();
                                                  String _glucose =
                                                      _glucoseController.text;
                                                  String _bp =
                                                      _bpController.text;
                                                  String _bmi =
                                                      _bmiController.text;
                                                  String _age =
                                                      _ageController.text;

                                                  final headers = {
                                                    "Content-type":
                                                        "application/json"
                                                  };

                                                  final url =
                                                      'https://c2d6-102-215-76-226.in.ngrok.io/diabetespredict';
                                                  final response = await http
                                                      .post(Uri.parse(url),
                                                          headers: headers,
                                                          body: json.encode({
                                                            'glucose': _glucose,
                                                            'bp': _bp,
                                                            'bmi': _bmi,
                                                            'age': _age
                                                          }));

                                                  if (response.statusCode ==
                                                      200) {
                                                    print(jsonDecode(
                                                        response.body));
                                                    final json = jsonDecode(
                                                        response.body);
                                                    var prediction =
                                                        json['prediction'];
                                                    print(prediction);

                                                    if (prediction == 1) {
                                                      setState(() {
                                                        message =
                                                            "Your Blood Sugar Level and Blood pressue are out of range";
                                                      });
                                                      // message =
                                                      //     "Your blood sugar and Blood pressue are out of range";
                                                    } else {
                                                      setState(() {
                                                        message =
                                                            "Your Blood Sugar and Blood pressue are normal";
                                                      });
                                                      // message =
                                                      //     "Your blood sugar and Blood pressue are normal";
                                                    }
                                                  } else {
                                                    print(
                                                        "There was an error in the server");
                                                  }
                                                  setState(() {
                                                    isButtonPressed =
                                                        !isButtonPressed;
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                color: Colors.blue,
                                                elevation: 0,
                                                highlightElevation: 0,
                                                child: Container(
                                                  child: Text(
                                                    "Submit",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2
                                                            .color,
                                                        fontSize: 15,
                                                        fontFamily: 'medium'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(height: 15),
                                      Container(
                                        child: isButtonPressed
                                            ? Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(message,
                                                          style: TextStyle(
                                                              fontSize: 17.0)),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextButton.icon(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .blue)),
                                                        onPressed: refreshAi,
                                                        icon: Icon(
                                                            Icons
                                                                .refresh_rounded,
                                                            color:
                                                                Colors.white),
                                                        label: Text(
                                                            "Refresh the AI",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ]),
                                              )
                                            : Container(
                                                height: 15,
                                              ),
                                      )
                                    ]),
                              )),
                        )
                      ],
                    )))));
  }
}
