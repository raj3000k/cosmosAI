import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_app/pages/driverTraining.dart';

class DriverSignUp extends StatefulWidget {
  const DriverSignUp({key});

  @override
  State<DriverSignUp> createState() => _DriverSignUpState();
}

class _DriverSignUpState extends State<DriverSignUp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  height: 500,
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
                          'Driver Registration',
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
                                setState(() {});
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
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Driver License Number',
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Car Brand',
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Car Model',
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (fullName == '\0' ||
                                  //     email == '\0' ||
                                  //     phoneNumber == '\0') {
                                  //   Fluttertoast.showToast(
                                  //       msg: "Please Complete all the fields",
                                  //       toastLength: Toast.LENGTH_LONG,
                                  //       fontSize: 20,
                                  //       backgroundColor: Colors.redAccent);
                                  // } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DriverTraining()),
                                  );
                                  // }
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

                          // Google Sign In

                          // Container(
                          //   child: _isLoggedIn
                          //       ? Center(
                          //           child: Column(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             children: [
                          //               // Image.network(_userObj.photoUrl!),
                          //               // const SizedBox(
                          //               //   height: 2,
                          //               // ),
                          //               // Text(_userObj.displayName!),
                          //               // const SizedBox(
                          //               //   height: 2,
                          //               // ),
                          //               // Text(_userObj.email),
                          //               // const SizedBox(
                          //               //   height: 2,
                          //               // ),
                          //               MaterialButton(
                          //                 onPressed: () {
                          //                   Navigator.push(
                          //                     context,
                          //                     MaterialPageRoute(
                          //                         builder: (context) =>
                          //                             DisabilitySelect()),
                          //                   );

                          //                   _googleSignIn
                          //                       .signOut()
                          //                       .then((value) {
                          //                     setState(() {
                          //                       _isLoggedIn = false;
                          //                     });
                          //                   }).catchError((e) {});
                          //                 },
                          //                 height: 50,
                          //                 minWidth: 100,
                          //                 color: Colors.blue,
                          //                 child: const Text(
                          //                   'Next',
                          //                   style:
                          //                       TextStyle(color: Colors.white),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         )
                          //       : Center(
                          //           child: ElevatedButton.icon(
                          //           onPressed: () {
                          //             _googleSignIn.signIn().then((userData) {
                          //               setState(() {
                          //                 _isLoggedIn = true;
                          //                 _userObj = userData!;
                          //               });
                          //             }).catchError((e) {
                          //               print(e);
                          //             });
                          //           },
                          //           style: ElevatedButton.styleFrom(
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12),
                          //             ),
                          //             primary: Colors.blue,
                          //             onPrimary:
                          //                 Colors.white, // Background color
                          //           ),
                          //           icon: Icon(Icons.login),
                          //           label: Text("SignIn With Google"),
                          //         )),
                          // ),

                          // Google SignIn Code Ends
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
                // Container(
                //   margin: EdgeInsets.only(top: 300.0),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Image.asset(
                //       'assets/images/Group3.png',
                //       height: 250,
                //       width: width,
                //     ),
                //   ),
                // )
              ],
            ),
          ]),
        ));
  }
}
