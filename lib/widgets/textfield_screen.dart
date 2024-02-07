// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFields> {
  var isTextFields = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Gester detecter tapped");
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: isTextFields == true
                ? const Text("AIT / Textfields")
                : const Text("AIT / TextFormField"),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text("Textfields"),
                    onTap: () {
                      setState(() {
                        isTextFields = true;
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("TextFormField"),
                    onTap: () {
                      setState(() {
                        isTextFields = false;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(child: getTextfieldsContiner())),
        ));
  }

  Widget getTextfieldsContiner() {
    final TextEditingController editingcontrollerEmail =
        TextEditingController();
    final TextEditingController editingcontrollerMobile =
        TextEditingController();
    final TextEditingController editingcontrollerStory =
        TextEditingController();
    final TextEditingController editingcontrollerDetail =
        TextEditingController();

    final FocusNode focusnodeEmail = FocusNode();
    final FocusNode focusnodeMobile = FocusNode();
    final FocusNode focusnodeStory = FocusNode();
    final FocusNode focusnodeDetail = FocusNode();

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusnodeStory,
            controller: editingcontrollerStory,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short, this is just a demo.',
                labelText: 'Life story',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                suffixStyle: TextStyle(color: Colors.green)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusnodeEmail,
            controller: editingcontrollerEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                hintText: 'Enter your email',
                labelText: "Email id:",
                prefixIcon: Icon(Icons.email)),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(FocusNode());
              String email = editingcontrollerEmail.text;
              final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email);
              if (emailValid) {
                setState(() {
                  isTextFields = true;
                });
              } else {
                setState(() {
                  isTextFields = false;
                });
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: editingcontrollerMobile,
            focusNode: focusnodeMobile,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                labelText: "Enter your Mobile Number",
                prefixIcon: Icon(Icons.phone_android)
                ),
                
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusnodeDetail,
            controller: editingcontrollerDetail,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                hintText: "Enter Description (max 250 chars)",
                icon: Icon(Icons.description)),
            maxLength: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // print(_editingcontroller.text);
                // if (_editingcontroller.text == "") {
                //   FocusScope.of(context).requestFocus(_focusnode);
                // }
              },
              child: const Text("Submit")),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
