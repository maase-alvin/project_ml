import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MalariaDengue extends StatefulWidget {
  @override
  _MalariaDengueState createState() => _MalariaDengueState();
}

class _MalariaDengueState extends State<MalariaDengue> {
  final _malariaDengueController = TextEditingController();

  bool isButtonPressed = false;
  String message = "";
  final _formkey = GlobalKey<FormState>();

  refreshAi() async {
    setState(() {
      isButtonPressed = false;
    });
    setState(() {
      message = "";
    });
    _malariaDengueController.clear();
  }

  @override
  void dispose() {
    _malariaDengueController.dispose();

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
                                      Text('Enter how you are feeling',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 17.0)),
                                      Container(height: 20),
                                      TextFormField(
                                        controller: _malariaDengueController,
                                        keyboardType: TextInputType.text,
                                        // onSaved: (value) {
                                        //   glucose = value as num;
                                        // },
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.healing_sharp),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 40.0),
                                          labelText: "Symptoms",
                                          hintText: 'Enter your symptoms',
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
                                                  String _malariaDengue =
                                                      _malariaDengueController
                                                          .text;

                                                  final headers = {
                                                    "Content-type":
                                                        "application/json"
                                                  };

                                                  final url =
                                                      'https://c2d6-102-215-76-226.in.ngrok.io/malariapredict';
                                                  final response = await http
                                                      .post(Uri.parse(url),
                                                          headers: headers,
                                                          body: json.encode({
                                                            'malaria':
                                                                _malariaDengue,
                                                          }));

                                                  if (response.statusCode ==
                                                      200) {
                                                    print(jsonDecode(
                                                        response.body));
                                                    final json = jsonDecode(
                                                        response.body);
                                                    var prediction =
                                                        json['predictions'];
                                                    print(prediction);

                                                    setState(() {
                                                      message =
                                                          "You are likely suffering from $prediction";
                                                    });
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
