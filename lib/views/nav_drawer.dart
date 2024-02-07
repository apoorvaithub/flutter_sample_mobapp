import 'package:flutter/material.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/modals.dart';
import 'package:test_app/widgets/login_screen.dart';
import 'package:test_app/widgets/profile_screen.dart';
import 'package:test_app/widgets/setting_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataArray = [
      ListData("Profile", const Icon(Icons.person), MenuItem.profile),
      ListData("Settings", const Icon(Icons.settings), MenuItem.setting),
      ListData("Logout", const Icon(Icons.logout), MenuItem.logout)
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/amit.jpg'))),
            child: Row(
              children: [
                Text(
                  'Side menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ),
          for (var item in dataArray) ...[
            ListTile(
              leading: item.icon,
              title: Text(item.title),
              onTap: () => {
                if (item.menuItem == MenuItem.logout)
                  {showAlertDialog(context)}
                else if (item.menuItem == MenuItem.profile)
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()))
                  }
                else if (item.menuItem == MenuItem.setting)
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingScreen()))
                  }
              },
            ),
            const Divider()
          ],
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
