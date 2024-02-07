// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_app/widgets/album_screen.dart';
import 'package:test_app/widgets/buttons_screen.dart';
import 'package:test_app/widgets/calculator_screen.dart';
import 'package:test_app/widgets/image_screen.dart';
import 'package:test_app/widgets/textfield_screen.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/modals.dart';
import 'package:test_app/views/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  var dataArray = [
    HomeData("TextFields", const Icon(Icons.text_fields), ListItem.textfields),
    HomeData("Album", const Icon(Icons.album), ListItem.album),
    HomeData("Calculator", const Icon(Icons.calculate), ListItem.calculator),
    HomeData("Map", const Icon(Icons.map), ListItem.map),
    HomeData(
        "Buttons", const Icon(Icons.radio_button_checked), ListItem.button),
    HomeData("Images", const Icon(Icons.image), ListItem.images),
    HomeData("Animations", const Icon(Icons.animation), ListItem.animation)
  ];

  ListType listType = ListType.listView;

  Widget createPopUpMenu() {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "List.Builder",
                  style: (listType == ListType.listView)
                      ? const TextStyle(color: Colors.green)
                      : const TextStyle(color: Colors.black),
                ),
                onTap: () {
                  setState(() {
                    listType = ListType.listView;
                  });
                },
              ),
              PopupMenuItem(
                child: Text(
                  "Grid View",
                  style: (listType == ListType.gridView)
                      ? const TextStyle(color: Colors.green)
                      : const TextStyle(color: Colors.black),
                ),
                onTap: () {
                  setState(() {
                    listType = ListType.gridView;
                  });
                },
              )
            ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: const Text("AIT Tutorial"),
          actions: <Widget>[createPopUpMenu()],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: (listType == ListType.listView)
                          ? createListBuilder()
                          : createGridList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // ---------------------- GridView.builder -----------------

Widget createGridList() {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      children: List.generate(dataArray.length, (index) {
        var item = dataArray[index];
        return GestureDetector(
            onTap: () {
              // print(item.title);
              itemCellSelected(item);
            },
            child: Card(
              // padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item.icon,
                    Text(item.title),
                  ],
                ),
              ),
            ));
      }),
    );
  }

  // ---------------------- ListView.builder -----------------
  Widget createListBuilder() {
    return ListView.builder(
      // scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext ctxt, int index) {
        var item = dataArray[index];
        return Column(
          children: [getListTile(item), const Divider()],
        );
      },
      itemCount: dataArray.length,
    );
  }  

  Widget getListTile(var item) {
    return ListTile(
      leading: item.icon,
      title: Text(item.title),
      onTap: () => itemCellSelected(item),
    );
  }

  void itemCellSelected(HomeData item) {
    if (item.type == ListItem.textfields) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const TextFields()));
    } else if (item.type == ListItem.album) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AlbumScreen()));
    } else if (item.type == ListItem.calculator) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>  const CalculatorScreen()));
    } else if (item.type == ListItem.images) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ImageScreen()));
    } else if (item.type == ListItem.button) {
      
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>  const ButtonScreen()));
    }
    else {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Al()))
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Comming Soon..."),
      ));
    }
  }
}
