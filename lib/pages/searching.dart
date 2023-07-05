import 'package:flutter/material.dart';

class SearchingCab extends StatefulWidget {
  final bool wheelChairSelected;
  final bool onboardingSelected;
  final bool signSelected;
  final String pickUp;
  final String destination;

  const SearchingCab(
      {Key? key,
      required this.wheelChairSelected,
      required this.onboardingSelected,
      required this.signSelected,
      required this.pickUp,
      required this.destination})
      : super(key: key);

  @override
  State<SearchingCab> createState() => _SearchingCabState();
}

class _SearchingCabState extends State<SearchingCab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'Showing Rides Available with',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  (widget.wheelChairSelected
                      ? Image.asset('assets/images/wheelchairCab.png',
                          height: 100, width: 100)
                      : Container()),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  (widget.onboardingSelected
                      ? Image.asset('assets/images/onboarding.png',
                          height: 70, width: 70)
                      : Container()),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  (widget.signSelected
                      ? Image.asset('assets/images/signLanguage.png',
                          height: 70, width: 70)
                      : Container()),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text(
                      'Pick Up: ' + widget.pickUp,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Destination: ' + widget.destination,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/cabSedan.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              'Honda City',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Category: Sedan',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Driver: ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              'ETA',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Category: Sedan',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Driver: ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
