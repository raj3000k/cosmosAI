import 'package:flutter/material.dart';
import 'package:sample_app/pages/DriverMainPage.dart';


class DriverTraining extends StatefulWidget {
  const DriverTraining({key});

  @override
  State<DriverTraining> createState() => _DriverTrainingState();
}

class _DriverTrainingState extends State<DriverTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
              child: Container(
            // margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  "AbleGo 's",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w400,
                      fontSize: 40),
                ),
                Text(
                  "Driver Training Programme",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/in-app.png',
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "In-App Training",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "In-App Training Programme for drivers to tackle specially abled passengers.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/Untitled design.png',
                height: 100,
              ),
              Container(
                // margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Sign Language Training",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Special Sign Language Training to all drivers.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/physicalChallenge.png',
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Physical Challenge Training",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Training to handle all physical challenges and operating wheelchairs.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DriverMain()),
                        );
                      },
                      child: Text(
                        'LATER',
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(onPressed: () {}, child: Text('JOIN NOW'))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
