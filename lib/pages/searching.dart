import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sample_app/pages/bookingConfirm.dart';

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
  String driverName = '';
  String carName = '';
  String carNumber = '';
  int cabFare = 0;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  // ),
                  (widget.wheelChairSelected
                      ? Image.asset('assets/images/wheelchairCab.png',
                          height: 100, width: 100)
                      : Container()),
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  // ),
                  (widget.onboardingSelected
                      ? Image.asset('assets/images/onboarding.png',
                          height: 70, width: 70)
                      : Container()),
                  // Padding(
                  //   padding: EdgeInsets.all(10),
                  // ),
                  (widget.signSelected
                      ? Image.asset('assets/images/signLanguage.png',
                          height: 60, width: 60)
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
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/cabSedan.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 10),
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
                              'Driver: Mukesh Kumar',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Container(
                              height: 20,
                              child: RatingBar(
                                  initialRating: 4,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(Icons.star,
                                          color: Colors.amber),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Colors.amber,
                                      ),
                                      empty: const Icon(
                                        Icons.star_outline,
                                        color: Colors.amber,
                                      )),
                                  onRatingUpdate: (value) {}),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Text(
                              'ETA',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '7 Minutes',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'Expected Fare',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Rs. 120',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 5),
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      carName = 'Honda City';
                                      carNumber = 'CG 04 A 5252';
                                      driverName = 'Mukesh Kumar';
                                      cabFare = 12000;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmBooking(
                                                  carName: carName,
                                                  driverName: driverName,
                                                  carNumber: carNumber,
                                                  cabFare: cabFare,
                                                )));
                                  },
                                  child: Text('Book Now')),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/miniCab.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              'Tata Tiago',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Category: Mini',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Driver: Sanjeev Mishra ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Container(
                              height: 20,
                              child: RatingBar(
                                  initialRating: 4.5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(Icons.star,
                                          color: Colors.amber),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Colors.amber,
                                      ),
                                      empty: const Icon(
                                        Icons.star_outline,
                                        color: Colors.amber,
                                      )),
                                  onRatingUpdate: (value) {}),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Text(
                              'ETA',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '5 Minutes',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'Expected Fare',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Rs. 100',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 5),
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      carName = 'Tata Tiago';
                                      carNumber = 'DL 04 A 2552';
                                      driverName = 'Sanjeev Kumar';
                                      cabFare = 10000;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmBooking(
                                                  carName: carName,
                                                  driverName: driverName,
                                                  carNumber: carNumber,
                                                  cabFare: cabFare,
                                                )));
                                  },
                                  child: Text('Book Now')),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/suvCab.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Text(
                              'Hyundai Creta',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Category: SUV',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Driver: Mick Daniel ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Container(
                              height: 20,
                              child: RatingBar(
                                  initialRating: 4.5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(Icons.star,
                                          color: Colors.amber),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Colors.amber,
                                      ),
                                      empty: const Icon(
                                        Icons.star_outline,
                                        color: Colors.amber,
                                      )),
                                  onRatingUpdate: (value) {}),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Text(
                              'ETA',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '5 Minutes',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              'Expected Fare',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Rs. 150',
                              style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 5),
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      carName = 'Hyundai Creta';
                                      carNumber = 'MH 04 A 6752';
                                      driverName = 'Mick Daniel';
                                      cabFare = 15000;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmBooking(
                                                  carName: carName,
                                                  driverName: driverName,
                                                  carNumber: carNumber,
                                                  cabFare: cabFare,
                                                )));
                                  },
                                  child: Text('Book Now')),
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
