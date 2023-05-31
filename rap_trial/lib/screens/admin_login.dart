import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rap_trial/screens/admin_signup.dart';
import 'package:rap_trial/screens/login_page.dart';
import 'package:rap_trial/services/auth_services.dart';
import 'package:rap_trial/screens/signup_page.dart';
import 'admin_profile.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
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
          MaterialPageRoute(builder: (context) => const AdminProfile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rap2.png'),
                        fit: BoxFit.fill)),
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
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
                      'WELCOME',
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
                            height: 65,
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
                                  hintText: "ADMIN NAME",
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
                      height: 70,
                    ),
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _loginUser();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 99, 188, 92)),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminSignUp()));
                            },
                            child: Text(
                              "SIGNUP AS COACH ",
                              style: TextStyle(
                                  fontSize: 20,
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
