// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AlbumState();
}

class ItemArray {
  File selectedImage;
  String title;
  ItemArray(this.selectedImage, this.title);
}

class _AlbumState extends State<AlbumScreen> {
  List<ItemArray> pages = [
    ItemArray(
        File(
            '/Users/Amit/Library/Developer/CoreSimulator/Devices/98F913F6-B2D5-486A-B128-8523FBA137F6/data/Containers/Data/Application/C0F616F5-BB2C-492D-88A3-0B99D37ECA33/tmp/image_picker_238DB06A-1B4F-47C3-8413-677400102AC3-4140-00000B93FB276EAF.jpg'),
        "title"),
    ItemArray(
        File(
            '/Users/Amit/Library/Developer/CoreSimulator/Devices/98F913F6-B2D5-486A-B128-8523FBA137F6/data/Containers/Data/Application/C0F616F5-BB2C-492D-88A3-0B99D37ECA33/tmp/image_picker_238DB06A-1B4F-47C3-8413-677400102AC3-4140-00000B93FB276EAF.jpg'),
        "title"),
    ItemArray(
        File(
            '/Users/Amit/Library/Developer/CoreSimulator/Devices/98F913F6-B2D5-486A-B128-8523FBA137F6/data/Containers/Data/Application/C0F616F5-BB2C-492D-88A3-0B99D37ECA33/tmp/image_picker_238DB06A-1B4F-47C3-8413-677400102AC3-4140-00000B93FB276EAF.jpg'),
        "title")
  ];

  Future<void> _selectImageFromGalaey() async {
    final imgReturned =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      File? selectedImage = File(imgReturned!.path);
      pages.add(ItemArray(selectedImage, "title"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Album"),
        actions: <Widget>[
          IconButton(
              onPressed: _selectImageFromGalaey,
              icon: const Icon(Icons.add_a_photo_outlined))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          toggleButtonsWidgetMultiple(),
          // setGridAlbum(),
          // horizontalList(),

          if (pages.isEmpty) ...[
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 100,
              width: 300,
              child: Text(
                  "There are no image added. please add your first image by tapping add image icon on top left"),
            ),
          ] else if (toggleSelected[0] == true) ...[
            settoggleSelectedUI()
          ] else ...[
            setGridAlbum()
          ]
        ],
      )),
    );
  }

  // declare and initizlize the page controller
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  Widget settoggleSelectedUI() {
    return Expanded(
        child: Stack(
      children: [
        createPageView(),
        setPageIndicator(),
      ],
    ));
  }

  Widget createPageView() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 45),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext conxt, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              pages[index].selectedImage,
              fit: BoxFit.fitWidth,
            ),
          );
        },
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _activePage = page;
          });
        },
        itemCount: pages.length,
      ),
    );
  }

  Widget setPageIndicator() {
    return Positioned(
      bottom: 0,
      left: 20,
      right: 20,
      height: 40,
      child: Container(
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
              pages.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            _activePage == index ? Colors.amber : Colors.grey,
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

//------------------GRIDView------------------------
  Widget setGridAlbum() {
    return Expanded(
      child: GridView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                print("item.title");
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GridTile(
                  footer: const Text("Footer test showing"),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(pages[index].selectedImage,
                        fit: BoxFit.fill),
                  ),
                ),
              ));
        },
      ),
    );
  }

  final List<bool> toggleSelected = <bool>[true, false];

  List<Widget> styleItem = <Widget>[
    const Icon(Icons.pages_sharp),
    const Icon(Icons.grid_4x4)
  ];

  Widget toggleButtonsWidgetMultiple() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ToggleButtons(
          isSelected: toggleSelected,
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < toggleSelected.length;
                  buttonIndex++) {
                toggleSelected[buttonIndex] = buttonIndex == index;
              }
            });
          },
          children: styleItem,
        )
      ],
    );
  }
}
