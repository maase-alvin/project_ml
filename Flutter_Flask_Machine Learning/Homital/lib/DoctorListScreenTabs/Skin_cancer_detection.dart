import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homital/SkinCancerAI/common/card_picture.dart';
import 'package:homital/SkinCancerAI/common/take_photo.dart';
import 'package:homital/SkinCancerAI/service/dio_upload_service.dart';
import 'package:homital/SkinCancerAI/service/http_upload_service.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class Skin extends StatefulWidget {
  @override
  _SkinState createState() => _SkinState();
}

class _SkinState extends State<Skin> {
  // File _storedImage;

  PickedFile imageFile;

  Future getImage(int type) async {
    PickedFile pickedImage = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedImage;
  }

  // Future<void> _takePicture() async {
  //   // ignore: unused_local_variable
  //   final imageFile = await ImagePicker.getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 600,
  //   );
  // }

  final HttpUploadService _httpUploadService = HttpUploadService();
  final DioUploadService _dioUploadService = DioUploadService();
  CameraDescription _cameraDescription;
  List<String> _images = [];
  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      final camera = cameras
          .where((camera) => camera.lensDirection == CameraLensDirection.back)
          .toList()
          .first;
      setState(() {
        _cameraDescription = camera;
      });
    }).catchError((err) {
      print(err);
    });
  }

  Future<void> presentAlert(BuildContext context,
      {String title = '', String message = '', Function() ok}) {
    return showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text('$title'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text('$message'),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  // style: greenText,
                ),
                onPressed: ok != null ? ok : Navigator.of(context).pop,
              ),
            ],
          );
        });
  }

  void presentLoader(BuildContext context,
      {String text = 'Aguarde...',
      bool barrierDismissible = false,
      bool willPop = true}) {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (c) {
          return WillPopScope(
            onWillPop: () async {
              return willPop;
            },
            child: AlertDialog(
              content: Container(
                child: Row(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Column(
          children: [
            Text('Send a picture of the skin',
                style: TextStyle(fontSize: 17.0)),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 400,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                        CardPicture(
                          onTap: () async {
                            final tmpFile = await getImage(2);

                            setState(() {
                              imageFile = tmpFile;
                            });
                          },
                          // async {
                          //   final String imagePath = await Navigator.of(context)
                          //       .push(MaterialPageRoute(
                          //           builder: (_) => TakePhoto(
                          //                 camera: _cameraDescription,
                          //               )));

                          //   print('imagepath: $imagePath');
                          //   if (imagePath != null) {
                          //     setState(() {
                          //       _images.add(imagePath);
                          //     });
                          //   }
                          // },
                        ),
                        // CardPicture(),
                        // CardPicture(),
                      ] +
                      _images
                          .map((String path) => CardPicture(
                                imagePath: path,
                              ))
                          .toList()),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.indigo,
                              gradient: LinearGradient(colors: [
                                Colors.indigo,
                                Colors.indigo.shade800
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0))),
                          child: RawMaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            onPressed: () async {
                              // show loader
                              presentLoader(context, text: 'Wait...');

                              // calling with dio
                              var responseDataDio =
                                  await _dioUploadService.uploadPhotos(_images);

                              // calling with http
                              var responseDataHttp = await _httpUploadService
                                  .uploadPhotos(_images);

                              // hide loader
                              Navigator.of(context).pop();

                              // showing alert dialogs
                              await presentAlert(context,
                                  title: 'Success Dio',
                                  message: responseDataDio.toString());
                              await presentAlert(context,
                                  title: 'Success HTTP',
                                  message: responseDataHttp);
                            },
                            child: Center(
                                child: Text(
                              'SEND',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
