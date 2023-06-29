import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  String? fullName;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                            hintText: 'Mobile Number',
                          ),
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Container(
                                color: Colors.yellow,
                                child: Text('Register'),
                              ))),
                      Container(
                          margin: EdgeInsets.only(top: 0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, // Background color
                              ),
                              child: Container(
                                child: Text(
                                  'Already Registered? Login',
                                  style: TextStyle(
                                    color: Colors.black,
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