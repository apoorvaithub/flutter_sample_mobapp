// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  String selectedGender = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Gester detecter tapped");
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Register"),
          ),
          body: SafeArea(
              child: SingleChildScrollView(child: getTextfieldsContiner())),
        ));
  }

  Widget getTextfieldsContiner() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          profilePicImage(),
          const SizedBox(
            height: 20,
          ),
          enterMobileTextfield(),
          const SizedBox(
            height: 10,
          ),
          emailIdTextField(),
          const SizedBox(
            height: 10,
          ),
          dateOfBirthPicker(),
          const SizedBox(
            height: 10,
          ),
          selectGender(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                print("Fetch all data and save to data base");
              },
              child: const Text("Submit")),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  File? _selectedImage;

  Future<void> _selectImageFromGalaey() async {
    print("_selectImageFromGalaey........");
    final imgReturned =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(imgReturned!.path);
    });
  }

  Widget profilePicImage() {
    return InkWell(
      onTap: () {
        _selectImageFromGalaey();
      },
      child: Container(
        width: 200,
        height: 200,
        
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 3),
          boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
        ),
        child: ClipOval(
          child: SizedBox.fromSize(
            child: _selectedImage != null
                ? Image.file(_selectedImage!, fit: BoxFit.fill)
                : Image.asset("assets/logo_ait.png",fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  final TextEditingController editingcontrollerMobile = TextEditingController();
  final FocusNode focusnodeMobile = FocusNode();
  Widget enterMobileTextfield() {
    return TextField(
      controller: editingcontrollerMobile,
      focusNode: focusnodeMobile,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          labelText: "Mobile Number:",
          hintText: "Enter your mobile number",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.phone_android)),
    );
  }

  final TextEditingController editingcontrollerEmail = TextEditingController();
  final FocusNode focusnodeEmail = FocusNode();
  Widget emailIdTextField() {
    return TextField(
      focusNode: focusnodeEmail,
      controller: editingcontrollerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          hintText: 'Enter your email',
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "Email id:",
          prefixIcon: Icon(Icons.email)),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        String email = editingcontrollerEmail.text;
        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        if (emailValid) {
          print("Email enterd");
        } else {
          print("Please enter a valid email");
        }
      },
    );
  }

  Widget selectGender() {
    final List<String> genderItems = ['Male', 'Female', "Can't say"];

    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: "Gender:",
        prefixIcon: const Icon(Icons.man),
        // Add more decoration..
      ),
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {
        //Do something when selected item is changed.
        print("onChanged $value");
      },
    );
  }

  String selectedDateString = "";

  Widget dateOfBirthPicker() {
    return TextField(
        controller: TextEditingController()..text = selectedDateString,
        readOnly: true,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide()),
            labelText: "Date of Birth:",
            hintText: "Please select Date of Birth",
            prefixIcon: Icon(Icons.date_range)),
        onTap: () {
          _selectDate(context);
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateString = DateFormat('dd MMM yyyy').format(selectedDate);
      });
    }
  }
}
