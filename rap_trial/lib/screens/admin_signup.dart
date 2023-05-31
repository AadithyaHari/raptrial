import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rap_trial/screens/admin_login.dart';
import 'package:rap_trial/screens/player_profile.dart';
import 'package:rap_trial/services/auth_services.dart';

import 'admin_profile.dart';
import 'login_page.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
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

  _signupUser() async {
    _isLoading = true;
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String res = await AuthServices.signup(email: email, password: password);
    _isLoading = false;

    if (res != "Success") {
      Fluttertoast.showToast(
          msg: "Password is incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayerProfile()));
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
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rap6.png'),
                        fit: BoxFit.fill)),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyLoginPage()));
                        },
                        child: Text(
                          "BACK",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'GET STARTED',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: Colors.white70),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _usernameController,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
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
                                  hintText: "EMAIL",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                      color:
                                          Color.fromARGB(116, 188, 180, 180))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
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
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _signupUser();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 99, 188, 92)),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "OR SIGNUP WITH",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 62, 168, 149),
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                size: 37,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminLogin()));
                            },
                            child: Text(
                              "I AM ALREADY A MEMBER",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 62, 168, 149),
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ]));
  }
}
