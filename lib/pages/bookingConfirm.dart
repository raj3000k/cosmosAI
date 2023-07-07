import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_app/pages/mapTesting.dart';

class ConfirmBooking extends StatefulWidget {
  final String carName;
  final String driverName;
  final String carNumber;

  const ConfirmBooking({
    Key? key,
    required this.carName,
    required this.driverName,
    required this.carNumber,
  }) : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA';

  static const String mapBoxStyleId = 'cljieeo5b002d01o40q7fdqs1';

  static final myLocation = LatLng(21.250000, 81.629997);
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    var points = <LatLng>[
      new LatLng(21.2441408, 81.6319132),
      new LatLng(21.252193, 81.6044256)
    ];

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                minZoom: 10,
                maxZoom: 20,
                zoom: 13,
                center: AppConstants.myLocation),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/harshu0711/cljieeo5b002d01o40q7fdqs1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA",
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      point: LatLng(21.2441408, 81.6319132),
                      builder: (_) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/location.png',
                            ));
                      }),
                  Marker(
                      point: LatLng(21.252193, 81.6044256),
                      builder: (_) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/locationGreen.png',
                            ));
                      })
                ],
              ),
              PolylineLayer(
                polylines: [
                  new Polyline(
                      points: points,
                      strokeWidth: 5,
                      color: Colors.blue.shade400)
                ],
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 300,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 10, left: 120),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Booking Confirmed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/driverIcon.png'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Text(
                                  widget.carName,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  widget.carNumber,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  widget.driverName,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.green,
                            margin: EdgeInsets.only(left: 35),
                            child: Text(
                              'OTP: 4251',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.sos,
                                color: Colors.red,
                                size: 40,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 150),
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapTesting()),
                                )
                              },
                              icon: Icon(
                                // <-- Icon
                                Icons.close,
                                size: 24.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              label: Text('CANCEL RIDE'), // <-- Text
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 75),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                bool? isChecked = false;
                                bool? upi = false;
                                return Dialog(
                                  child: Container(
                                    height: 250,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.money,
                                                  color: Colors.green),
                                              Text('Pay By Cash',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                              Checkbox(
                                                  value: isChecked,
                                                  checkColor: Colors.red,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? value1) {
                                                    setState(() {
                                                      isChecked = value1;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                  'assets/images/upi.png',
                                                  height: 50,
                                                  width: 50),
                                              Text('Pay By UPI',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                              Checkbox(
                                                  value: upi,
                                                  checkColor: Colors.red,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? value2) {
                                                    setState(() {
                                                      upi = value2;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.credit_card,
                                                  color: Colors.green),
                                              Text('Pay By Card',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                              Checkbox(
                                                  value: isChecked,
                                                  checkColor: Colors.red,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? value1) {
                                                    setState(() {
                                                      isChecked = value1;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.handshake_outlined,
                                                  color: Colors.green),
                                              Text('AbleGo PayLater',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                              Checkbox(
                                                  value: isChecked,
                                                  checkColor: Colors.red,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? value1) {
                                                    setState(() {
                                                      isChecked = value1;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green))
                                      ],
                                    ),
                                  ),
                                );
                              })
                        },
                        icon: Icon(
                          // <-- Icon
                          Icons.money,
                          size: 24.0,
                          color: Colors.green,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        label: Text(
                          'Choose Payment Method',
                          style: TextStyle(color: Colors.green),
                        ), // <-- Text
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
