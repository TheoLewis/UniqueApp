import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uniquepartners/App/Globals.dart';
import 'package:uniquepartners/Models/User/User.dart';
import 'package:uniquepartners/Utils/http/HttpAPI.dart';
import 'package:uniquepartners/Views/Alerts/HistoryAlert.dart';
import 'package:uniquepartners/Views/Alerts/SignAlert.dart';
import 'package:uniquepartners/Views/Sheets/AddUserSheet.dart';

import '../Models/AddUser/AddUserReq.dart';
import '../Models/AddUser/AddUserResp.dart';
import '../Models/GetUsers/GetUsersResp.dart';
import '../Models/InsertSignInLog/InsertSignInLogReq.dart';
import '../Models/InsertSignInLog/InsertSignInLogResp.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<User> users = [];
  bool searching = true;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  addUser(String name, String email) async {
    var jsonIn = AddUserReq(name, email).toJson();
    var request = await HttpAPI().postNOAUTH(jsonIn, 'AddUser');
    var response = AddUserResp.fromJson(request?.body);
    if (response.success == 1) {
      users.add(User(userId: response.uID!, name: name, email: email));
      Globals.pop();
      setState(() {
        log("Successfully added user!");
        Fluttertoast.showToast(
          msg: "Successfully added user!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.green,
          fontSize: 16.0,
        );
      });
    }
  }

  getUsers() async {
    try {
      setState(() {
        searching = true;
      });
      var request = await HttpAPI().postNOAUTH("{}", 'GetUsers');
      var response = GetUsersResp.fromJson(request?.body);
      if (response.success == 1) {
        users = response.users ?? [];
        setState(() {
          log("Successfully retrieved the list of users");
        });
      }
      setState(() {
        searching = true;
      });
    } catch (e) {
      log("An error has occured - $e");
      setState(() {
        searching = true;
      });
    }
  }

  signIn({required int index, required String sb64}) async {
    try {
      var jsonIn = InsertSignInLogReq(users[index].userId, sb64).toJson();
      var request = await HttpAPI().postNOAUTH(jsonIn, 'InsertSignInLog');
      var response = InsertSignInLogResp.fromJson(request?.body);
      if (response.success == 1) {
        users[index].lastSignInDate = response.lastSignInDate;
        setState(() {
          log("Successfully logged: 'Sign In' for User: ${users[index].userId}");
          Fluttertoast.showToast(
            msg: "Successfully signed in: ${users[index].name}!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0,
          );
        });
        Globals.pop();
      }
    } catch (e) {
      log("An error has occured - $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Unique Partnerships",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () => Globals.openSheet(AddUserSheet(
                  callback: (String name, String email) =>
                      addUser(name, email))),
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
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            height: size.height,
            width: size.width,
            child: users.isNotEmpty
                ? ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 85,
                        width: size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.1, color: Colors.grey),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          color:
                                              Colors.black.withOpacity(0.075),
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          users[index].name ?? "Sally",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "Last Signed In: ${users[index].lastSignInDate != null ? Globals.formatDateTime(users[index].lastSignInDate ?? "") : "Never signed in."}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () => Globals.openAlert(
                                          SignAlert(
                                            name: users[index].name ?? "",
                                            callback: ({required sb64}) {
                                              signIn(index: index, sb64: sb64);
                                            },
                                          ),
                                          dismissable: false),
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              color: Colors.black
                                                  .withOpacity(0.075),
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(Icons.edit_document),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 15,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                color: Colors.black
                                                    .withOpacity(0.075),
                                                blurRadius: 5,
                                              )
                                            ],
                                          ),
                                          child: Center(
                                            child: Icon(Icons.more_horiz),
                                          ),
                                        ),
                                        items: [
                                          ...MenuItems.firstItems.map(
                                            (item) =>
                                                DropdownMenuItem<MenuItem>(
                                              value: item,
                                              child: MenuItems.buildItem(item),
                                            ),
                                          ),
                                          const DropdownMenuItem<Divider>(
                                              enabled: false, child: Divider()),
                                          ...MenuItems.secondItems.map(
                                            (item) =>
                                                DropdownMenuItem<MenuItem>(
                                              value: item,
                                              child: MenuItems.buildItem(item),
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          MenuItems.onChanged(context,
                                              value! as MenuItem, users[index]);
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          width: 200,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          offset: const Offset(0, 8),
                                        ),
                                        menuItemStyleData: MenuItemStyleData(
                                          customHeights: [
                                            ...List<double>.filled(
                                                MenuItems.firstItems.length,
                                                48),
                                            8,
                                            ...List<double>.filled(
                                                MenuItems.secondItems.length,
                                                48),
                                          ],
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: searching
                        ? CircularProgressIndicator(
                            color: Globals.primaryColor,
                          )
                        : Text("No users. Click add to start."))),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [history, settings];
  static const List<MenuItem> secondItems = [remove];

  static const history = MenuItem(text: 'History', icon: Icons.history);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const remove = MenuItem(text: 'Remove', icon: Icons.close);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon,
            color: item.text == 'Remove' ? Colors.orange : Colors.black,
            size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: TextStyle(
              color: item.text == 'Remove' ? Colors.orange : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item, User user) {
    switch (item) {
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.history:
        Globals.openAlert(HistoryAlert(user: user), dismissable: false);
        break;
      case MenuItems.remove:
        //Do something
        break;
    }
  }
}
