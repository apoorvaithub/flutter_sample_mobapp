import 'package:flutter/material.dart';
import 'package:test_app/widgets/home_screen.dart';
import 'package:test_app/widgets/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            // backgroundColor: Colors.blueAccent,
          ),
          body: SafeArea(
            child: getTextfieldsContiner(),
          ),
        ));
  }

  Widget getTextfieldsContiner() {
    final TextEditingController editingcontrollerMobile =
        TextEditingController();
    final TextEditingController editingcontrollerPass = TextEditingController();
    final FocusNode focusnodeMobile = FocusNode();
    final FocusNode focusnodePassword = FocusNode();

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            focusNode: focusnodeMobile,
            controller: editingcontrollerMobile,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                hintText: 'Ex.- 7488705690',
                hintStyle: TextStyle(color: Colors.grey),
                labelText: 'Mobile Number',
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.green,
                ),
                suffixStyle: TextStyle(color: Colors.green)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: editingcontrollerPass,
            focusNode: focusnodePassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide()),
                labelText: "Password",
                prefixIcon: Icon(Icons.password,color: Colors.green,),
                ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                // print(_editingcontroller.text);
                // if (_editingcontroller.text == "") {
                //   FocusScope.of(context).requestFocus(_focusnode);
                // }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
              },
              child: const Text("New User? Register"))
        ],
      ),
    );
  }
}
