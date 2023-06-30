import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:sample_app/pages/signUp2.dart';

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
  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "Sign Up":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp2()),
        );
        break;
      case "back":
        Navigator.pop(context);
        break;
      default:
        debugPrint("Unknown command");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    AlanVoice.addButton(
        "6b6a477a86044fbf22648922a9a4176f2e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Handle commands from Alan AI Studio

    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
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
