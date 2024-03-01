import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uniquepartners/Models/User/User.dart';
import 'package:uniquepartners/Models/UserHistory/GetUserHistoryReq.dart';
import 'package:uniquepartners/Models/UserHistory/GetUserHistoryResp.dart';
import 'package:uniquepartners/Utils/http/HttpAPI.dart';

import '../../App/Globals.dart';

class HistoryAlert extends StatefulWidget {
  final User user;
  HistoryAlert({required this.user, super.key});

  @override
  State<HistoryAlert> createState() => _HistoryAlertState();
}

class _HistoryAlertState extends State<HistoryAlert> {
  List<History> histories = [];
  bool searching = true;

  @override
  void initState() {
    super.initState();
    getUserHistory();
  }

  getUserHistory() async {
    if (mounted) {
      setState(() {
        searching = true;
      });
      var jsonIn = GetUserHistoryReq(widget.user.userId).toJson();
      var request = await HttpAPI().postNOAUTH(jsonIn, 'GetUserHistory');
      var response = GetUserHistoryResp.fromJson(request?.body);
      if (response.success == 1) {
        histories = response.history ?? [];
        setState(() {
          log("Successfully retrieved User History");
        });
      }
      setState(() {
        searching = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                        "History",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.user.name ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
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
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: histories.isNotEmpty
                      ? ListView.builder(
                          itemCount: histories.length,
                          padding: EdgeInsets.only(top: 5),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                height: 60,
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "TIME",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${Globals.formatDateTime(histories[index].signInDate ?? "")}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: Colors.grey[400]!,
                                              width: 0.5,
                                            ),
                                            image: DecorationImage(
                                                image: MemoryImage(base64Decode(
                                                    histories[index]
                                                            .signatureBase64 ??
                                                        "")))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: searching
                              ? CircularProgressIndicator(
                                  color: Globals.primaryColor)
                              : Text(
                                  "${widget.user.name} has no sign in history."),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
