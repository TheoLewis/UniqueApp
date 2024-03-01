import 'package:flutter/material.dart';
import 'package:uniquepartners/Views/Widgets/CustomButton.dart';
import 'package:uniquepartners/Views/Widgets/CustomTextField.dart';

class AddUserSheet extends StatefulWidget {
  final Function(String name, String email) callback;
  AddUserSheet({required this.callback, super.key});

  @override
  State<AddUserSheet> createState() => _AddUserSheetState();
}

class _AddUserSheetState extends State<AddUserSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 100,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 50,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add User",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Container(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Icon(Icons.close),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            CustomTextField(
              "Enter name",
              controller: nameController,
              radius: 8,
            ),
            Container(
              height: 10,
            ),
            CustomTextField(
              "Enter email",
              controller: emailController,
              radius: 8,
            ),
            Container(
              height: 25,
            ),
            CustomButton(
              buttonText: "Add User",
              onPressed: () {
                widget.callback(nameController.text, emailController.text);
              },
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
