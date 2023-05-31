import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rap_trial/screens/login_page.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rap_trial/screens/player_profile.dart';
import 'package:rap_trial/screens/profile_setup.dart';
import 'package:rap_trial/services/auth_services.dart';
import 'admin_profile.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signupUser() async {
    _isLoading = true;
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String res = await AuthServices.signup(email: email, password: password);
    _isLoading = false;

    if (res != "Success") {
      Fluttertoast.showToast(
          msg: "Could not sign up",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileSetup()));
    }
  }

  emailExists(email) async {
    String email = _emailController.text.trim();
    bool emailExists = await AuthServices.checkEmailExists(email);
    if (emailExists) {
      Fluttertoast.showToast(
          msg: "Email already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _signupUser();
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rap5.png'),
                        fit: BoxFit.fill)),
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyLoginPage()));
                        },
                        child: const Text(
                          "BACK",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'GET STARTED',
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
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _emailController,
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
                                  hintText: "EMAIL",
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
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              emailExists(_emailController);
                             
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 99, 188, 92)),
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "OR SIGNUP WITH",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 62, 168, 149),
                                decoration: TextDecoration.underline),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.facebook,
                                size: 37,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                FontAwesomeIcons.instagram,
                                size: 35,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyLoginPage()));
                            },
                            child: const Text(
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
