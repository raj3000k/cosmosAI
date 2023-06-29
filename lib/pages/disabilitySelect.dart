import 'package:flutter/material.dart';

class DisabilitySelect extends StatefulWidget {
  const DisabilitySelect({super.key});

  @override
  State<DisabilitySelect> createState() => _DisabilitySelectState();
}

class _DisabilitySelectState extends State<DisabilitySelect> {
  bool hearingSelected = false;
  bool physicalSelected = false;
  bool visualSelected = false;
  String? disablity;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Choose Type Of Disability',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hearingSelected = !hearingSelected;
                      physicalSelected = false;
                      visualSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Background color
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5,
                            color: hearingSelected
                                ? Colors.yellow
                                : Colors.black)),
                    child: Image.asset(
                      'assets/images/hearing.png',
                      height: 150,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                'Hearing',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      physicalSelected = !physicalSelected;
                      hearingSelected = false;
                      visualSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Background color
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5,
                            color: physicalSelected
                                ? Colors.yellow
                                : Colors.black)),
                    child: Image.asset(
                      'assets/images/physical.jpg',
                      height: 130,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                'Physical',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      visualSelected = !visualSelected;
                      physicalSelected = false;
                      hearingSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Background color
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5,
                            color:
                                visualSelected ? Colors.yellow : Colors.black)),
                    child: Image.asset(
                      'assets/images/visual.jpg',
                      height: 130,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                'Hearing',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 250),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignUp2()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), //<-- SEE HERE
                    padding: EdgeInsets.all(20),
                  ),
                  child: Container(
                    child: Icon(
                      //<-- SEE HERE
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 34,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
