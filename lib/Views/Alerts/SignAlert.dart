import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:uniquepartners/Views/Widgets/CustomButton.dart';
import '../../App/Globals.dart';
import 'dart:ui' as ui;

class SignAlert extends StatefulWidget {
  final String name;
  final Function({required String sb64}) callback;
  SignAlert({required this.callback, required this.name, super.key});

  @override
  State<SignAlert> createState() => _SignAlertState();
}

class _SignAlertState extends State<SignAlert> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _signaturePadKey.currentState?.clear(),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.black.withOpacity(0.075),
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.redo),
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => Globals.pop(),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.black.withOpacity(0.075),
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.075),
                      width: 1.5,
                    ),
                  ),
                  child: SfSignaturePad(
                    key: _signaturePadKey,
                    minimumStrokeWidth: 3,
                    maximumStrokeWidth: 3,
                    strokeColor: Colors.orange,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: size.width / 3,
                      child: CustomButton(
                        buttonText: "Cancel",
                        buttonColor: Colors.white,
                        borderColor: Colors.orange,
                        buttonTextColor: Colors.orange,
                        onPressed: () => Globals.pop(),
                        isLoading: false,
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: size.width / 3,
                      child: CustomButton(
                        buttonText: "Sign In",
                        buttonColor: Colors.orange,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          ui.Image image =
                              await _signaturePadKey.currentState!.toImage();
                          final ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);
                          final Uint8List uint8list =
                              byteData!.buffer.asUint8List();
                          String sb64 = base64Encode(uint8list);
                          widget.callback(sb64: sb64);
                        },
                        isLoading: loading,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
