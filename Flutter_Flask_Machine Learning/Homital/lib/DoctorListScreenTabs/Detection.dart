// ignore_for_file: missing_required_param

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homital/SkinCancerAI/common/card_picture.dart';
import 'package:homital/SkinCancerAI/common/take_photo.dart';
import 'package:homital/SkinCancerAI/service/dio_upload_service.dart';
import 'package:homital/SkinCancerAI/service/http_upload_service.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Skin2 extends StatefulWidget {
  @override
  _Skin2State createState() => _Skin2State();
}

class _Skin2State extends State<Skin2> {
  File selectedImage;
  String message = "";
  bool isButtonPressed = false;

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://c2d6-102-215-76-226.in.ngrok.io/upload"));

    final headers = {"Content-type": "multipart/form-data"};

    request.files.add(http.MultipartFile('image',
        selectedImage.readAsBytes().asStream(), selectedImage.lengthSync(),
        filename: selectedImage.path.split("/").last));

    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];

    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  Future getImagegallery() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxWidth: 224, maxHeight: 224);
    selectedImage = File(pickedImage.path);
    setState(() {});
  }

  Future getImagecamera() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, maxWidth: 224, maxHeight: 224);
    selectedImage = File(pickedImage.path);
    setState(() {});
  }

  refreshAi() async {
    setState(() {
      selectedImage = null;
    });
    setState(() {
      message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  child: selectedImage == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Select and Upload the Image of the skin',
                                  style: TextStyle(fontSize: 17.0)),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                onPressed: getImagegallery,
                                icon: Icon(Icons.add_a_photo,
                                    color: Colors.white),
                                label: Text("Select Image From Gallery",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 15.0,
                              ),
                              TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                onPressed: getImagecamera,
                                icon: Icon(Icons.camera, color: Colors.white),
                                label: Text("Take Image from Camera",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.file(selectedImage),
                              Container(
                                height: 15.0,
                              ),
                              TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                onPressed: uploadImage,
                                icon: Icon(Icons.upload_file,
                                    color: Colors.white),
                                label: Text("Upload Image",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(height: 15.0),
                              Container(
                                child: isButtonPressed
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                  "The image of skin uploaded is $message in nature",
                                                  style: TextStyle(
                                                      fontSize: 17.0)),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextButton.icon(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.blue)),
                                                onPressed: refreshAi,
                                                icon: Icon(
                                                    Icons.refresh_rounded,
                                                    color: Colors.white),
                                                label: Text("Refresh the AI",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ]),
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                  "Click the Upload button to get your diagosis",
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ]),
                                      ),
                              ),
                            ],
                          )),
                ))));
  }
}
