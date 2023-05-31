import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rap_trial/screens/admin_login.dart';
import 'package:rap_trial/screens/player_profile.dart';
import 'package:rap_trial/services/auth_services.dart';
import 'package:rap_trial/screens/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _loginUser() async {
    _isLoading = true;
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String res = await AuthServices.login(email: email, password: password);
    _isLoading = false;

    if (res != "Success") {
      Fluttertoast.showToast(
          msg: "Password is incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PlayerProfile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/rap1.png'),
                      fit: BoxFit.fill)),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              height: 550,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'WELCOME',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: Colors.white70),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 65,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _usernameController,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              116, 188, 180, 180))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              116, 188, 180, 180))),
                                  hintText: "USERNAME",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                      color:
                                          Color.fromARGB(116, 188, 180, 180))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              116, 188, 180, 180))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              116, 188, 180, 180))),
                                  hintText: "PASSWORD",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                      color:
                                          Color.fromARGB(116, 188, 180, 180))),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Container(
                          child: Column(children: [
                        ElevatedButton(
                            onPressed: () {
                              _loginUser();
                            },
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                backgroundColor:
                                    const Color.fromARGB(255, 128, 186, 124)),
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )),
                      ])),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminLogin()));
                      },
                      child: const Text(
                        "LOGIN AS COACH ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 62, 168, 149),
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(color: Color.fromARGB(255, 62, 168, 149), fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        "SIGNUP",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 62, 168, 149),
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
