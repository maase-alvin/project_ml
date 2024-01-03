import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ForgotPasswordScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'PhoneNumberScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:homital/UI/HomePage.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/Widget/Alert.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        _showClearButton = emailController.text.length > 0;
      });
    });
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return Text("");
    }
    return InkWell(
      onTap: () {
        emailController.clear();
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/icons/ic_clear.png",
            scale: 4.3,
          )),
    );
  }

  //
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //Form Validation
  var _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void _submit() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    Navigator.push(context, SlidePageRoute(page: HomePage()));
  }

  bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Invalid phone no";
    }
    return null;
  }

//
  String validatePassword(String value) {
    final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    Pattern pattern = "^(?=(.*\d){1})(.*\S)(?=.*[a-zA-Z\S])[0-9a-zA-Z\S]{8,}";
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Invalid password';
    } else if (value.length < 8) {
      return "Password should be between 8-20 characters";
    } else {
      if (!_passwordRegExp.hasMatch(value))
        return 'Use 8-20 characters from at least 2 categories:\nletters, numbers, special characters';
      else
        return null;
    }
  }

  bool checkBoxValue = false;
  _onChange(bool val) {
    setState(() {
      checkBoxValue = val;
    });
  }

  //
  checkVal(BuildContext context) {
    if (emailController.text.isEmpty) {
      return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return Alert(
              title: "Alert !!!",
              subTile: "Email is required !",
            );
          });
    } else if (passwordController.text.isEmpty ||
        passwordController.text.length < 6) {
      if (passwordController.text.length >= 1 &&
          passwordController.text.length < 6) {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Alert !!!",
                subTile: "Password must be 6 digit !",
              );
            });
      } else {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                title: "Alert !!!",
                subTile: "Password can't empty !",
              );
            });
      }
    } else {
      Navigator.pop(context);
    }
  }

  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  //Appbar
                  // Container(
                  //   height: 50,
                  //   child: Stack(
                  //     fit: StackFit.expand,
                  //     children: [
                  //       //back btn
                  //       Positioned.directional(
                  //         textDirection: Directionality.of(context),
                  //         start: -4,
                  //         top: 0,
                  //         bottom: 0,
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(10.0),
                  //             child: Image.asset(
                  //               "assets/icons/ic_back.png",
                  //               scale: 30,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          //Space
                          SizedBox(
                            height: 35,
                          ),
                          //Sign In
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline2
                                      .color),
                            ),
                          ),
                          //Space
                          SizedBox(
                            height: 12,
                          ),
                          //Don't have an account?...
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 20),
                          //   alignment: Alignment.center,
                          //   child: InkWell(
                          //     onTap: () {
                          //       // FocusScope.of(context)
                          //       //     .requestFocus(FocusNode());
                          //       // Navigator.push(context,
                          //       //     SlidePageRoute(page: PhoneNumberScreen()));
                          //     },
                          //     // child: RichText(
                          //     //   text: new TextSpan(
                          //     //     text: "Don't have an account?",
                          //     //     style: TextStyle(
                          //     //         fontSize: 15,
                          //     //         fontFamily: "medium",
                          //     //         color: Theme.of(context)
                          //     //             .accentTextTheme
                          //     //             .headline2
                          //     //             .color),
                          //     //     children: <TextSpan>[
                          //     //       new TextSpan(
                          //     //         text: " Sign up",
                          //     //         style: TextStyle(
                          //     //             fontSize: 15,
                          //     //             fontFamily: "medium",
                          //     //             color: Theme.of(context)
                          //     //                 .accentTextTheme
                          //     //                 .headline5
                          //     //                 .color),
                          //     //       ),
                          //     //     ],
                          //     //   ),
                          //     // ),
                          //   ),
                          // ),
                          //Space
                          SizedBox(
                            height: 50,
                          ),
                          //Email or Phone Number
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.email),
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 14),
                                    labelText: "Email",
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
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            height: 17,
                          ),
                          //Password Text Field
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  obscureText: _obscureText,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.lock),
                                    contentPadding: EdgeInsets.only(left: 14),
                                    labelText: "Password",
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
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  end: 8,
                                  top: 4,
                                  child: InkWell(
                                    onTap: () {
                                      _toggle();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _obscureText
                                            ? Image.asset(
                                                "assets/icons/ic_hide.png",
                                                scale: 3.7,
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline1
                                                    .color,
                                              )
                                            : Image.asset(
                                                "assets/icons/ic_seen.png",
                                                scale: 3.7,
                                                color: Theme.of(context)
                                                    .accentTextTheme
                                                    .headline1
                                                    .color,
                                              )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(height: 20),
                          //Remember me and Forgot Password
                          // Container(
                          //   padding:
                          //       EdgeInsets.only(left: 0, right: 8, bottom: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       InkWell(
                          //         onTap: () {
                          //           setState(() {
                          //             checkBoxValue = !checkBoxValue;
                          //           });
                          //         },
                          //         child: Container(
                          //           child: Row(
                          //             //  clipBehavior: Clip.none,
                          //             children: [
                          //               Transform.scale(
                          //                 scale: 0.8,
                          //                 child: Checkbox(
                          //                   value: checkBoxValue,
                          //                   activeColor: Theme.of(context)
                          //                       .accentTextTheme
                          //                       .headline1
                          //                       .color,
                          //                   onChanged: _onChange,
                          //                 ),
                          //               ),
                          //               //
                          //               Transform.translate(
                          //                 offset: Offset(-8.0, 0.0),
                          //                 child: Container(
                          //                   child: Text(
                          //                     "Remember me",
                          //                     style: TextStyle(
                          //                         fontSize: 13,
                          //                         fontFamily: "medium",
                          //                         color: Theme.of(context)
                          //                             .accentTextTheme
                          //                             .headline4
                          //                             .color),
                          //                   ),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //       InkWell(
                          //         onTap: () {
                          //           FocusScope.of(context)
                          //               .requestFocus(FocusNode());
                          //           Navigator.push(
                          //               context,
                          //               SlidePageRoute(
                          //                   page: ForgotPasswordScreen()));
                          //         },
                          //         child: Container(
                          //           padding: EdgeInsets.all(8),
                          //           alignment: Alignment.centerRight,
                          //           child: Text(
                          //             "Forgot password?",
                          //             style: TextStyle(
                          //               color: Theme.of(context)
                          //                   .accentTextTheme
                          //                   .headline2
                          //                   .color,
                          //               fontSize: 14,
                          //               fontFamily: 'medium',
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //SIGN IN button
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    height: 44,
                                    onPressed: () {
                                      // FocusScope.of(context)
                                      //     .requestFocus(FocusNode());
                                      // checkVal(context);
                                      String _email = emailController.text;
                                      String _password =
                                          passwordController.text;

                                      final headers = {
                                        "Content-type": "application/json"
                                      };

                                      final url =
                                          'https://a0ca-102-215-76-226.in.ngrok.io/predict';
                                      // final response = await http
                                      //     .post(Uri.parse(url),
                                      //         headers: headers,
                                      //         body: json.encode({
                                      //           'email': _email,
                                      //           'password': _password,

                                      //         }));

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return HomePage();
                                      }));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    color: Colors.blue,
                                    elevation: 0,
                                    highlightElevation: 0,
                                    child: Container(
                                      child: Text(
                                        "Sign in",
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
                          //OR
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 15),
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     "OR",
                          //     style: TextStyle(
                          //       color:
                          //           Theme.of(context).textTheme.headline2.color,
                          //       fontSize: 18,
                          //       fontFamily: 'medium',
                          //     ),
                          //   ),
                          // ),
                          //CONTINUE WITH FACEBOOK
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 16),
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         child: MaterialButton(
                          //           height: 44,
                          //           onPressed: () {
                          //             FocusScope.of(context)
                          //                 .requestFocus(FocusNode());
                          //             Navigator.push(context,
                          //                 SlidePageRoute(page: HomePage()));
                          //           },
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(4)),
                          //           color: Theme.of(context)
                          //               .accentTextTheme
                          //               .subtitle1
                          //               .color,
                          //           elevation: 0,
                          //           highlightElevation: 0,
                          //           child: Container(
                          //             height: 44,
                          //             child: Stack(
                          //               clipBehavior: Clip.none,
                          //               fit: StackFit.expand,
                          //               children: [
                          //                 Positioned.directional(
                          //                     textDirection:
                          //                         Directionality.of(context),
                          //                     start: -19,
                          //                     top: 0,
                          //                     bottom: 0,
                          //                     child: Image.asset(
                          //                       "assets/icons/ic_fb.png",
                          //                       scale: 3.2,
                          //                     )),
                          //                 Positioned.directional(
                          //                   textDirection:
                          //                       Directionality.of(context),
                          //                   start: 0,
                          //                   end: 0,
                          //                   top: 0,
                          //                   bottom: 0,
                          //                   child: Container(
                          //                     alignment: Alignment.center,
                          //                     child: Text(
                          //                       "Continue with Facebook",
                          //                       style: TextStyle(
                          //                         fontFamily: 'medium',
                          //                         fontSize: 15,
                          //                         color: Theme.of(context)
                          //                             .textTheme
                          //                             .subtitle2
                          //                             .color,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //Space
                          SizedBox(
                            height: 12,
                          ),
                          //CONTINUE WITH GOOGLE
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 16),
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         child: MaterialButton(
                          //           height: 44,
                          //           onPressed: () {
                          //             FocusScope.of(context)
                          //                 .requestFocus(FocusNode());
                          //             Navigator.push(context,
                          //                 SlidePageRoute(page: HomePage()));
                          //           },
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(4)),
                          //           color: Theme.of(context)
                          //               .accentTextTheme
                          //               .headline5
                          //               .color,
                          //           elevation: 0,
                          //           highlightElevation: 0,
                          //           child: Container(
                          //             height: 44,
                          //             child: Stack(
                          //               clipBehavior: Clip.none,
                          //               fit: StackFit.expand,
                          //               children: [
                          //                 Positioned.directional(
                          //                     textDirection:
                          //                         Directionality.of(context),
                          //                     start: -19,
                          //                     top: 0,
                          //                     bottom: 0,
                          //                     child: Image.asset(
                          //                       "assets/icons/ic_google.png",
                          //                       scale: 3.2,
                          //                     )),
                          //                 Positioned.directional(
                          //                   textDirection:
                          //                       Directionality.of(context),
                          //                   start: 0,
                          //                   end: 0,
                          //                   top: 0,
                          //                   bottom: 0,
                          //                   child: Container(
                          //                     alignment: Alignment.center,
                          //                     child: Text(
                          //                       "Continue with Google",
                          //                       style: TextStyle(
                          //                         fontFamily: 'medium',
                          //                         fontSize: 15,
                          //                         color: Theme.of(context)
                          //                             .textTheme
                          //                             .subtitle2
                          //                             .color,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
