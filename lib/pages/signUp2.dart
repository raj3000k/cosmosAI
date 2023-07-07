import 'package:flutter/material.dart';
import 'package:sample_app/pages/disabilitySelect.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  String fullName = '\0';
  String email = '\0';
  String phoneNumber = '\0';
  @override
  Widget build(BuildContext context) {
    String hexColor = "#454545";
    Color color1 =
        Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black,
          width: width,
          child: Column(children: [
            Image.asset(
              'assets/images/AbleGOLogo1.png',
              height: 250,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, spreadRadius: 3),
                      ],
                      border: Border(),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Full Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  fullName = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Mobile Number',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                });
                              },
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (fullName == '\0' ||
                                      email == '\0' ||
                                      phoneNumber == '\0') {
                                    Fluttertoast.showToast(
                                        msg: "Please Complete all the fields",
                                        toastLength: Toast.LENGTH_LONG,
                                        fontSize: 20,
                                        backgroundColor: Colors.redAccent);
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DisabilitySelect()),
                                    );
                                  }
                                },
                                child: Container(
                                  color: Colors.yellow,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade400,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ), // Background color
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Already Registered? Login',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 300.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Group3.png',
                      height: 250,
                      width: width,
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
