import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sample_app/pages/mapTesting.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/emergency_contact.dart';

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
  List<EmergencyContact> emergencyContacts = [];
  @override
  void initState() {
    super.initState();
    loadEmergencyContacts();
  }

  Future<void> loadEmergencyContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? contacts = prefs.getStringList('emergencyContacts');
    if (contacts != null) {
      setState(() {
        emergencyContacts = contacts
            .map((contact) => EmergencyContact.fromJson(json.decode(contact)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void showAlertDialog(BuildContext context, String title, String message) {
      // set up the buttons
      Widget continueButton = ElevatedButton(
        child: const Text("Continue"),
        onPressed: () {},
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    void handlePaymentErrorResponse(PaymentFailureResponse response) {
      /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
      showAlertDialog(context, "Payment Failed",
          "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    }

    void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
      /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
      showAlertDialog(
          context, "Payment Successful", "Payment ID: ${response.paymentId}");
    }

    void handleExternalWalletSelected(ExternalWalletResponse response) {
      showAlertDialog(
          context, "External Wallet Selected", "${response.walletName}");
    }

    var points = <LatLng>[
      new LatLng(21.2441408, 81.6319132),
      new LatLng(21.252193, 81.6044256)
    ];
    void _showPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Emergency Contacts'),
            content: Container(
              width: double.maxFinite,
              height: 200,
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final contact = emergencyContacts[index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phoneNumber),
                    trailing: IconButton(
                      icon: Icon(Icons.call),
                      onPressed: () async {
                        String phoneNumber = contact.phoneNumber;
                        if (await canLaunch('tel:$phoneNumber')) {
                          await launch('tel:$phoneNumber');
                        } else {
                          // Handle error
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

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
                              onPressed: () {_showPopup();},
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
                        onPressed: () {
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_Www4oaWIUCocz9',
                            'amount': 100,
                            'name': 'AbleGO Services Pvt.Ltd. .',
                            'description': 'Cab Booking',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '9131186159',
                              'email': 'payments@ablegoservices.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);

                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       bool? isChecked = false;
                          //       bool? upi = false;
                          //       return Dialog(
                          //         child: Container(
                          //           height: 250,
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Icon(Icons.money,
                          //                         color: Colors.green),
                          //                     Text('Pay By Cash',
                          //                         style: TextStyle(
                          //                             color: Colors.green)),
                          //                     Checkbox(
                          //                         value: isChecked,
                          //                         checkColor: Colors.red,
                          //                         activeColor: Colors.green,
                          //                         onChanged: (bool? value1) {
                          //                           setState(() {
                          //                             isChecked = value1;
                          //                           });
                          //                         })
                          //                   ],
                          //                 ),
                          //               ),
                          //               Container(
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Image.asset(
                          //                         'assets/images/upi.png',
                          //                         height: 50,
                          //                         width: 50),
                          //                     Text('Pay By UPI',
                          //                         style: TextStyle(
                          //                             color: Colors.green)),
                          //                     Checkbox(
                          //                         value: upi,
                          //                         checkColor: Colors.red,
                          //                         activeColor: Colors.green,
                          //                         onChanged: (bool? value2) {
                          //                           setState(() {
                          //                             upi = value2;
                          //                           });
                          //                         })
                          //                   ],
                          //                 ),
                          //               ),
                          //               Container(
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Icon(Icons.credit_card,
                          //                         color: Colors.green),
                          //                     Text('Pay By Card',
                          //                         style: TextStyle(
                          //                             color: Colors.green)),
                          //                     Checkbox(
                          //                         value: isChecked,
                          //                         checkColor: Colors.red,
                          //                         activeColor: Colors.green,
                          //                         onChanged: (bool? value1) {
                          //                           setState(() {
                          //                             isChecked = value1;
                          //                           });
                          //                         })
                          //                   ],
                          //                 ),
                          //               ),
                          //               Container(
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Icon(Icons.handshake_outlined,
                          //                         color: Colors.green),
                          //                     Text('AbleGo PayLater',
                          //                         style: TextStyle(
                          //                             color: Colors.green)),
                          //                     Checkbox(
                          //                         value: isChecked,
                          //                         checkColor: Colors.red,
                          //                         activeColor: Colors.green,
                          //                         onChanged: (bool? value1) {
                          //                           setState(() {
                          //                             isChecked = value1;
                          //                           });
                          //                         })
                          //                   ],
                          //                 ),
                          //               ),
                          //               ElevatedButton(
                          //                   onPressed: () {
                          //                     Navigator.pop(context);
                          //                   },
                          //                   child: Text(
                          //                     'Continue',
                          //                     style: TextStyle(
                          //                         color: Colors.white),
                          //                   ),
                          //                   style: ElevatedButton.styleFrom(
                          //                       backgroundColor: Colors.green))
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     })
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
