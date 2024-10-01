import 'package:flutter/material.dart';
import 'HomePage.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String _username = "";
  String _password = "";
  String? _nickname;
  bool isClicked = false;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  username: _username,
                  nickname: _nickname,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            TextFormField(
              enabled: true,
              onChanged: (value) {
                _nickname = value;
              },
            ),
            _loginButton(context)
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan Username',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    width: 100,
                    color: const Color.fromARGB(255, 236, 104, 148))),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    width: 100,
                    color: const Color.fromARGB(255, 236, 104, 148))),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked == true
              ? WidgetStateProperty.all(const Color.fromARGB(255, 243, 33, 149))
              : WidgetStateProperty.all(
                  const Color.fromARGB(255, 236, 128, 169)),
        ),
        onPressed: () {
          if (_username == "flutter" && _password == "mobile") {
            _navigateToHome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil'),
              ),
            );
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
