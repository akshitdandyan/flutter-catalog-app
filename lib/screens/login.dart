import 'package:flutter/material.dart';
import 'package:wordpair_generator/screens/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        // color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Image.asset('assets/images/music.jpg'),
        Text(
          "Welcome $username!",
          style: TextStyle(color: Colors.red),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter username";
              }
              return null;
            },
            onChanged: (value) {
              username = value;
              setState(() => {});
            },
            decoration: InputDecoration(
                hintText: "username",
                labelText: "Enter Username",
                fillColor: Colors.purple,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter password";
              } else if (value.length < 6) {
                return "Invalid password";
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
                hintText: "password",
                labelText: "Enter Password",
                fillColor: Colors.purple,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        SizedBox(height: 20),
        Material(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
          child: InkWell(
            onTap: () => moveToHome(context),
            child: AnimatedContainer(
              width: changeButton ? 50 : 100,
              height: 40,
              alignment: Alignment.center,
              child: changeButton
                  ? Icon(Icons.done)
                  : Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
              duration: Duration(seconds: 1),
            ),
          ),
        ),
        // ElevatedButton(onPressed: () => Navigator.pushNamed(context, AppRoutes.homeRoute), child: Text("Login"),style: TextButton.styleFrom(minimumSize: Size(100,40)),)
      ]),
    )));
  }
}
