import 'package:flutter/material.dart';
import 'package:shopify/Login.dart';
//import 'pages.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool scureText = true;
  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                children: [
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "shopify",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 70,
                                  color: Color(0xffF25E3D)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              "Sign up now to gain sale%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter username";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "username",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(155, 242, 94, 61)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffF25E3D)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                labelStyle: TextStyle(color: Color(0xffF25E3D)),
                                prefixIconColor: Color(0xffF25E3D)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(155, 242, 94, 61)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffF25E3D)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                labelStyle: TextStyle(color: Color(0xffF25E3D)),
                                prefixIconColor: Color(0xffF25E3D)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!value!.contains("@")) {
                                  return "enter valid mail";
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              obscureText: scureText,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                labelText: "password",
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      scureText = !scureText;
                                    });
                                  },
                                  icon: Icon(Icons.visibility),
                                  tooltip: 'Toggle Obscure Text',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(155, 242, 94, 61)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffF25E3D)),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                labelStyle: TextStyle(color: Color(0xffF25E3D)),
                                prefixIconColor: Color(0xffF25E3D),
                                suffixIconColor: Color(0xffF25E3D),
                              ),
                              validator: (value) {
                                //RegExp regex = RegExp(
                                //r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: screenWidth * 4 / 5,
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                primary: Color(0xffF25E3D), // Background color
                              ),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
