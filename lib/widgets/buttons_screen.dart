// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonState();
}

enum SingingCharacter { check1, check2 }

class _ButtonState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttons")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            toggleButtonsWidget(),
            toggleButtonsWidgetMultiple(),
            const Divider(),
            checkBoxButton(),
            const Divider(),
            radioButton(),
            const Divider(),
            simpleSwitchButton(),
            customSwitchButton(),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  print("My Elevated button clicked");
                },
                child: const Text("My ElevatedButton")),
            ElevatedButton.icon(
                onPressed: () {
                  print("My ElevatedButton Icon Button clicked");
                },
                icon: const Icon(Icons.man),
                label: const Text(" ElevatedButton Icon")),
            const Divider(),
            TextButton(
                onPressed: () {
                  print("My Text button clicked");
                },
                child: const Text("My TextButton")),
            TextButton.icon(
                onPressed: () {
                  print("My Text Icon Button clicked");
                },
                icon: const Icon(Icons.man),
                label: const Text("TextButton Icon")),
          ],
        ),
      ),
    );
  }

  //-----------------------Checkbox-----------------------------

  final MaterialStateProperty<Color?> color1 =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.red;
    }
    return Colors.white;
  });

  bool value = false;
  Widget checkBoxButton() {
    return ListTile(
      title: const Text('Read this text for checkbox'),
      leading: Checkbox(
        fillColor: color1,
        value: value,
        onChanged: (value1) {
          setState(() {
            value = value1!;
          });
        },
      ),
    );
  }
  //-----------------------Radio-----------------------------

  SingingCharacter? _character = SingingCharacter.check1;

  Widget radioButton() {
    return Column(
      children: [
        ListTile(
          title: const Text('Radio 1'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.check1,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Radio 2'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.check2,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        )
      ],
    );
  }

  //-----------------------Switch-----------------------------
  bool light0 = true;
  Widget simpleSwitchButton() {
    return Switch(
      thumbIcon: thumb1,
      value: light0,
      onChanged: (bool value) {
        setState(() {
          light0 = value;
        });
      },
    );
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  final MaterialStateProperty<Icon?> thumb1 =
      MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.man);
    }
    return const Icon(Icons.abc);
  });

  bool light1 = true;
  Widget customSwitchButton() {
    return Switch(
      thumbIcon: thumbIcon,
      value: light1,
      onChanged: (bool value) {
        setState(() {
          light1 = value;
        });
      },
    );
  }

//-----------------------ToggleButtons-----------------------------
  final List<bool> selectedToggleIndex = <bool>[false, false, true];

  List<Widget> icons = <Widget>[
    const Icon(Icons.sunny),
    const Icon(Icons.cloud),
    const Icon(Icons.ac_unit),
  ];

  Widget toggleButtonsWidget() {
    return ToggleButtons(
      isSelected: selectedToggleIndex,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 100.0,
      ),
      onPressed: (int index) {
        setState(() {
          //Single select Login

          for (int buttonIndex = 0;
              buttonIndex < selectedToggleIndex.length;
              buttonIndex++) {
            selectedToggleIndex[buttonIndex] = buttonIndex == index;
          }
        });
      },
      children: icons,
    );
  }

  final List<bool> selectedToggleIndex1 = <bool>[false, false, true];

  List<Widget> fruits = <Widget>[
    const Text('Apple'),
    const Text('Banana'),
    const Text('Orange')
  ];
  Widget toggleButtonsWidgetMultiple() {
    return ToggleButtons(
      isSelected: selectedToggleIndex1,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 100.0,
      ),
      onPressed: (int index) {
        setState(() {
          selectedToggleIndex1[index] = !selectedToggleIndex1[index];
        });
      },
      children: fruits,
    );
  }
}
