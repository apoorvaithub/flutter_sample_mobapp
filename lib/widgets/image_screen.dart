// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ImageState();
}

class _ImageState extends State<ImageScreen> {
// Instance of Image picker

  File? _selectedImage;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AIT"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (item) => () {
              print("-----------imageview-----------");
              switch (item) {
                case 'Logout':
                  print("object Logout ----------------- -");
                  break;
                case 'Settings':
                  print("object Settings ------------------ ");
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: _selectImageFromGalaey,
                    child: const Text("Select image from galary")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => const ProfileScreen()));
                    },
                    child: const Text("Back screen")),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  height: MediaQuery.of(context).size.width - 120,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!, fit: BoxFit.fill)
                          : Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox.fromSize(
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!, fit: BoxFit.cover)
                          : Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectImageFromGalaey() async {
    final imgReturned =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(imgReturned!.path);
    });
  }
}
