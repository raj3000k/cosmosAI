import 'package:flutter/material.dart';
import 'package:sample_app/pages/driverSignUp.dart';
import 'package:sample_app/pages/signUp2.dart';

class UserPage extends StatefulWidget {
  @override
  _UserSelect createState() => _UserSelect();
}

class _UserSelect extends State<UserPage> {
  // String? selectedOption;
  String UserType = '\0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Select User Mode ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w800),
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 200),
              height: 100,
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.blue,
                  onPrimary: Colors.white, // Background color
                ),
                icon: Icon(Icons.people_alt_outlined),
                label: Text("Passenger",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DriverSignUp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.blue,
                  onPrimary: Colors.white, // Background color
                ),
                icon: Icon(Icons.directions_car),
                label: Text("Driver", style: TextStyle(fontSize: 30),),
              ),
            ),
            Container(
              child:Image.asset(
              'assets/images/Group2.png',
              fit: BoxFit.fitWidth,
              height: 300,
              alignment: Alignment.bottomCenter,
            )),
          ],
        ),
      ),
    );
  }
}
